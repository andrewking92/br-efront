resource "azurerm_resource_group" "dynamic_rg" {
  for_each = var.azure_region_configs

  name     = each.value.resource_group_name
  location = each.value.location
}