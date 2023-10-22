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

  azure_setup_configs   = var.azure_setup_configs

}


module "application_vm" {
  source = "../../modules/application_vm"
  depends_on            = [ module.application_network ]

  azure_vm_configs      = var.azure_vm_configs
  network_interface_ids = module.application_network.network_interface_ids

}


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

  project_id                          = module.atlas_setup.project_id
  subnet_ids                          = module.application_network.subnet_ids

  atlas_private_endpoint_regions      = var.atlas_private_endpoint_regions

  atlas_private_endpoint_configs_east = var.atlas_private_endpoint_configs_east
  atlas_private_endpoint_configs_west = var.atlas_private_endpoint_configs_west

}


# module "search_index" {
#   source = "../../modules/search_index"
#   depends_on                  = [ module.database_and_collection ]

#   project_id                  = module.atlas_setup.project_id
#   atlas_search_index_configs  = var.atlas_search_index_configs
# }
