variable "byte_length" {
  description = "Number of random bytes to produce"
  type        = number
  default     = 8
  validation {
    condition     = var.byte_length > 0 && var.byte_length <= 16
    error_message = "Byte length must be between 1 and 16."
  }
}

variable "prefix" {
  description = "Prefix to add to the generated ID"
  type        = string
  default     = null
}

variable "keepers" {
  description = "Arbitrary map of values that when changed will trigger recreation of ID"
  type        = map(string)
  default     = {}
}