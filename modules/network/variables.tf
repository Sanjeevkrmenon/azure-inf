variable "vnet_name" {}
variable "vnet_address_space" { type = list(string) }
variable "location" {}
variable "resource_group_name" {}
variable "public_subnet_prefixes" { type = list(string) }
variable "private_subnet_prefixes" { type = list(string) }