output "outValue" {
  value = {
    snw_rg_name = var.second_network_rg_name
    snw_name    = var.second_network_name
    snw_id      = azurerm_virtual_network.snw.id
  }
}