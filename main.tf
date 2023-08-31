provider "mongodbatlas" {
}


module "setup" {
  source = "./modules/setup"

  organization_id = var.organization_id
  project_id = var.project_id
}


module "advanced_cluster" {
  source = "./modules/advanced_cluster"

  organization_id = var.organization_id
  project_id = var.project_id
}


module "private_endpoint" {
  source = "./modules/private_endpoint"

  organization_id = var.organization_id
  project_id = var.project_id
}
