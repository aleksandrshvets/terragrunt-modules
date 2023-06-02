resource "azurerm_resource_group" "fnw_rg" {
  name     = var.first_network_rg_name
  location = var.first_network_rg_location
}

resource "azurerm_virtual_network" "fnw" {
  name                = var.first_network_name
  resource_group_name = azurerm_resource_group.fnw_rg.name
  address_space       = ["10.0.1.0/24"]
  location            = azurerm_resource_group.fnw_rg.location
}