terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.96.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "ren00055-githubactions-rg"
    storage_account_name = "ren00055githubactionsa"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
    use_oidc             = true
  }
}