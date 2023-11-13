variable "project_id" {
  description = "Atlas Project ID"
  type        = string
}

variable "atlas_db_user_config" {
  description = "Configuration for Atlas DB User."
  type = object({
    username              = string
    password              = string
    role_name             = string
    admin_db              = string
  })
}
