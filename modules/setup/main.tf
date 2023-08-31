resource "mongodbatlas_database_user" "test" {
  username           = var.username
  password           = var.password
  project_id         = var.project_id
  auth_database_name = "admin"

  roles {
    role_name     = "atlasAdmin"
    database_name = "admin"
  }

  labels {
    key   = "username"
    value = var.username
  }

}


data "mongodbatlas_organization" "test" {
  org_id = var.organization_id
}


data "mongodbatlas_project" "test" {
  project_id = var.project_id
}
