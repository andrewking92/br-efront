provider "mongodbatlas" {
}


provider "azurerm" {
  features {}
}


module "azure_setup" {
  source = "../../modules/azure_setup"
  azure_region_configs   = var.azure_setup_configs

}


# module "azure_ad" {

# }


module "azure_key_vault" {
  source = "../../modules/azure_key_vault"
  depends_on            = [ module.azure_setup ]

  azure_key_vault_configs   = var.azure_key_vault_configs

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


module "atlas_setup" {
  source = "../../modules/atlas_setup"
  atlas_setup_configs  = var.atlas_setup_configs

}


# module "role_mappings" {

# }


# module "audit_log" {
#   source = "../../modules/audit_log"
#   depends_on            = [ module.atlas_setup ]

#   project_id            = module.atlas_setup.project_id
#   atlas_audit_config    = var.atlas_audit_config

# }


# module "encryption_at_rest" {
#   source = "../../modules/encryption_at_rest"
#   depends_on                 = [ module.atlas_setup ]

#   project_id                 = module.atlas_setup.project_id
#   key_identifer              = module.azure_key_vault.azure_key_vault_key_id
#   atlas_encryption_config    = var.atlas_encryption_config

# }


# module "database_user" {
#   source = "../../modules/database_user"
#   depends_on              = [ module.atlas_setup ]

#   project_id              = module.atlas_setup.project_id
#   atlas_db_user_config    = var.atlas_db_user_config

# }


# module "advanced_cluster" {
#   source = "../../modules/advanced_cluster"
#   depends_on            = [ module.encryption_at_rest ]

#   project_id            = module.atlas_setup.project_id
#   atlas_cluster_configs = var.atlas_cluster_configs
#   atlas_region_configs  = var.atlas_region_configs

# }


# module "private_endpoint" {
#   source = "../../modules/private_endpoint"
#   depends_on            = [ module.atlas_setup ]

#   project_id                          = module.atlas_setup.project_id
#   subnet_ids                          = module.application_network.subnet_ids

#   atlas_private_endpoint_regions      = var.atlas_private_endpoint_regions

#   atlas_private_endpoint_configs_east = var.atlas_private_endpoint_configs_east
#   atlas_private_endpoint_configs_west = var.atlas_private_endpoint_configs_west

# }


# module "backup_policies" {
#   source = "../../modules/backup_policies"
#   depends_on            = [ module.advanced_cluster ]

# }


# module "database_alerts" {
#   source = "../../modules/database_alerts"

# }
