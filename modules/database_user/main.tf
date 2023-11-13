resource "mongodbatlas_database_user" "test" {
  project_id         = var.project_id
  username           = var.atlas_db_user_config.username
  password           = var.atlas_db_user_config.password
  auth_database_name = var.atlas_db_user_config.admin_db

  roles {
    role_name        = var.atlas_db_user_config.role_name
    database_name    = var.atlas_db_user_config.admin_db
  }

  labels {
    key = var.atlas_db_user_config.username
    value = var.atlas_db_user_config.username
  }

}
