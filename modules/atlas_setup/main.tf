data "mongodbatlas_organization" "test" {
  org_id = var.atlas_setup_configs.organization_id
}


resource "mongodbatlas_project" "test" {
  org_id = data.mongodbatlas_organization.test.org_id
  name   = var.atlas_setup_configs.project_name
}


resource "mongodbatlas_private_endpoint_regional_mode" "test" {
  project_id = mongodbatlas_project.test.id
  enabled    = true
}
