resource "azurerm_virtual_machine_extension" "vm_extension" {
  name                 = var.extension_name
  virtual_machine_id   = var.vm_id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = var.type_handler_version

  settings = jsonencode({
    script = base64encode(templatefile("${path.module}/${var.script_file}", var.script_vars))
  })

  depends_on = [var.depends_on_resources]
}
