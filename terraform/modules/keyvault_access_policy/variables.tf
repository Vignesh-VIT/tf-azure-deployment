variable "key_vault_id" {
  description = "ID of the Key Vault"
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID"
  type        = string
}

variable "object_id" {
  description = "Object ID of the user, service principal, or security group"
  type        = string
}

variable "application_id" {
  description = "Application ID of the service principal (optional)"
  type        = string
  default     = null
}

variable "certificate_permissions" {
  description = "List of certificate permissions"
  type        = list(string)
  default     = []
  validation {
    condition = alltrue([
      for perm in var.certificate_permissions : contains([
        "Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers",
        "Import", "List", "ListIssuers", "ManageContacts", "ManageIssuers",
        "Purge", "Recover", "Restore", "SetIssuers", "Update"
      ], perm)
    ])
    error_message = "Invalid certificate permission specified."
  }
}

variable "key_permissions" {
  description = "List of key permissions"
  type        = list(string)
  default     = []
  validation {
    condition = alltrue([
      for perm in var.key_permissions : contains([
        "Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import",
        "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update",
        "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy"
      ], perm)
    ])
    error_message = "Invalid key permission specified."
  }
}

variable "secret_permissions" {
  description = "List of secret permissions"
  type        = list(string)
  default     = []
  validation {
    condition = alltrue([
      for perm in var.secret_permissions : contains([
        "Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"
      ], perm)
    ])
    error_message = "Invalid secret permission specified."
  }
}

variable "storage_permissions" {
  description = "List of storage permissions"
  type        = list(string)
  default     = []
  validation {
    condition = alltrue([
      for perm in var.storage_permissions : contains([
        "Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS",
        "Purge", "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"
      ], perm)
    ])
    error_message = "Invalid storage permission specified."
  }
}