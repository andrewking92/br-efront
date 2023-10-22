resource "azurerm_virtual_network" "test" {
  for_each              = var.azure_setup_configs
  name                  = each.value.vnet_name
  address_space         = [each.value.vnet_address_space]
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  tags                  = each.value.tags
}


resource "azurerm_subnet" "test" {
  for_each              = var.azure_setup_configs
  name                  = each.value.subnet_name
  resource_group_name   = each.value.resource_group_name
  virtual_network_name  = azurerm_virtual_network.test[each.key].name
  address_prefixes      = [each.value.subnet_prefixes]
}


resource "azurerm_network_interface" "test" {
  for_each              = var.azure_setup_configs
  name                  = "endpoint-${each.key}"
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.test[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
