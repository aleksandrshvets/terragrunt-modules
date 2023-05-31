resource "azurerm_subnet" "example" {
  name                 = var.subnetwork_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.network_name
  address_prefixes     = ["10.0.2.0/24"]
}