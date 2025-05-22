module "asg_app_servers" {
  source              = "../modules/asg"
  name                = "${var.environment}-app-servers-asg"
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  tags                = merge(local.common_tags, { Purpose = "Application Tier" })
}

module "nic_server1" {
  source                         = "../modules/nic"
  name                           = "${var.environment}-server1-nic"
  location                       = module.resource_group.resource_group_location
  resource_group_name            = module.resource_group.resource_group_name
  subnet_id                      = module.public_subnet.subnet_id
  public_ip_id                   = module.public_ip.public_ip_id
  application_security_group_ids = [module.asg_app_servers.asg_id]
  tags                           = local.common_tags
}

module "vm_server1" {
  source              = "../modules/vm"
  name                = "${var.environment}-server1"
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  nic_id              = module.nic_server1.nic_id
  admin_username      = var.admin_username
  admin_password      = local.vm_app_password
  vm_size             = var.public_vm_size
  environment         = var.environment
  install_flask       = false
  tags                = merge(local.common_tags, { Role = "Public Server" })
}