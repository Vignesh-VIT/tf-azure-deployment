locals {
  common_tags = {
    owner      = "gsv1cob@bosch.com"
    department = "ADA"
    project    = "two-tier-application"
  }
  db_password     = module.db_password.result
  vm_app_password = module.vm_app_password.result
  vm_db_password  = module.vm_db_password.result
}