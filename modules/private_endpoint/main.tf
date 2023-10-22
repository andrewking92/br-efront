resource "mongodbatlas_privatelink_endpoint" "test" {
  for_each = var.atlas_private_endpoint_regions

  project_id                  = var.project_id
  provider_name               = each.value.cloud_provider
  region                      = each.value.application_region

}


resource "azurerm_private_endpoint" "test_east" {
  for_each = var.atlas_private_endpoint_configs_east

  name                = each.value.endpoint_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  subnet_id           = var.subnet_ids["east"]

  private_service_connection {
    name                           = mongodbatlas_privatelink_endpoint.test[each.key].private_link_service_name
    private_connection_resource_id = mongodbatlas_privatelink_endpoint.test[each.key].private_link_service_resource_id
    is_manual_connection           = true
    request_message                = "Azure Private Link test"
  }
}


resource "mongodbatlas_privatelink_endpoint_service" "test_east" {
  for_each = var.atlas_private_endpoint_configs_east

  project_id                  = mongodbatlas_privatelink_endpoint.test[each.key].project_id
  private_link_id             = mongodbatlas_privatelink_endpoint.test[each.key].private_link_id
  endpoint_service_id         = azurerm_private_endpoint.test_east[each.key].id
  private_endpoint_ip_address = azurerm_private_endpoint.test_east[each.key].private_service_connection.0.private_ip_address
  provider_name               = "AZURE"
}


resource "azurerm_private_endpoint" "test_west" {
  for_each = var.atlas_private_endpoint_configs_west

  name                = each.value.endpoint_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  subnet_id           = var.subnet_ids["west"]

  private_service_connection {
    name                           = mongodbatlas_privatelink_endpoint.test[each.key].private_link_service_name
    private_connection_resource_id = mongodbatlas_privatelink_endpoint.test[each.key].private_link_service_resource_id
    is_manual_connection           = true
    request_message                = "Azure Private Link test"
  }
}


resource "mongodbatlas_privatelink_endpoint_service" "test_west" {
  for_each = var.atlas_private_endpoint_configs_west

  project_id                  = mongodbatlas_privatelink_endpoint.test[each.key].project_id
  private_link_id             = mongodbatlas_privatelink_endpoint.test[each.key].private_link_id
  endpoint_service_id         = azurerm_private_endpoint.test_west[each.key].id
  private_endpoint_ip_address = azurerm_private_endpoint.test_west[each.key].private_service_connection.0.private_ip_address
  provider_name               = "AZURE"
}
