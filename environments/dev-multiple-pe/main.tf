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


# module "application_vm" {

# }


# module "azure_ad" {

# }


module "atlas_setup" {
  source = "../../modules/atlas_setup"
  atlas_setup_configs  = var.atlas_setup_configs

}


module "advanced_cluster" {
  source = "../../modules/advanced_cluster"
  depends_on            = [ module.atlas_setup ]

  project_id            = module.atlas_setup.project_id
  atlas_cluster_configs = var.atlas_cluster_configs
  atlas_region_configs  = var.atlas_region_configs

}


module "private_endpoint" {
  source = "../../modules/private_endpoint"
  depends_on            = [ module.atlas_setup ]

  project_id            = module.atlas_setup.project_id

  # for_each = var.atlas_private_endpoint_configs
  # regional_endpoint_configs = each.value
  # module.application_network[each.key]
}


# module "search_index" {

# }
