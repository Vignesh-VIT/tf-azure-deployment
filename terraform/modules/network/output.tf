output "vnet_id" {
  description = "ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

# output "public_subnet_id" {
#   description = "ID of the public subnet"
#   value       = azurerm_subnet.public_subnet.id
# }

# output "private_subnet_id" {
#   description = "ID of the private subnet"
#   value       = azurerm_subnet.private_subnet.id
# }