output "result" {
  description = "Generated password"
  value       = random_password.password.result
  sensitive   = true
}

output "bcrypt_hash" {
  description = "Bcrypt hash of the password"
  value       = random_password.password.bcrypt_hash
  sensitive   = true
}

output "id" {
  description = "ID of the password resource"
  value       = random_password.password.id
}