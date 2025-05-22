resource "azurerm_network_interface" "nic" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_id
  }

  tags = var.tags
}

# resource "azurerm_network_interface_security_group_association" "nsg_association" {
#   network_interface_id     = azurerm_network_interface.nic.id
#   network_security_group_id = var.network_security_group_id
# }

resource "azurerm_network_interface_application_security_group_association" "asg_association" {
  count                         = length(var.application_security_group_ids)
  network_interface_id          = azurerm_network_interface.nic.id
  application_security_group_id = var.application_security_group_ids[count.index]
}