output "outValue" {
  value = {
    fnw_rg_name = var.first_network_rg_name
    fnw_name    = var.first_network_name
    fnw_id      = azurerm_virtual_network.fnw.id
  }
}