output "hex" {
  description = "Hexadecimal representation of the random ID"
  value       = random_id.id.hex
}

output "dec" {
  description = "Decimal representation of the random ID"
  value       = random_id.id.dec
}

output "b64_url" {
  description = "Base64 URL-safe representation of the random ID"
  value       = random_id.id.b64_url
}

output "b64_std" {
  description = "Base64 standard representation of the random ID"
  value       = random_id.id.b64_std
}

output "id" {
  description = "ID of the random ID resource"
  value       = random_id.id.id
}