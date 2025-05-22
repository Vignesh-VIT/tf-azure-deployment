variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

# variable "security_rules" {
#   type = list(object({
#     name                                       = string
#     priority                                   = number
#     direction                                  = string
#     access                                     = string
#     protocol                                   = string
#     source_port_ranges                         = optional(list(string), [])
#     destination_port_ranges                    = optional(list(string), [])
#     source_address_prefixes                    = optional(list(string), [])
#     destination_address_prefixes               = optional(list(string), [])
#     source_application_security_group_ids      = optional(list(string), [])
#     destination_application_security_group_ids = optional(list(string), [])
#     description                                = string
#   }))
# }
