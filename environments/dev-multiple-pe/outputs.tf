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
  value       = { for key, module_instance in module.application_network : key => module_instance.vnet_id }
}

output "application_network_subnet_ids" {
  description = "The IDs of the subnets."
  value       = { for key, module_instance in module.application_network : key => module_instance.subnet_id }
}

output "atlas_setup_organization_id" {
    value = module.atlas_setup.organization_id
}

output "atlas_setup_project_id" {
    value = module.atlas_setup.project_id
}
