output "asg_id" {
  description = "ID of the Application Security Group"
  value       = azurerm_application_security_group.asg.id
}

output "asg_name" {
  description = "Name of the Application Security Group"
  value       = azurerm_application_security_group.asg.name
}