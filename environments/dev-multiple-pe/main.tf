provider "mongodbatlas" {
}


provider "azurerm" {
  features {}
}


module "azure_setup" {
  source = "../../modules/azure_setup"
  azure_region_configs   = var.azure_setup_configs

}


module "application_network" {
  source = "../../modules/application_network"
  depends_on            = [ module.azure_setup ]

  for_each              = var.azure_setup_configs

  vnet_name             = each.value.vnet_name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  tags                  = each.value.tags
  vnet_address_space    = each.value.vnet_address_space
  subnet_name           = each.value.subnet_name
  subnet_prefixes       = each.value.subnet_prefixes
}


module "atlas_setup" {
  source = "../../modules/atlas_setup"
  atlas_setup_configs  = var.atlas_setup_configs

}


# module "advanced_cluster" {
#   source = "../../modules/multi_region_cluster"
#   depends_on            = [ module.atlas_setup ]

#   organization_id       = var.organization_id
#   project_id            = var.project_id

#   cluster_name          = var.cluster_name
#   backup_enabled        = var.backup_enabled
#   num_shards            = var.num_shards
#   cloud_provider        = var.cloud_provider
#   instance_size         = var.instance_size
#   cluster_type          = var.cluster_type
#   node_count            = var.node_count
#   region_1              = var.region_1
#   region_1_priority     = var.region_1_priority
#   region_2              = var.region_2
#   region_2_priority     = var.region_2_priority
#   region_3              = var.region_3
#   region_3_priority     = var.region_3_priority

# }


# module "private_endpoint" {
#   source = "../../modules/private_endpoint"
#   depends_on            = [ module.atlas_setup ]

#   for_each              = var.atlas_private_endpoint_configs

#   organization_id       = var.organization_id
#   project_id            = var.project_id
#   cloud_provider        = var.cloud_provider
#   application_region    = var.application_region
#   resource_group_name   = var.resource_group_name

#   location              = module.azure_setup.azurerm_resource_group_test_location
#   request_message       = var.request_message
#   is_manual_connection  = var.is_manual_connection
#   endpoint_name         = var.endpoint_name

#   subnet_id             = module.application_network.azurerm_subnet_id

# }


# module "search_index" {

# }
