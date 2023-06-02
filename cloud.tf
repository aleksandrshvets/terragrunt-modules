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
  source = "./first-network"
  first_network_rg_name = "ashvets_frg2"
  first_network_rg_location = "West Europe"
  first_network_name    = "ashvets_fnw2"
}

module "second-network" {
  source = "./second-network"
  second_network_rg_name = "ashvets_srg2"
  second_network_rg_location = "West Europe"
  second_network_name    = "ashvets_snw2"
}

module "peerings" {
  source = "./peerings"
  peering12 = {
    targetNetworkResourceGroupName = module.first-network.outValue.fnw_rg_name
    targetNetworkName              = module.first-network.outValue.fnw_name
    destinationNetworkId           = module.second-network.outValue.snw_id
  }
  peering21 = {
    targetNetworkResourceGroupName = module.second-network.outValue.snw_rg_name
    targetNetworkName              = module.second-network.outValue.snw_name
    destinationNetworkId           = module.first-network.outValue.fnw_id
  }
}