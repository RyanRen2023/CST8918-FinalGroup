terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.96.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "group10-githubactions-rg"
    storage_account_name = "group10githubactionsa"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
    use_oidc             = true
  }
}

# Provider configuration is expected in the root module.
# provider "azurerm" { features {} }

locals {
  rg_name   = "cst8918-final-project-group-${var.group_number}"
  vnet_name = "${local.rg_name}-vnet"

  # Fixed design per requirements
  vnet_address_space = ["10.0.0.0/14"]

  subnets = {
    prod  = "10.0.0.0/16"
    test  = "10.1.0.0/16"
    dev   = "10.2.0.0/16"
    admin = "10.3.0.0/16"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = local.vnet_address_space
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  for_each             = local.subnets
  name                 = each.key
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value]
}
