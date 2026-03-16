terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.60.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "rg-demo"
  #   storage_account_name = "stgdemo2026tf"
  #   container_name       = "mycontainer"
  #   key                  = "dev.terraform.tfstate"
  # }
}

provider "azurerm" {
  features {
  }
  subscription_id = "8432b329-2a25-4ccb-9771-c72ad6d864df"
}
