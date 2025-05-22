variable "name" {
  description = "Name of the Application Security Group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the ASG"
  type        = map(string)
  default     = {}
}