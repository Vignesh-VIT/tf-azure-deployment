variable "name" {
  description = "Name of the subnet"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "address_prefixes" {
  description = "List of address prefixes for the subnet"
  type        = list(string)
}

variable "default_outbound_access_enabled" {
  description = "Enable default outbound access for the subnet"
  type        = bool
  default     = true
}

variable "service_endpoints" {
  description = "List of service endpoints to associate with the subnet"
  type        = list(string)
  default     = []
}

variable "private_endpoint_network_policies" {
  description = "Enable or disable network policies for private endpoints on the subnet"
  type        = string
  default     = "Disabled"
  validation {
    condition     = contains(["Enabled", "Disabled", "NetworkSecurityGroupEnabled", "RouteTableEnabled"], var.private_endpoint_network_policies)
    error_message = "Valid values are Enabled, Disabled, NetworkSecurityGroupEnabled, or RouteTableEnabled."
  }
}

variable "private_link_service_network_policies_enabled" {
  description = "Enable or disable network policies for private link service on the subnet"
  type        = bool
  default     = true
}

variable "delegations" {
  description = "List of subnet delegations"
  type = list(object({
    name = string
    service_delegation = object({
      name    = string
      actions = list(string)
    })
  }))
  default = []
}

variable "network_security_group_id" {
  description = "The ID of the Network Security Group to associate with the NIC"
  type        = string
  default     = null
}
