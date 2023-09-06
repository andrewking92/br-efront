resource "azurerm_virtual_network" "test" {
  name                = var.vnet_name
  address_space       = [var.vnet_address_space]
  location            = var.location
  resource_group_name = var.resource_group_name
}


resource "azurerm_subnet" "test" {
  name                                           = var.subnet_name
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = azurerm_virtual_network.test.name
  address_prefixes                               = [var.subnet_prefixes]
  enforce_private_link_service_network_policies  = true
  enforce_private_link_endpoint_network_policies = true
}
