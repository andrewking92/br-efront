provider "mongodbatlas" {
}


provider "azurerm" {
  features {}
}


module "atlas_setup" {
  source = "../../modules/atlas_setup"

  organization_id       = var.organization_id
  project_id            = var.project_id

  username              = var.username
  password              = var.password
  role_name             = var.role_name

}


module "azure_setup" {
  source = "../../modules/azure_setup"

  resource_group_name   = var.resource_group_name

}


module "application_network" {
  source = "../../modules/application_network"

  resource_group_name   = var.resource_group_name
  location              = module.azure_setup.azurerm_resource_group_test_location
}


module "advanced_cluster" {
  source = "../../modules/advanced_cluster"

  organization_id       = var.organization_id
  project_id            = var.project_id

  cluster_name          = var.cluster_name
  backup_enabled        = var.backup_enabled
  num_shards            = var.num_shards
  cloud_provider        = var.cloud_provider
  instance_size         = var.instance_size
  cluster_type          = var.cluster_type
  node_count            = var.node_count
  region_1              = var.region_1
  region_1_priority     = var.region_1_priority
  region_2              = var.region_2
  region_2_priority     = var.region_2_priority
  region_3              = var.region_3
  region_3_priority     = var.region_3_priority
}


module "private_endpoint" {
  source = "../../modules/private_endpoint"

  organization_id       = var.organization_id
  project_id            = var.project_id
  cloud_provider        = var.cloud_provider

  resource_group_name   = var.resource_group_name
  location              = module.azure_setup.azurerm_resource_group_test_location
}
