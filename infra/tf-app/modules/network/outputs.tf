output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}

output "virtual_network_id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnet_ids" {
  description = "Map of subnet name -> subnet ID"
  value       = { for k, v in azurerm_subnet.subnet : k => v.id }
}

output "subnet_prefixes" {
  description = "Map of subnet name -> CIDR"
  value       = { for k, v in azurerm_subnet.subnet : k => v.address_prefixes[0] }
}