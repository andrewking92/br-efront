variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Resource Group Location"
  type        = string
}

variable "vnet_name" {
  description = "Azure VNet Name"
  type        = string
}

variable "vnet_address_space" {
  description = "Azure VNet Address Space"
  type        = string
}

variable "subnet_name" {
  description = "Azure Subnet Name"
  type        = string
}

variable "subnet_prefixes" {
  description = "Azure Subnet Address Prefixes"
  type        = string
}

variable "tags" {
  description = "Azure VNet Tags"
  type        = map(string)
}
