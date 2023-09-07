variable "virtual_machine_name" {
  description = "Azure VM Name"
  type        = string
}

variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Resource Group Location"
  type        = string
}

variable "public_key_file_path" {
  description = "Azure Public Key File Path"
  type        = string
}

variable "network_interface_id" {
  description = "Azure Network Interface ID"
  type        = string
}
