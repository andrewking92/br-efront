resource "azurerm_key_vault" "test" {
  name                = var.azure_key_vault_configs.name
  location            = var.azure_key_vault_configs.location
  resource_group_name = var.azure_key_vault_configs.resource_group_name
  tenant_id           = var.azure_key_vault_configs.tenant_id
  sku_name            = var.azure_key_vault_configs.sku_name
  soft_delete_retention_days = var.azure_key_vault_configs.soft_delete_retention_days

  purge_protection_enabled   = var.azure_key_vault_configs.purge_protection_enabled

  # Access Policy for Key Management and Cryptographic Operations
  access_policy {
    tenant_id = var.azure_key_vault_configs.tenant_id
    object_id = var.azure_key_vault_configs.object_id

    key_permissions = [
      "Create",
      "Delete",
      "Get",
      "List",
      "Purge",
      "Recover",
      "Update",
      "Encrypt",
      "Decrypt"
    ]

    secret_permissions = [
      "Set",
    ]
  }
}


resource "azurerm_key_vault_key" "test" {
  name         = var.azure_key_vault_configs.key_name
  key_vault_id = azurerm_key_vault.test.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}