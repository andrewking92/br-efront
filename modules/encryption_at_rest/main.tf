resource "mongodbatlas_encryption_at_rest" "test" {
  project_id = var.project_id

  azure_key_vault_config {
    enabled             = var.atlas_encryption_config.enabled
    client_id           = var.atlas_encryption_config.client_id
    azure_environment   = var.atlas_encryption_config.azure_environment
    subscription_id     = var.atlas_encryption_config.subscription_id
    resource_group_name = var.atlas_encryption_config.resource_group_name
    key_vault_name      = var.atlas_encryption_config.key_vault_name
    key_identifier      = var.key_identifer
    secret              = var.atlas_encryption_config.secret
    tenant_id           = var.atlas_encryption_config.tenant_id
  }
}
