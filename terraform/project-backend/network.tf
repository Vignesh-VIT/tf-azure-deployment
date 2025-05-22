module "network" {
  source              = "../modules/network"
  name                = var.vnet_name
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  address_space       = var.address_space
  tags                = local.common_tags
}

module "public_subnet" {
  source                          = "../modules/subnet"
  name                            = "${var.environment}-public-subnet"
  resource_group_name             = module.resource_group.resource_group_name
  virtual_network_name            = module.network.vnet_name
  address_prefixes                = var.public_subnet_cidr
  default_outbound_access_enabled = true
  network_security_group_id       = module.nsg.network_security_group_id
}

module "private_subnet" {
  source                          = "../modules/subnet"
  name                            = "${var.environment}-private-subnet"
  resource_group_name             = module.resource_group.resource_group_name
  virtual_network_name            = module.network.vnet_name
  address_prefixes                = var.private_subnet_cidr
  default_outbound_access_enabled = false
  network_security_group_id       = module.nsg.network_security_group_id
}

module "public_ip" {
  source              = "../modules/public_ip"
  name                = "${var.environment}-server1-public-ip"
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  tags                = local.common_tags
}