terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.60.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "stgdemo2026tf2"
    container_name       = "mycontainer"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {
  }
  use_oidc = true
}
