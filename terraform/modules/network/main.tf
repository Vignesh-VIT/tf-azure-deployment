resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags
}

# resource "azurerm_subnet" "public_subnet" {
#   name                            = "public-subnet"
#   resource_group_name             = var.resource_group_name
#   virtual_network_name            = azurerm_virtual_network.vnet.name
#   address_prefixes                = var.public_subnet_cidr
#   default_outbound_access_enabled = var.public_subnet_default_outbound_access_enabled
# }

# resource "azurerm_subnet" "private_subnet" {
#   name                            = "private-subnet"
#   resource_group_name             = var.resource_group_name
#   virtual_network_name            = azurerm_virtual_network.vnet.name
#   address_prefixes                = var.private_subnet_cidr
#   default_outbound_access_enabled = var.private_subnet_default_outbound_access_enabled
# }