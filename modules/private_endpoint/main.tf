resource "mongodbatlas_privatelink_endpoint" "test" {
  project_id                  = var.project_id
  provider_name               = var.cloud_provider
  region                      = var.application_region
}


resource "azurerm_private_endpoint" "test" {
  name                        = var.endpoint_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  subnet_id                   = var.subnet_id

  private_service_connection {
    name                           = mongodbatlas_privatelink_endpoint.test.private_link_service_name
    private_connection_resource_id = mongodbatlas_privatelink_endpoint.test.private_link_service_resource_id
    is_manual_connection           = var.is_manual_connection
    request_message                = var.request_message
  }

}


resource "mongodbatlas_privatelink_endpoint_service" "test" {
  project_id                  = mongodbatlas_privatelink_endpoint.test.project_id
  private_link_id             = mongodbatlas_privatelink_endpoint.test.private_link_id
  endpoint_service_id         = azurerm_private_endpoint.test.id
  private_endpoint_ip_address = azurerm_private_endpoint.test.private_service_connection[0].private_ip_address
  provider_name               = var.cloud_provider
}
