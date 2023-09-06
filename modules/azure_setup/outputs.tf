output "azurerm_resource_group_test_id" {
  description = "Azure Resource Group ID"
  value       = data.azurerm_resource_group.test.id
}

output "azurerm_resource_group_test_location" {
  description = "Azure Resource Group ID"
  value       = data.azurerm_resource_group.test.location
}