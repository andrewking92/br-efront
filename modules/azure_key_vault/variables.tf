variable "azure_key_vault_configs" {
  description = "Configuration for Azure Key Vault Encryption."
  type = object({
    name                        = string
    location                    = string
    resource_group_name         = string
    tenant_id                   = string
    object_id                   = string
    sku_name                    = string
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    key_name                    = string
  })
}
