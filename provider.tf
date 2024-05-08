terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.77.0"
    }
  }
    backend "azurerm" {
    resource_group_name  = "AZ-TEST-RG"
    storage_account_name = "testrituaz"
    container_name       = "terraform"
    key                  = "terraform-hub.tfstate"
  }
} 
provider "azurerm" {
  features {}
  subscription_id = "af5392bb-f013-4b3d-a1f9-614f19eddcfd"
}
 