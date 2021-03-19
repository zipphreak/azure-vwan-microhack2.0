   resource "azurerm_virtual_wan" "microhack-vwan" {
    name                = "microhack-vwan"
    resource_group_name = azurerm_resource_group.vwan-microhack-hub-rg.name
    location            = var.location-hub-1
  }
   resource "azurerm_virtual_hub" "microhack-eus2-hub" {
    name                = "microhack-eus2-hub"
    resource_group_name = azurerm_resource_group.vwan-microhack-hub-rg.name
    location            = var.location-hub-1
    virtual_wan_id      = azurerm_virtual_wan.microhack-vwan.id
    address_prefix      = var.hub1-cidr
   }
   resource "azurerm_virtual_hub" "microhack-wus2-hub" {
    name                = "microhack-wus2-hub"
    resource_group_name = azurerm_resource_group.vwan-microhack-hub-rg.name
    location            = var.location-hub-2
    virtual_wan_id      = azurerm_virtual_wan.microhack-vwan.id
    address_prefix      = var.hub2-cidr
  }
   resource "azurerm_vpn_gateway" "microhack-eus2-hub-vng" {
    name                = "microhack-eus2-hub-vng"
    location            = var.location-hub-1
    resource_group_name = azurerm_resource_group.vwan-microhack-hub-rg.name
    virtual_hub_id      = azurerm_virtual_hub.microhack-eus2-hub.id
    depends_on = [azurerm_virtual_hub.microhack-eus2-hub]
  }
 resource "azurerm_virtual_hub_connection" "microhack-eus2-hub-spoke1" {
  name                      = "eus2-hub-spoke1"
  virtual_hub_id            = azurerm_virtual_hub.microhack-eus2-hub.id
  remote_virtual_network_id = azurerm_virtual_network.spoke-1-vnet.id
}
 resource "azurerm_virtual_hub_connection" "microhack-eus2-hub-spoke2" {
  name                      = "eus2-hub-spoke2"
  virtual_hub_id            = azurerm_virtual_hub.microhack-eus2-hub.id
  remote_virtual_network_id = azurerm_virtual_network.spoke-2-vnet.id
}
 resource "azurerm_virtual_hub_connection" "microhack-eus2-hub-services" {
  name                      = "eus2-hub-services"
  virtual_hub_id            = azurerm_virtual_hub.microhack-eus2-hub.id
  remote_virtual_network_id = azurerm_virtual_network.services-vnet.id
}
    resource "azurerm_virtual_hub_connection" "microhack-eus2-hub-nva" {
  name                      = "eus2-hub-nva"
  virtual_hub_id            = azurerm_virtual_hub.microhack-eus2-hub.id
  remote_virtual_network_id = azurerm_virtual_network.nva-vnet.id
}
 resource "azurerm_virtual_hub_connection" "microhack-wus2-hub-spoke3" {
  name                      = "wus2-hub-spoke3"
  virtual_hub_id            = azurerm_virtual_hub.microhack-wus2-hub.id
  remote_virtual_network_id = azurerm_virtual_network.spoke-3-vnet.id
}
 resource "azurerm_virtual_hub_connection" "microhack-wus2-hub-spoke4" {
  name                      = "wus2-hub-spoke4"
  virtual_hub_id            = azurerm_virtual_hub.microhack-wus2-hub.id
  remote_virtual_network_id = azurerm_virtual_network.spoke-4-vnet.id
}
 output "vwan-tunnelip" {
  value = tolist(azurerm_vpn_gateway.microhack-eus2-hub-vng.bgp_settings[0].instance_0_bgp_peering_address[0].tunnel_ips)[1]
}
 output "vwan-defaultip" {
 value = tolist(azurerm_vpn_gateway.microhack-eus2-hub-vng.bgp_settings[0].instance_0_bgp_peering_address[0].default_ips)[0]
}
