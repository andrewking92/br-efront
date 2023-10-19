output "resource_group_ids" {
  description = "The IDs of the created resource groups."
  value       = { for rg in azurerm_resource_group.dynamic_rg : rg.name => rg.id }
}

output "resource_group_locations" {
  description = "The locations of the created resource groups."
  value       = { for rg in azurerm_resource_group.dynamic_rg : rg.name => rg.location }
}
