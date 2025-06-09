output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}
output "public_subnet_ids" {
  value = azurerm_subnet.public[*].id
}
output "private_subnet_ids" {
  value = azurerm_subnet.private[*].id
}
output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}
output "vnet_rg" {
  value = azurerm_virtual_network.vnet.resource_group_name
}
output "location" {
  value = azurerm_virtual_network.vnet.location
}