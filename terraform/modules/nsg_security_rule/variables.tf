# modules/nsg_security_rule/variables.tf
variable "name" {
  description = "Name of the security rule"
  type        = string
}

variable "network_security_group_name" {
  description = "Name of the network security group"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "priority" {
  description = "Priority of the security rule (100-4096)"
  type        = number
  validation {
    condition     = var.priority >= 100 && var.priority <= 4096
    error_message = "Priority must be between 100 and 4096."
  }
}

variable "direction" {
  description = "Direction of the security rule (Inbound or Outbound)"
  type        = string
  validation {
    condition     = contains(["Inbound", "Outbound"], var.direction)
    error_message = "Direction must be either Inbound or Outbound."
  }
}

variable "access" {
  description = "Access type (Allow or Deny)"
  type        = string
  validation {
    condition     = contains(["Allow", "Deny"], var.access)
    error_message = "Access must be either Allow or Deny."
  }
}

variable "protocol" {
  description = "Protocol (Tcp, Udp, Icmp, Esp, Ah, or *)"
  type        = string
  validation {
    condition     = contains(["Tcp", "Udp", "Icmp", "Esp", "Ah", "*"], var.protocol)
    error_message = "Protocol must be one of: Tcp, Udp, Icmp, Esp, Ah, or *."
  }
}

variable "source_port_range" {
  description = "Source port range (use either this or source_port_ranges)"
  type        = string
  default     = null
}

variable "source_port_ranges" {
  description = "List of source port ranges (use either this or source_port_range)"
  type        = list(string)
  default     = null
}

variable "destination_port_range" {
  description = "Destination port range (use either this or destination_port_ranges)"
  type        = string
  default     = null
}

variable "destination_port_ranges" {
  description = "List of destination port ranges (use either this or destination_port_range)"
  type        = list(string)
  default     = null
}

variable "source_address_prefix" {
  description = "Source address prefix (use either this or source_address_prefixes)"
  type        = string
  default     = null
}

variable "source_address_prefixes" {
  description = "List of source address prefixes (use either this or source_address_prefix)"
  type        = list(string)
  default     = null
}

variable "destination_address_prefix" {
  description = "Destination address prefix (use either this or destination_address_prefixes)"
  type        = string
  default     = null
}

variable "destination_address_prefixes" {
  description = "List of destination address prefixes (use either this or destination_address_prefix)"
  type        = list(string)
  default     = null
}

variable "source_application_security_group_ids" {
  description = "List of source application security group IDs"
  type        = list(string)
  default     = []
}

variable "destination_application_security_group_ids" {
  description = "List of destination application security group IDs"
  type        = list(string)
  default     = []
}

variable "description" {
  description = "Description of the security rule"
  type        = string
  default     = ""
}