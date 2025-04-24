# SPDX-FileCopyrightText: 2022-2025 TII (SSRC) and the Ghaf contributors
# SPDX-License-Identifier: Apache-2.0
{
  self,
  inputs,
  config,
  ...
}:
{
  imports =
    [
      ../ficolo.nix
      ../cross-compilation.nix
      ../builders-common.nix
      inputs.sops-nix.nixosModules.sops
    ]
    ++ (with self.nixosModules; [
      user-github
      user-remote-build
    ]);

  # build1 specific configuration

  sops = {
    defaultSopsFile = ./secrets.yaml;
    secrets.cachix-auth-token.owner = "github";
  };

  networking.hostName = "build1";

  services.monitoring = {
    metrics.enable = true;
    logs.enable = true;
  };

  # Export CACHIX_AUTH_TOKEN for 'github' user to allow cachix uploads.
  # We could use services.cachix-watch-store too, but we don't want to
  # trigger uploads for all nix builds. This allows finer control over
  # when a cachix push is triggered:
  environment.shellInit = ''
    if [ "$USER" = "github" ]; then
      export CACHIX_AUTH_TOKEN=$(cat ${config.sops.secrets.cachix-auth-token.path})
    fi
  '';
}
