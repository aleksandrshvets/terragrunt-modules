resource "azurerm_virtual_network_peering" "peering_12" {
  name                      = "peer1to2"
  resource_group_name       = var.peering12.targetNetworkResourceGroupName
  virtual_network_name      = var.peering12.targetNetworkName
  remote_virtual_network_id = var.peering12.destinationNetworkId
}

resource "azurerm_virtual_network_peering" "peering_21" {
  name                      = "peer2to1"
  resource_group_name       = var.peering21.targetNetworkResourceGroupName
  virtual_network_name      = var.peering21.targetNetworkName
  remote_virtual_network_id = var.peering21.destinationNetworkId
}