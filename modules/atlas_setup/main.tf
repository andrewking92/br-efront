data "mongodbatlas_organization" "test" {
  org_id = var.atlas_setup_configs.organization_id
}


data "mongodbatlas_project" "test" {
  project_id = var.atlas_setup_configs.project_id
}


resource "mongodbatlas_private_endpoint_regional_mode" "test" {
  project_id = var.atlas_setup_configs.project_id
  enabled    = true
}
