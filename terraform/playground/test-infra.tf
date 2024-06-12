# SPDX-FileCopyrightText: 2022-2024 TII (SSRC) and the Ghaf contributors
# SPDX-License-Identifier: Apache-2.0

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  # Backend for storing tfstate (see ../state-storage)
  backend "azurerm" {
    resource_group_name  = "ghaf-infra-state"
    storage_account_name = "ghafinfratfstatestorage"
    container_name       = "ghaf-infra-tfstate-container"
    key                  = "ghaf-infra-playground.tfstate"
  }
}
provider "azurerm" {
  features {}
}
# Resource group
resource "azurerm_resource_group" "playground_rg" {
  name     = "ghaf-infra-playground-${terraform.workspace}"
  location = "northeurope"
}
# Virtual Network
resource "azurerm_virtual_network" "ghaf_infra_tf_vnet" {
  name                = "ghaf-infra-tf-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.playground_rg.location
  resource_group_name = azurerm_resource_group.playground_rg.name
}
# Subnet
resource "azurerm_subnet" "playground_subnet" {
  name                 = "ghaf-infra-tf-subnet"
  resource_group_name  = azurerm_resource_group.playground_rg.name
  virtual_network_name = azurerm_virtual_network.ghaf_infra_tf_vnet.name
  address_prefixes     = ["10.0.5.0/24"]
}
# read ssh-keys.yaml into local.ssh_keys
locals {
  ssh_keys = yamldecode(file("../../ssh-keys.yaml"))
}

################################################################################

# Image storage

# Create a random string
resource "random_string" "imgstr" {
  length  = "12"
  special = "false"
  upper   = false
}

resource "azurerm_storage_account" "vm_images" {
  name                            = "nixosimages${random_string.imgstr.result}"
  resource_group_name             = azurerm_resource_group.playground_rg.name
  location                        = azurerm_resource_group.playground_rg.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_container" "vm_images" {
  name                  = "ghaf-test-vm-images"
  storage_account_name  = azurerm_storage_account.vm_images.name
  container_access_type = "private"
}

################################################################################

# VM

module "test_image" {
  source = "../modules/azurerm-nix-vm-image"

  nix_attrpath   = "outputs.nixosConfigurations.az-testagent.config.system.build.azureImage"
  nix_entrypoint = "${path.module}/../.."

  name                = "playground_vm_img"
  resource_group_name = azurerm_resource_group.playground_rg.name
  location            = azurerm_resource_group.playground_rg.location

  storage_account_name   = azurerm_storage_account.vm_images.name
  storage_container_name = azurerm_storage_container.vm_images.name
}

module "test_vm" {
  source = "../modules/azurerm-linux-vm"

  resource_group_name = azurerm_resource_group.playground_rg.name
  location            = azurerm_resource_group.playground_rg.location

  virtual_machine_name = "ghaf-playground-${terraform.workspace}"
  # 'Standard_E2_v5' (2 vCPUs, 16 GiB RAM)
  # Full list of Azure image sizes are available in:
  # https://azure.microsoft.com/en-us/pricing/details/virtual-machines/linux/#pricing
  virtual_machine_size         = "Standard_E2_v5"
  virtual_machine_source_image = module.test_image.image_id
  virtual_machine_osdisk_size  = "100"
  virtual_machine_custom_data = join("\n", ["#cloud-config", yamlencode({

    users = [
      for user in toset(["hrosten"]) : {
        name                = user
        sudo                = "ALL=(ALL) NOPASSWD:ALL"
        ssh_authorized_keys = local.ssh_keys[user]
      }
    ]
  })])

  allocate_public_ip = true
  subnet_id          = azurerm_subnet.playground_subnet.id
}

# Allow inbound SSH
resource "azurerm_network_security_group" "test_vm" {
  name                = "test-vm"
  resource_group_name = azurerm_resource_group.playground_rg.name
  location            = azurerm_resource_group.playground_rg.location
  security_rule {
    name                       = "AllowSSH"
    priority                   = 400
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = [22]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_network_interface_security_group_association" "test_vm" {
  network_interface_id      = module.test_vm.virtual_machine_network_interface_id
  network_security_group_id = azurerm_network_security_group.test_vm.id
}

################################################################################

