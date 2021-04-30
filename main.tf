terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }

  backend "remote" {
    organization = "calloes-terraform"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}


provider "azurerm" {
  features {}
  subscription_id = "1915d2dc-d2c2-4180-ad12-eaa78efe6345" // "ARM_SUBSCRIPTION_ID" env variable
}

resource "azurerm_resource_group" "resource_group" {
  name     = "calloes_rg"
  location = "Australia East"
}
output "resource_group" {
  value = azurerm_resource_group.resource_group
}
