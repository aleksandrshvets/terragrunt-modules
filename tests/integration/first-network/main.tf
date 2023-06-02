terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "first-network" {
  source = "../../../first-network"
  first_network_rg_name = var.first_network_rg_name
  first_network_rg_location = var.first_network_rg_location
  first_network_name    = var.first_network_name
}