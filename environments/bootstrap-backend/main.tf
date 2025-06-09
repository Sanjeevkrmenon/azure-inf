provider "azurerm" {
  features {}
  subscription_id = "69213811-04d8-45e3-94a9-e4d7eddf35cf"
}
resource "azurerm_resource_group" "rg" {
  name     = "tfstate-rg"
  location = "eastus"
}

resource "azurerm_storage_account" "sa" {
  name                     = "tfstate${random_id.suffix.hex}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.sa.id
  container_access_type = "private"
}

resource "random_id" "suffix" {
  byte_length = 4
}

output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "container_name" {
  value = azurerm_storage_container.container.name
}