variable "name" {
  description = "Name of the NIC"
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

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "public_ip_id" {
  description = "ID of the Public IP (optional)"
  type        = string
  default     = null
}

# variable "network_security_group_id" {
#   description = "The ID of the Network Security Group to associate with the NIC"
#   type        = string
#   default     = null
# }

variable "application_security_group_ids" {
  description = "List of Application Security Group IDs"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
}
