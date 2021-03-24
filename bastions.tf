#######################################################################
## Create Bastion onprem
#######################################################################
resource "azurerm_public_ip" "bastion-onprem-pubip" {
  name                = "bastion-onprem-pubip"
  location            = var.location-onprem
  resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion-onprem" {
  name                = "bastion-onprem"
  location            = var.location-onprem
  resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name

  ip_configuration {
    name                 = "bastion-onprem-configuration"
    subnet_id            = azurerm_subnet.bastion-onprem-subnet.id
    public_ip_address_id = azurerm_public_ip.bastion-onprem-pubip.id
  }
}
#######################################################################
## Create Bastion Services
#######################################################################
resource "azurerm_public_ip" "bastion-services-pubip" {
  name                = "bastion-services-pubip"
  location            = var.location-spoke-services
  resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}
resource "azurerm_bastion_host" "bastion-services" {
  name                = "bastion-services"
  location            = var.location-spoke-services
  resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name

  ip_configuration {
    name                 = "bastion-services-configuration"
    subnet_id            = azurerm_subnet.bastion-services-subnet.id
    public_ip_address_id = azurerm_public_ip.bastion-services-pubip.id
  }
}
