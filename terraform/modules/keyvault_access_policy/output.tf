output "access_policy_id" {
  description = "ID of the Key Vault access policy"
  value       = azurerm_key_vault_access_policy.access_policy.id
}

output "object_id" {
  description = "Object ID of the access policy"
  value       = azurerm_key_vault_access_policy.access_policy.object_id
}