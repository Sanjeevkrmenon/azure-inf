provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "this" {
  name     = "practice-rg"
  location = "eastus2"
}

module "network" {
  source                = "./modules/network"
  vnet_name             = "practice-vnet"
  vnet_address_space    = ["10.0.0.0/16"]
  location              = azurerm_resource_group.this.location
  resource_group_name   = azurerm_resource_group.this.name
  public_subnet_prefixes  = ["10.0.0.0/24", "10.0.1.0/24"]
  private_subnet_prefixes = ["10.0.10.0/24", "10.0.11.0/24"]
}

module "private_vms" {
  source                = "./modules/linux_vm"
  vm_count              = 2
  vm_name_prefix        = "private-vm"
  location              = module.network.location
  resource_group_name   = module.network.vnet_rg
  subnet_ids            = module.network.private_subnet_ids
  zones                 = ["1", "2"]
  admin_username        = "azureuser"
  admin_ssh_public_key  = "<YOUR_SSH_PUBLIC_KEY_HERE>"
}