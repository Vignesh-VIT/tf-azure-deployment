module "flask_vm_extension" {
  source         = "../modules/vm_extension"
  extension_name = "install-flask-app"
  vm_id          = module.vm_server1.vm_id
  script_file    = "../../scripts/install_flask.sh"
  script_vars = {
    key_vault_uri = module.keyvault.key_vault_uri
  }
  depends_on_resources = [
    module.keyvault,
    module.keyvault_vm_access_policy,
    module.db_password_secret,
    module.db_connection_string_secret
  ]
}