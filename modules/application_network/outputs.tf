output "vnet_id" {
  description = "The ID of the vNet."
  value       = azurerm_virtual_network.test.id
}
