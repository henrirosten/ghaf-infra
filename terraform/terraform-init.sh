#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2024 Technology Innovation Institute (TII)
#
# SPDX-License-Identifier: Apache-2.0

set -e # exit immediately if a command fails
set -u # treat unset variables as an error and exit
set -o pipefail # exit if any pipeline command fails

################################################################################

# This script is a helper to initialize the ghaf terraform infra:
# - init terraform state storage
# - init persistent secrets such as binary cache signing key (per environment)
# - init persistent binary cache storage (per environment)
# - init workspace-specific persistent such as caddy disks (per environment)
#
# This script will not do anything if the initialization has already been done.
# In other words, it's safe to run this script many times. It will not destroy
# or re-initialize anything if the initialization has already taken place.

################################################################################

MYDIR=$(dirname "$0")
DEBUG="false"

################################################################################

exit_unless_command_exists () {
    if ! command -v "$1" &>"$OUT"; then
        echo "Error: command '$1' is not installed" >&2
        exit 1
    fi
}

init_state_storage () {
    echo "[+] Initializing state storage"
    # See: ./state-storage
    pushd "$MYDIR/state-storage" >"$OUT"
    terraform init >"$OUT"
    if ! terraform apply -auto-approve &>"$OUT"; then
        echo "[+] State storage is already initialized"
    fi
    popd >"$OUT"
}

import_bincache_sigkey () {
    env="$1"
    echo "[+] Importing binary cache signing key '$env'"
    # Skip import if signing key is imported already
    if terraform state list | grep -q secret_resource.binary_cache_signing_key_"$env"; then
        echo "[+] Binary cache signing key is already imported"
        return
    fi
    # Generate and import the key
    nix-store --generate-binary-cache-key "ghaf-infra-$env" sigkey-secret.tmp "sigkey-public-$env.tmp"
    terraform import secret_resource.binary_cache_signing_key_"$env" "$(< ./sigkey-secret.tmp)"
    rm -f sigkey-secret.tmp
}

init_persistent () {
    echo "[+] Initializing persistent"
    # See: ./persistent
    pushd "$MYDIR/persistent" >"$OUT"
    terraform init >"$OUT"
    # Default persistent instance: 'eun' (northeurope)
    terraform workspace select eun &>"$OUT" || terraform workspace new eun
    import_bincache_sigkey "prod"
    import_bincache_sigkey "dev"
    echo "[+] Applying possible changes in ./persistent"
    terraform apply -auto-approve >"$OUT"
    popd >"$OUT"

    # Assigns $WORKSPACE variable
    # shellcheck source=/dev/null
    source "$MYDIR/playground/terraform-playground.sh" &>"$OUT"
    generate_azure_private_workspace_name

    echo "[+] Initializing workspace-specific persistent"
    # See: ./persistent/workspace-specific
    pushd "$MYDIR/persistent/workspace-specific" >"$OUT"
    terraform init >"$OUT"
    echo "[+] Applying possible changes in ./persistent/workspace-specific"
    for ws in "dev" "prod" "$WORKSPACE"; do
        terraform workspace select "$ws" &>"$OUT" || terraform workspace new "$ws"
        if ! terraform apply -auto-approve &>"$OUT"; then
            echo "[+] Workspace-specific persistent ($ws) is already initialized"
        fi
        # Stop terraform from tracking the state of 'workspace-specific'
        # persistent resources. This script initially creates such resources
        # (above), but tells terraform to not track them (below). This means,
        # for instance, that removing such resources would need to happen
        # manually through Azure web UI or az cli client. We assume the
        # workspace-specific persistent resources really are persistent,
        # meaning, it would be a rare occasion when they had to be
        # (manually) removed.
        #
        # Why do we not track the state with terraform?
        # If we let terraform track the state of such resources, we would
        # end-up in a conflict when someone adds a new workspace-specific
        # resource due the shared nature of 'prod' and 'dev' workspaces. In
        # such a conflict condition, someone running this script with the
        # old version of terraform code (i.e. version that does not include
        # adding the new resource) would always remove the resource on
        # `terraform apply`, whereas, someone running this script
        # with the new workspace-specific resource would always add the new
        # resource on apply, due to the shared 'dev' and 'prod' workspaces.
        while read -r line; do
            if [ -n "$line" ]; then
                terraform state rm "$line" >"$OUT";
            fi
        # TODO: remove the 'binary_cache_caddy_state' filter from the below
        # grep when all users have migrated to the version of this script
        # on which the `terraform state rm` is included
        done < <(terraform state list | grep -vP "(^data\.|binary_cache_caddy_state)")
    done
    popd >"$OUT"
}

init_terraform () {
    echo "[+] Running terraform init"
    terraform -chdir="$MYDIR" init >"$OUT"
}

################################################################################

main () {
    if [ "$DEBUG" = "true" ]; then
        set -x
        OUT=/dev/stderr
    else
        OUT=/dev/null
    fi

    exit_unless_command_exists az
    exit_unless_command_exists terraform
    exit_unless_command_exists nix-store
    exit_unless_command_exists grep

    init_state_storage
    init_persistent
    init_terraform
    echo "[+] Listing workspaces:"
    terraform workspace list
    echo "[+] Done, use 'terraform workspace select <name>' to select a"\
         "workspace, then 'terraform [validate|plan|apply]' to work with the"\
         "given ghaf-infra environment"
}

main "$@"

################################################################################