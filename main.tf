provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "practice_rg" {
  name     = var.rg_name
  location = var.rg_location
}