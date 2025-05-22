module "keyvault" {
  source              = "../modules/keyvault"
  name                = "${var.environment}-keyvault-${module.keyvault_suffix.hex}"
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  tags                = local.common_tags
  depends_on          = [module.vm_server1]
}

module "keyvault_vm_access_policy" {
  source             = "../modules/keyvault_access_policy"
  key_vault_id       = module.keyvault.key_vault_id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = module.vm_server1.principal_id
  secret_permissions = ["Get", "List"]
}

module "keyvault_admin_access_policy" {
  source             = "../modules/keyvault_access_policy"
  key_vault_id       = module.keyvault.key_vault_id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = var.object_id
  secret_permissions = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
}

module "keyvault_sp_access_policy" {
  source             = "../modules/keyvault_access_policy"
  key_vault_id       = module.keyvault.key_vault_id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = var.sp_object_id
  secret_permissions = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
}

module "db_password_secret" {
  source       = "../modules/keyvault_secret"
  name         = "db-password"
  key_vault_id = module.keyvault.key_vault_id
  value        = local.db_password
  content_type = "password"
  tags         = merge(local.common_tags, { Type = "Database" })
  depends_on   = [module.keyvault_admin_access_policy]
}

module "db_connection_string_secret" {
  source       = "../modules/keyvault_secret"
  name         = "db-connection-string"
  key_vault_id = module.keyvault.key_vault_id
  value        = "postgresql://${var.db_username}:${local.db_password}@${module.nic_server2.private_ip_address}:5432/${var.db_name}"
  content_type = "connection-string"
  tags         = merge(local.common_tags, { Type = "Database" })
  depends_on   = [module.keyvault_admin_access_policy]
}

module "vm_app_password_secret" {
  source       = "../modules/keyvault_secret"
  name         = "vm-app-password"
  key_vault_id = module.keyvault.key_vault_id
  value        = local.vm_app_password
  content_type = "password"
  tags         = merge(local.common_tags, { Type = "Application" })
  depends_on   = [module.keyvault_admin_access_policy]
}

module "vm_db_password_secret" {
  source       = "../modules/keyvault_secret"
  name         = "vm-db-password"
  key_vault_id = module.keyvault.key_vault_id
  value        = local.vm_db_password
  content_type = "password"
  tags         = merge(local.common_tags, { Type = "Database" })
  depends_on   = [module.keyvault_admin_access_policy]
}