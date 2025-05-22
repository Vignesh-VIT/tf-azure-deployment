variable "name" {
  description = "Name of the virtual machine"
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

variable "environment" {
  description = "The environment name (e.g., dev, staging, prod)"
  type        = string
}

variable "nic_id" {
  description = "NIC ID to attach to the VM"
  type        = string
}

variable "vm_size" {
  description = "Size of the VM"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for SSH"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the VM"
  type        = string
  sensitive   = true
}

variable "install_flask" {
  description = "Whether to install Flask application"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the VM"
  type        = map(string)
}
