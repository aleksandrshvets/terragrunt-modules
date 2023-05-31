resource "azurerm_virtual_network" "example" {
  name                = var.network_name
  address_space       = ["10.0.0.0/16"]
  location            = var.network_location
  resource_group_name = var.rg_name
}