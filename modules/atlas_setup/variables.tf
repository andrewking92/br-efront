variable "atlas_setup_configs" {
  description = "Configurations for MongoDB Atlas setup"
  type = object({
    organization_id = string
    project_id      = string
    username        = string
    password        = string
    role_name       = string
  })
}
