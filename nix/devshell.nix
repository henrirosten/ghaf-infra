# SPDX-FileCopyrightText: 2023 Technology Innovation Institute (TII)
#
# SPDX-License-Identifier: Apache-2.0
{
  perSystem = {
    pkgs,
    inputs',
    ...
  }: let
    update-jenkins-plugins = with pkgs; let
      plugins = with builtins;
        concatStringsSep " "
        (map
          (plugin: "-p ${plugin}")
          [
            "configuration-as-code"
            "github"
            "workflow-aggregator"
          ]);
    in
      # Update jenkins plugins with:
      # nix develop --command 'update-jenkins-plugins' >hosts/azure/jenkins-controller/jenkins-plugins.nix && nix fmt
      # Note: nixpkgs jenkins version might not work with the plugin versions
      # updated with 'update-jenkins-plugins'.
      # It seems it would be very hard to maintain installed plugin versions like this.
      writeShellApplication {
        name = "update-jenkins-plugins";
        text = ''
          ${pkgs.lib.getExe' inputs'.jenkinsPlugins2nix.packages.jenkinsPlugins2nix "jenkinsPlugins2nix"} ${plugins}
        '';
      };
  in {
    devShells.default = pkgs.mkShell {
      packages = with pkgs; [
        azure-cli
        git
        jq
        nix
        nixos-rebuild
        python3.pkgs.black
        python3.pkgs.colorlog
        python3.pkgs.deploykit
        python3.pkgs.invoke
        python3.pkgs.pycodestyle
        python3.pkgs.pylint
        python3.pkgs.tabulate
        reuse
        sops
        ssh-to-age
        (terraform.withPlugins (p: [
          p.azurerm
          p.external
          p.local
          p.null
          p.random
          p.secret
          p.sops
          p.tls
        ]))
        update-jenkins-plugins
      ];
    };
  };
}
