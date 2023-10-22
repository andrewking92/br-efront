variable "network_interface_ids" {
  description = "Map of Network Interface IDs"
  type        = map(string)
}

variable "azure_vm_configs" {
  description = "Configuration for Azure VMs"
  type = map(object({
    virtual_machine_name  = string
    public_key_file_path  = string
    location              = string
    resource_group_name   = string
  }))
}