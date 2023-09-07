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

variable "cluster_name" {
  description = "Atlas Cluster Name"
  type        = string
}
