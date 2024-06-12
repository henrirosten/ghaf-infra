# SPDX-FileCopyrightText: 2022-2024 TII (SSRC) and the Ghaf contributors
# SPDX-License-Identifier: Apache-2.0
{
  self,
  lib,
  inputs,
  pkgs,
  ...
}: let
  jenkins-connection-script = pkgs.writeScript "jenkins-connect.sh" ''
    #!/usr/bin/env bash
    set -eu
    if [ ! -f agent.jar ]; then echo "Error: /var/lib/jenkins/agent.jar not found"; exit 1; fi;
    if [ ! -f secret-file ]; then echo "Error: /var/lib/jenkins/secret-file not found"; exit 1; fi;
    ${pkgs.jdk}/bin/java \
      -jar agent.jar \
      -jnlpUrl https://ghaf-jenkins-controller-henrirosten.northeurope.cloudapp.azure.com/computer/testagent/jenkins-agent.jnlp \
      -secret @secret-file \
      -workDir "/var/lib/jenkins"
  '';
in {
  imports = [
    ../../azure-common.nix
    self.nixosModules.service-openssh
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  boot.binfmt.emulatedSystems = ["aarch64-linux"];

  nix.settings.substituters = [
    "https://ghaf-binary-cache-dev.northeurope.cloudapp.azure.com?priority=20"
    "https://cache.vedenemo.dev"
    "https://cache.nixos.org"
  ];
  nix.settings.trusted-public-keys = [
    "ghaf-infra-dev:EdgcUJsErufZitluMOYmoJDMQE+HFyveI/D270Cr84I="
    "cache.vedenemo.dev:8NhplARANhClUSWJyLVk4WMyy1Wb4rhmWW2u8AejH9E="
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
  ];

  environment.systemPackages = [
    inputs.robot-framework.packages.${pkgs.system}.ghaf-robot
    pkgs.minicom
  ];

  # The Jenkins slave service is very barebones
  # it only installs java and sets up jenkins user
  services.jenkinsSlave.enable = true;

  # Gives jenkins user sudo rights without password and serial connection rights
  users.users.jenkins.extraGroups = ["wheel" "dialout" "tty"];

  # Open connection to Jenkins controller as a systemd service
  systemd.services.jenkins-connection = {
    after = ["network.target"];
    wantedBy = ["multi-user.target"];
    path = [
      pkgs.bashInteractive
      pkgs.coreutils
      pkgs.csvkit
      pkgs.git
      pkgs.iputils
      pkgs.jdk
      pkgs.jq
      pkgs.netcat
      pkgs.nix
      pkgs.openssh
      pkgs.python3
      pkgs.sudo
      pkgs.util-linux
      pkgs.wget
      pkgs.zstd
      inputs.robot-framework.packages.${pkgs.system}.ghaf-robot
    ];
    serviceConfig = {
      Type = "simple";
      User = "jenkins";
      WorkingDirectory = "/var/lib/jenkins";
      ExecStart = "${jenkins-connection-script}";
      Restart = "on-failure";
      RestartSec = 5;
    };
    # Give up if it fails more than 5 times in 60 second interval
    startLimitBurst = 5;
    startLimitIntervalSec = 60;
  };

  # configuration file for test hardware devices
  environment.etc."jenkins/test_config.json".text = builtins.toJSON {
    addresses = {
      OrinAGX1 = {
        serial_port = "/dev/ttyACM0";
        device_ip_address = "172.18.16.54";
        socket_ip_address = "172.18.16.74";
        plug_type = "TAPOP100v2";
        location = "testagent";
        usbhub_serial = "0x2954223B";
        threads = 8;
      };
    };
  };

  system.stateVersion = "24.05";
}
