data "mongodbatlas_organization" "test" {
  org_id = var.atlas_setup_configs.organization_id
}


data "mongodbatlas_project" "test" {
  project_id = var.atlas_setup_configs.project_id
}


resource "mongodbatlas_database_user" "test" {
  username           = var.atlas_setup_configs.username
  password           = var.atlas_setup_configs.password
  project_id         = var.atlas_setup_configs.project_id
  auth_database_name = "admin"

  roles {
    role_name        = var.atlas_setup_configs.role_name
    database_name    = "admin"
  }

  labels {
    key = var.atlas_setup_configs.username
    value = var.atlas_setup_configs.username
  }

}
