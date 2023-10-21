locals {
    subnet_ids = {
        east = "/subscriptions/e4be549c-178e-4963-a63e-aeee9fc10156/resourceGroups/atlas-us-east/providers/Microsoft.Network/virtualNetworks/app-vnet-east/subnets/app-subnet-east"
        west = "/subscriptions/e4be549c-178e-4963-a63e-aeee9fc10156/resourceGroups/atlas-us-west/providers/Microsoft.Network/virtualNetworks/app-vnet-west/subnets/app-subnet-west"
    }
}


# resource "mongodbatlas_privatelink_endpoint" "test" {
#   for_each                    = var.regional_endpoint_configs
#   project_id                  = var.project_id
#   provider_name               = each.value.cloud_provider
#   region                      = each.value.application_region
# }


# resource "azurerm_private_endpoint" "test" {
#   for_each                    = var.regional_endpoint_configs
#   name                        = each.value.endpoint_name
#   location                    = each.value.location
#   resource_group_name         = each.value.resource_group_name
#   subnet_id                   = each.value.resource_group_name == "atlas-us-east" ? local.subnet_ids["east"] : local.subnet_ids["west"]

#   private_service_connection {
#     name                           = mongodbatlas_privatelink_endpoint.test.private_link_service_name
#     private_connection_resource_id = mongodbatlas_privatelink_endpoint.test.private_link_service_resource_id
#     is_manual_connection           = var.is_manual_connection
#     request_message                = var.request_message
#   }

# }


# resource "mongodbatlas_privatelink_endpoint_service" "test" {
#   project_id                  = var.project_id
#   private_link_id             = mongodbatlas_privatelink_endpoint.test.private_link_id
#   endpoint_service_id         = azurerm_private_endpoint.test.id
#   private_endpoint_ip_address = azurerm_private_endpoint.test.private_service_connection[0].private_ip_address
#   provider_name               = var.cloud_provider
# }


resource "mongodbatlas_privatelink_endpoint" "test_00" {
  project_id                  = var.project_id
  provider_name               = "AZURE"
  region                      = "eastus"
}


resource "mongodbatlas_privatelink_endpoint" "test_01" {
  project_id                  = var.project_id
  provider_name               = "AZURE"
  region                      = "eastus2"
}


resource "mongodbatlas_privatelink_endpoint" "test_02" {
  project_id                  = var.project_id
  provider_name               = "AZURE"
  region                      = "westus"
}








resource "azurerm_private_endpoint" "test_east_00" {
  name                        = "endpoint-eastus"
  location                    = "East US"
  resource_group_name         = "atlas-us-east"
  subnet_id                   = "/subscriptions/e4be549c-178e-4963-a63e-aeee9fc10156/resourceGroups/atlas-us-east/providers/Microsoft.Network/virtualNetworks/app-vnet-east/subnets/app-subnet-east"

  private_service_connection {
    name                           = mongodbatlas_privatelink_endpoint.test_00.private_link_service_name
    private_connection_resource_id = mongodbatlas_privatelink_endpoint.test_00.private_link_service_resource_id
    is_manual_connection           = true
    request_message                = "Azure Private Link Test"
  }

}


resource "mongodbatlas_privatelink_endpoint_service" "test_east_00" {
  project_id                  = var.project_id
  private_link_id             = mongodbatlas_privatelink_endpoint.test_00.private_link_id
  endpoint_service_id         = azurerm_private_endpoint.test_east_00.id
  private_endpoint_ip_address = azurerm_private_endpoint.test_east_00.private_service_connection[0].private_ip_address
  provider_name               = "AZURE"
}


resource "azurerm_private_endpoint" "test_east_01" {
  name                        = "endpoint-eastus2"
  location                    = "East US"
  resource_group_name         = "atlas-us-east"
  subnet_id                   = "/subscriptions/e4be549c-178e-4963-a63e-aeee9fc10156/resourceGroups/atlas-us-east/providers/Microsoft.Network/virtualNetworks/app-vnet-east/subnets/app-subnet-east"

  private_service_connection {
    name                           = mongodbatlas_privatelink_endpoint.test_01.private_link_service_name
    private_connection_resource_id = mongodbatlas_privatelink_endpoint.test_01.private_link_service_resource_id
    is_manual_connection           = true
    request_message                = "Azure Private Link Test"
  }

}


resource "mongodbatlas_privatelink_endpoint_service" "test_east_01" {
  project_id                  = var.project_id
  private_link_id             = mongodbatlas_privatelink_endpoint.test_01.private_link_id
  endpoint_service_id         = azurerm_private_endpoint.test_east_01.id
  private_endpoint_ip_address = azurerm_private_endpoint.test_east_01.private_service_connection[0].private_ip_address
  provider_name               = "AZURE"
}


resource "azurerm_private_endpoint" "test_east_02" {
  name                        = "endpoint-westus"
  location                    = "East US"
  resource_group_name         = "atlas-us-east"
  subnet_id                   = "/subscriptions/e4be549c-178e-4963-a63e-aeee9fc10156/resourceGroups/atlas-us-east/providers/Microsoft.Network/virtualNetworks/app-vnet-east/subnets/app-subnet-east"

  private_service_connection {
    name                           = mongodbatlas_privatelink_endpoint.test_02.private_link_service_name
    private_connection_resource_id = mongodbatlas_privatelink_endpoint.test_02.private_link_service_resource_id
    is_manual_connection           = true
    request_message                = "Azure Private Link Test"
  }

}


resource "mongodbatlas_privatelink_endpoint_service" "test_east_02" {
  project_id                  = var.project_id
  private_link_id             = mongodbatlas_privatelink_endpoint.test_02.private_link_id
  endpoint_service_id         = azurerm_private_endpoint.test_east_02.id
  private_endpoint_ip_address = azurerm_private_endpoint.test_east_02.private_service_connection[0].private_ip_address
  provider_name               = "AZURE"
}








resource "azurerm_private_endpoint" "test_west_00" {
  name                        = "endpoint-eastus"
  location                    = "West US"
  resource_group_name         = "atlas-us-west"
  subnet_id                   = "/subscriptions/e4be549c-178e-4963-a63e-aeee9fc10156/resourceGroups/atlas-us-west/providers/Microsoft.Network/virtualNetworks/app-vnet-west/subnets/app-subnet-west"

  private_service_connection {
    name                           = mongodbatlas_privatelink_endpoint.test_00.private_link_service_name
    private_connection_resource_id = mongodbatlas_privatelink_endpoint.test_00.private_link_service_resource_id
    is_manual_connection           = true
    request_message                = "Azure Private Link Test"
  }

}


resource "mongodbatlas_privatelink_endpoint_service" "test_west_00" {
  project_id                  = var.project_id
  private_link_id             = mongodbatlas_privatelink_endpoint.test_00.private_link_id
  endpoint_service_id         = azurerm_private_endpoint.test_west_00.id
  private_endpoint_ip_address = azurerm_private_endpoint.test_west_00.private_service_connection[0].private_ip_address
  provider_name               = "AZURE"
}


resource "azurerm_private_endpoint" "test_west_01" {
  name                        = "endpoint-eastus2"
  location                    = "West US"
  resource_group_name         = "atlas-us-west"
  subnet_id                   = "/subscriptions/e4be549c-178e-4963-a63e-aeee9fc10156/resourceGroups/atlas-us-west/providers/Microsoft.Network/virtualNetworks/app-vnet-west/subnets/app-subnet-west"

  private_service_connection {
    name                           = mongodbatlas_privatelink_endpoint.test_01.private_link_service_name
    private_connection_resource_id = mongodbatlas_privatelink_endpoint.test_01.private_link_service_resource_id
    is_manual_connection           = true
    request_message                = "Azure Private Link Test"
  }

}


resource "mongodbatlas_privatelink_endpoint_service" "test_west_01" {
  project_id                  = var.project_id
  private_link_id             = mongodbatlas_privatelink_endpoint.test_01.private_link_id
  endpoint_service_id         = azurerm_private_endpoint.test_west_01.id
  private_endpoint_ip_address = azurerm_private_endpoint.test_west_01.private_service_connection[0].private_ip_address
  provider_name               = "AZURE"
}


resource "azurerm_private_endpoint" "test_west_02" {
  name                        = "endpoint-westus"
  location                    = "West US"
  resource_group_name         = "atlas-us-west"
  subnet_id                   = "/subscriptions/e4be549c-178e-4963-a63e-aeee9fc10156/resourceGroups/atlas-us-west/providers/Microsoft.Network/virtualNetworks/app-vnet-west/subnets/app-subnet-west"

  private_service_connection {
    name                           = mongodbatlas_privatelink_endpoint.test_02.private_link_service_name
    private_connection_resource_id = mongodbatlas_privatelink_endpoint.test_02.private_link_service_resource_id
    is_manual_connection           = true
    request_message                = "Azure Private Link Test"
  }

}


resource "mongodbatlas_privatelink_endpoint_service" "test_west_02" {
  project_id                  = var.project_id
  private_link_id             = mongodbatlas_privatelink_endpoint.test_02.private_link_id
  endpoint_service_id         = azurerm_private_endpoint.test_west_02.id
  private_endpoint_ip_address = azurerm_private_endpoint.test_west_02.private_service_connection[0].private_ip_address
  provider_name               = "AZURE"
}
