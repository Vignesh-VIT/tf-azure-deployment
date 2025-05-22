output "security_rule_id" {
  description = "ID of the security rule"
  value       = azurerm_network_security_rule.security_rule.id
}

output "security_rule_name" {
  description = "Name of the security rule"
  value       = azurerm_network_security_rule.security_rule.name
}