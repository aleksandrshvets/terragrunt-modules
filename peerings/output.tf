output "outValue" {
  value = {
    peering12_name = azurerm_virtual_network_peering.peering_12.name
    peering21_name = azurerm_virtual_network_peering.peering_21.name
  }
}