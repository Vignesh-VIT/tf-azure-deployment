output "secret_id" {
  description = "ID of the Key Vault secret"
  value       = azurerm_key_vault_secret.secret.id
}

output "secret_name" {
  description = "Name of the Key Vault secret"
  value       = azurerm_key_vault_secret.secret.name
}

output "secret_version" {
  description = "Current version of the Key Vault secret"
  value       = azurerm_key_vault_secret.secret.version
}

output "secret_versionless_id" {
  description = "Versionless ID of the Key Vault secret"
  value       = azurerm_key_vault_secret.secret.versionless_id
}