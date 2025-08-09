resource "azurerm_resource_group" "app_rg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

module "network" {
  source = "./modules/network"
  group_number = var.group_number
  location = var.resource_group_location
  tags = var.tags
}

# resource "azurerm_resource_group" "test_rg" {
#   name     = "test-rg"
#   location = var.resource_group_location
# }

# resource "azurerm_storage_account" "storage_account" {
#   name                     = "ren00055a12storage"
#   resource_group_name      = azurerm_resource_group.app_rg.name
#   location                 = azurerm_resource_group.app_rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   min_tls_version          = "TLS1_2"
#   tags = {
#     "Cost Center" = "000"
#     "Environment" = "Production"
#   }
# }



