#######################################################################
## Create VNET Gateway - onprem
#######################################################################
resource "azurerm_public_ip" "vnet-gw-onprem-pubip" {
    name                = "vnet-gw-onprem-pubip"
    location            = var.location-onprem
    resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name
    allocation_method   = "Dynamic"
    sku                 = "Basic"
  }
  resource "azurerm_virtual_network_gateway" "vnet-gw-onprem" {
    name                = "vnet-gw-onprem"
    location            = var.location-onprem
    resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name
    type     = "Vpn"
    vpn_type = "RouteBased"
    active_active = false
    enable_bgp    = true
    sku           = "VpnGw1"
    bgp_settings{
      asn = var.vngBGPAS
}
    ip_configuration {
      name                          = "vnet-gw-onprem-ip-config"
      public_ip_address_id          = azurerm_public_ip.vnet-gw-onprem-pubip.id
      private_ip_address_allocation = "Dynamic"
      subnet_id                     = azurerm_subnet.onprem-gateway-subnet.id
    }
  }
resource "azurerm_vpn_site" "microhack-eus2-onprem-site" {
  name                = "eus2-onprem-site"
  location            = azurerm_resource_group.vwan-microhack-hub-rg.location
  resource_group_name = azurerm_resource_group.vwan-microhack-hub-rg.name
  virtual_wan_id      = azurerm_virtual_wan.microhack-vwan.id

  link {
    name       = "link1"
    ip_address = azurerm_public_ip.vnet-gw-onprem-pubip.ip_address
     bgp {
       asn = azurerm_virtual_network_gateway.vnet-gw-onprem.bgp_settings[0].asn
       peering_address = azurerm_virtual_network_gateway.vnet-gw-onprem.bgp_settings[0].peering_address
   }
  }
  depends_on = [azurerm_vpn_gateway.microhack-eus2-hub-vng, azurerm_virtual_network_gateway.vnet-gw-onprem]
}
resource "azurerm_vpn_gateway_connection" "microhack-vwan-eus2-onprem" {
  name               = "vwan-eus2-onprem"
  vpn_gateway_id     = azurerm_vpn_gateway.microhack-eus2-hub-vng.id
  remote_vpn_site_id = azurerm_vpn_site.microhack-eus2-onprem-site.id
  vpn_link {
    name             = "link1"
    vpn_site_link_id = azurerm_vpn_site.microhack-eus2-onprem-site.link[0].id
    shared_key = var.password
    bgp_enabled = true
  }
  depends_on = [azurerm_vpn_gateway.microhack-eus2-hub-vng]
}
resource "azurerm_local_network_gateway" "microhack-eus2-vwan" {
  name                = "eus2-vwan-lng"
  resource_group_name = azurerm_resource_group.vwan-microhack-hub-rg.name
  location            = azurerm_resource_group.vwan-microhack-hub-rg.location
  gateway_address = tolist(azurerm_vpn_gateway.microhack-eus2-hub-vng.bgp_settings[0].instance_0_bgp_peering_address[0].tunnel_ips)[1]
  address_space = []
  bgp_settings {
    asn = azurerm_vpn_gateway.microhack-eus2-hub-vng.bgp_settings[0].asn
    bgp_peering_address = tolist(azurerm_vpn_gateway.microhack-eus2-hub-vng.bgp_settings[0].instance_0_bgp_peering_address[0].default_ips)[0]
  }
}
resource "azurerm_virtual_network_gateway_connection" "microhack-eus2-onprem-vwan" {
  name                = "eus2-vwan"
  location            = azurerm_resource_group.vwan-microhack-hub-rg.location
  resource_group_name = azurerm_resource_group.vwan-microhack-hub-rg.name
  type                = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.vnet-gw-onprem.id
  local_network_gateway_id   = azurerm_local_network_gateway.microhack-eus2-vwan.id
  shared_key = var.password
  enable_bgp = true
  depends_on = [azurerm_virtual_network_gateway.vnet-gw-onprem]
}