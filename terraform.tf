terraform {
  required_version = "~> 1.12"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # use back the same storage account as the one used in alz but in a different tfstate file
  #   backend "azurerm" {
  #     resource_group_name  = "rg-bdonprd2-nprd2-state-southeastasia-006"
  #     storage_account_name = "stobdonprsou006cyrm"
  #     container_name       = "nprd2-tfstate"
  #     key                  = "network.tfstate"
  #     subscription_id      = "1543411c-a55d-46d6-93bf-2e585fd51376"
  #   }
}

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "alz_output" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rg-bdonprd3-nprd3-state-southeastasia-007"
    storage_account_name = "stobdonprsou007gkgs"
    container_name       = "nprd3-tfstate"
    key                  = "terraform.tfstate"
    subscription_id      = "1543411c-a55d-46d6-93bf-2e585fd51376"
  }
}