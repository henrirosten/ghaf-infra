# SPDX-FileCopyrightText: 2022-2024 TII (SSRC) and the Ghaf contributors
# SPDX-License-Identifier: Apache-2.0
{
  users.users = {
    tervis = {
      description = "Tero Tervala";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDJau0tg0qHhqFVarjNOJLi+ekSZNNqxal4iRD/pwM5W tervis@tervis-thinkpad"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAHVXc4s7e8j1uFsgHPBzpWvSI/hk5Zf6Btuj79D4hf3 tervis@tervis-servu"
      ];
      extraGroups = ["wheel" "networkmanager" "docker"];
    };
  };
}
