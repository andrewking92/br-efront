output "azure_key_vault_key_id" {
  description = "The key identifier for the Azure Key Vault key."
  value       = azurerm_key_vault_key.test.id
}
