variable "vm_count" {}
variable "vm_name_prefix" {}
variable "location" {}
variable "resource_group_name" {}
variable "subnet_ids" { type = list(string) }
variable "zones" { type = list(string) }
variable "admin_username" {}
variable "admin_ssh_public_key" {}