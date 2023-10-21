output "vnet_id" {
  description = "The ID of the vNet"
  value       = azurerm_virtual_network.test.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.test.id
}
