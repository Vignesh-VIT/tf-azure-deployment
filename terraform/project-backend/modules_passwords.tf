module "keyvault_suffix" {
  source      = "../modules/random_id"
  byte_length = 4
}

module "db_password" {
  source  = "../modules/random_password"
  length  = 16
  special = false
}

module "vm_app_password" {
  source  = "../modules/random_password"
  length  = 16
  special = true
}

module "vm_db_password" {
  source  = "../modules/random_password"
  length  = 16
  special = true
}