variable "length" {
  description = "Length of the password"
  type        = number
  default     = 16
  validation {
    condition     = var.length >= 8 && var.length <= 128
    error_message = "Password length must be between 8 and 128 characters."
  }
}

variable "special" {
  description = "Include special characters in the password"
  type        = bool
  default     = false
}

variable "upper" {
  description = "Include uppercase letters in the password"
  type        = bool
  default     = true
}

variable "lower" {
  description = "Include lowercase letters in the password"
  type        = bool
  default     = true
}

variable "numeric" {
  description = "Include numeric characters in the password"
  type        = bool
  default     = true
}

variable "min_lower" {
  description = "Minimum number of lowercase characters"
  type        = number
  default     = 0
}

variable "min_upper" {
  description = "Minimum number of uppercase characters"
  type        = number
  default     = 0
}

variable "min_numeric" {
  description = "Minimum number of numeric characters"
  type        = number
  default     = 0
}

variable "min_special" {
  description = "Minimum number of special characters"
  type        = number
  default     = 0
}

variable "override_special" {
  description = "Override the default special characters"
  type        = string
  default     = null
}

variable "keepers" {
  description = "Arbitrary map of values that when changed will trigger recreation of password"
  type        = map(string)
  default     = {}
}