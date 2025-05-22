variable "name" {
  description = "Name of the Key Vault secret"
  type        = string
}

variable "key_vault_id" {
  description = "ID of the Key Vault"
  type        = string
}

variable "value" {
  description = "Value of the secret"
  type        = string
  sensitive   = true
}

variable "content_type" {
  description = "Content type of the secret"
  type        = string
  default     = null
}

variable "not_before_date" {
  description = "Date before which the secret is not valid (RFC3339 format)"
  type        = string
  default     = null
}

variable "expiration_date" {
  description = "Expiration date of the secret (RFC3339 format)"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to the secret"
  type        = map(string)
  default     = {}
}