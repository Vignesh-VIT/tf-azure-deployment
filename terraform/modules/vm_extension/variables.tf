variable "extension_name" {
  type        = string
  description = "Name of the VM extension"
}

variable "vm_id" {
  type        = string
  description = "ID of the virtual machine"
}

variable "script_file" {
  type        = string
  description = "Relative path to the shell script file"
}

variable "script_vars" {
  type        = map(any)
  default     = {}
  description = "Variables to pass into the script via templatefile"
}

variable "type_handler_version" {
  type    = string
  default = "2.1"
}

variable "depends_on_resources" {
  type    = list(any)
  default = []
}
