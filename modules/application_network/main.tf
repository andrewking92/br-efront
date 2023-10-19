resource "azurerm_virtual_network" "test" {
  name                  = var.vnet_name
  address_space         = [var.vnet_address_space]
  location              = var.location
  resource_group_name   = var.resource_group_name
  tags                  = var.tags
}


resource "azurerm_subnet" "test" {
  name                  = var.subnet_name
  resource_group_name   = var.resource_group_name
  virtual_network_name  = azurerm_virtual_network.test.name
  address_prefixes      = [var.subnet_prefixes]
}


resource "azurerm_network_interface" "test" {
  name                = "endpoint-test"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.test.id
    private_ip_address_allocation = "Dynamic"
  }
}