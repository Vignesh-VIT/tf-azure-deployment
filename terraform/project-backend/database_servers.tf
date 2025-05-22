module "asg_db_servers" {
  source              = "../modules/asg"
  name                = "${var.environment}-db-servers-asg"
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  tags                = merge(local.common_tags, { Purpose = "Database Tier" })
}

module "nic_server2" {
  source                         = "../modules/nic"
  name                           = "${var.environment}-server2-nic"
  location                       = module.resource_group.resource_group_location
  resource_group_name            = module.resource_group.resource_group_name
  subnet_id                      = module.private_subnet.subnet_id
  application_security_group_ids = [module.asg_db_servers.asg_id]
  tags                           = local.common_tags
}

module "vm_server2" {
  source              = "../modules/vm"
  name                = "${var.environment}-server2"
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  nic_id              = module.nic_server2.nic_id
  admin_username      = var.admin_username
  admin_password      = local.vm_db_password
  vm_size             = var.private_vm_size
  environment         = var.environment
  install_flask       = false
  tags                = merge(local.common_tags, { Role = "Private Server" })
}