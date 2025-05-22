variable "name" {
  description = "Name of the virtual network"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "address_space" {
  description = "Address space for the VNet"
  type        = list(string)
}

# variable "public_subnet_cidr" {
#   description = "CIDR block for the public subnet"
#   type        = list(string)
# }

# variable "private_subnet_cidr" {
#   description = "CIDR block for the private subnet"
#   type        = list(string)
# }

# variable "default_outbound_access_enabled" {
#   description = "Enable default outbound access to the internet for subent"
#   type        = bool
# }

# variable "public_subnet_default_outbound_access_enabled" {
#   type    = bool
#   default = true
# }

# variable "private_subnet_default_outbound_access_enabled" {
#   type    = bool
#   default = false
# }

variable "tags" {
  description = "Common tags"
  type        = map(string)
}
