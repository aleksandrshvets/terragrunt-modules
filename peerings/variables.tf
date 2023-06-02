variable "peering12" {
  type = object({
    targetNetworkResourceGroupName = string
    targetNetworkName              = string
    destinationNetworkId           = string
  })
}

variable "peering21" {
  type = object({
    targetNetworkResourceGroupName = string
    targetNetworkName              = string
    destinationNetworkId           = string
  })
}
