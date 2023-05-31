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

module "resource-group" {
  source = "./resource-group"
  rg_name = "ashvets_rg5"
  rg_location = "West Europe"
}

module "virtual-network" {
  depends_on = [
    module.resource-group
  ]
  source = "./virtual-network"
  network_name = "ashvets_nw1"
  network_location = "West Europe"
  rg_name = module.resource-group.outValue.rg_name
}

module "sub-network" {
  depends_on = [
    module.virtual-network
  ]
  source = "./sub-network"
  subnetwork_name = "ashvets_sbnw1"
  network_name = module.virtual-network.outValue.nw_name
  rg_name = module.resource-group.outValue.rg_name
}