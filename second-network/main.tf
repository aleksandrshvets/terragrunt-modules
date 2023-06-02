resource "azurerm_resource_group" "snw_rg" {
  name     = var.second_network_rg_name
  location = var.second_network_rg_location
}

resource "azurerm_virtual_network" "snw" {
  name                = var.second_network_name
  resource_group_name = azurerm_resource_group.snw_rg.name
  address_space       = ["10.0.2.0/24"]
  location            = azurerm_resource_group.snw_rg.location
}