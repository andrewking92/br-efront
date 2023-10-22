output "vnet_ids" {
  description = "The IDs of the vNets"
  value       = { for k, v in azurerm_virtual_network.test : k => v.id }
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = { for k, v in azurerm_subnet.test : k => v.id }
}

output "network_interface_ids" {
  description = "The IDs of the network interfaces"
  value       = { for k, v in azurerm_network_interface.test : k => v.id }
}
