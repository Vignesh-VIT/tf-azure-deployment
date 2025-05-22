module "nsg" {
  source              = "../modules/nsg"
  name                = "${var.environment}-nsg"
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  tags                = local.common_tags
}

module "allow_standard_ports" {
  source                                     = "../modules/nsg_security_rule"
  name                                       = "Allow-StandardPort-to-internet"
  network_security_group_name                = module.nsg.network_security_group_name
  resource_group_name                        = module.resource_group.resource_group_name
  priority                                   = 1002
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "Tcp"
  source_port_ranges                         = ["0-65535"]
  destination_port_ranges                    = ["22", "80", "8080", "443", "5000"]
  source_address_prefixes                    = ["0.0.0.0/0"]
  destination_application_security_group_ids = [module.asg_app_servers.asg_id]
  description                                = "Allow SSH/HTTP/HTTPS and flask-app from internet"
}

module "allow_app_to_db" {
  source                                     = "../modules/nsg_security_rule"
  name                                       = "Allow-App-to-DB"
  network_security_group_name                = module.nsg.network_security_group_name
  resource_group_name                        = module.resource_group.resource_group_name
  priority                                   = 2002
  direction                                  = "Inbound"
  access                                     = "Allow"
  protocol                                   = "Tcp"
  source_port_ranges                         = ["0-65535"]
  destination_port_ranges                    = ["22", "5432"]
  source_application_security_group_ids      = [module.asg_app_servers.asg_id]
  destination_application_security_group_ids = [module.asg_db_servers.asg_id]
  description                                = "Allow app servers to connect to database servers"
}

module "deny_all_other" {
  source                       = "../modules/nsg_security_rule"
  name                         = "Deny-All-Other"
  network_security_group_name  = module.nsg.network_security_group_name
  resource_group_name          = module.resource_group.resource_group_name
  priority                     = 4000
  direction                    = "Inbound"
  access                       = "Deny"
  protocol                     = "*"
  source_port_ranges           = ["0-65535"]
  destination_port_ranges      = ["0-65535"]
  source_address_prefixes      = ["0.0.0.0/0"]
  destination_address_prefixes = ["0.0.0.0/0"]
  description                  = "Deny all other traffic"
}