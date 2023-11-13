variable "project_id" {
  description = "Atlas Project ID"
  type        = string
}

variable "key_identifer" {
  description = "Azure Key Identifer"
  type        = string
}

variable "atlas_encryption_config" {
  description = "Configuration for Atlas Encryption at Rest."
  type = object({
    enabled                 = bool
    client_id               = string
    azure_environment       = string
    subscription_id         = string
    resource_group_name     = string
    key_vault_name          = string
    secret                  = string
    tenant_id               = string
  })
}
