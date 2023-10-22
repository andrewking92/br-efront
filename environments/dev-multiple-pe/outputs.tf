output "azure_setup_resource_group_ids" {
    description = "Resource Group IDs from the azure_setup module."
    value = module.azure_setup.resource_group_ids
}

output "azure_setup_resource_group_locations" {
    description = "Resource Group Locations from the azure_setup module."
    value = module.azure_setup.resource_group_locations
}

output "application_network_vnet_ids" {
  description = "The IDs of the vNets."
  value       = module.application_network.vnet_ids
}

output "application_network_subnet_ids" {
  description = "The IDs of the subnets."
  value       = module.application_network.subnet_ids
}

output "application_network_network_interface_ids" {
  description = "The IDs of the network interface ids."
  value       = module.application_network.network_interface_ids
}

# output "application_vm_ids" {
#   description = "Virtual Machine IDs from the application_vm module"
#   value       = module.application_vm.vm_ids
# }

output "private_endpoint_atlas_private_endpoint_regions" {
  description = "The IDs of the network interface ids."
  value       = module.private_endpoint.atlas_private_endpoint_regions
}



output "atlas_setup_organization_id" {
    value = module.atlas_setup.organization_id
}

output "atlas_setup_project_id" {
    value = module.atlas_setup.project_id
}
