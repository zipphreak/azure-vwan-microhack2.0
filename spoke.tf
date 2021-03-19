resource "azurerm_virtual_network" "spoke-1-vnet" {
  name                = "spoke-1-vnet"
  location            = var.location-hub-1
  resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name
  address_space       = [var.spoke1-cidr]
  tags = {
    environment = "spoke-1"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_subnet" "spoke-1-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-1-vnet.name
  address_prefixes       = [var.spoke1-subnet1]
}
resource "azurerm_subnet" "bastion-spoke-1-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-1-vnet.name
  address_prefixes       = [var.spoke1-subnet2]
}
resource "azurerm_virtual_network" "spoke-2-vnet" {
  name                = "spoke-2-vnet"
  location            =  var.location-hub-1
  resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name
  address_space       = [var.spoke2-cidr]
  tags = {
    environment = "spoke-2"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_subnet" "spoke-2-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-2-vnet.name
  address_prefixes       = [var.spoke2-subnet1]
}
resource "azurerm_subnet" "bastion-spoke-2-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-2-vnet.name
  address_prefixes       = [var.spoke2-subnet2]
}
resource "azurerm_virtual_network" "spoke-3-vnet" {
  name                = "spoke-3-vnet"
  location            =  var.location-hub-2
  resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name
  address_space       = [var.spoke3-cidr]
  tags = {
    environment = "spoke-3"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_subnet" "spoke-3-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-3-vnet.name
  address_prefixes       = [var.spoke3-subnet1]
}
resource "azurerm_subnet" "bastion-spoke-3-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-3-vnet.name
  address_prefixes       = [var.spoke3-subnet2]
}
resource "azurerm_virtual_network" "spoke-4-vnet" {
  name                = "spoke-4-vnet"
  location            =  var.location-hub-2
  resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name
  address_space       = [var.spoke4-cidr]
  tags = {
    environment = "spoke-4"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_subnet" "spoke-4-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-4-vnet.name
  address_prefixes       = [var.spoke4-subnet1]
}
resource "azurerm_subnet" "bastion-spoke-4-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.spoke-4-vnet.name
  address_prefixes       = [var.spoke4-subnet2]
}
resource "azurerm_virtual_network" "onprem-vnet" {
  name                = "onprem-vnet"
  location            = var.location-onprem
  resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name
  address_space       = [var.onprem-cidr]
  tags = {
    environment = "onprem"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_subnet" "onprem-vm-subnet" {
  name                 = "vmSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.onprem-vnet.name
  address_prefixes       = [var.onprem-subnet1]
}
resource "azurerm_subnet" "bastion-onprem-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.onprem-vnet.name
  address_prefixes       = [var.onprem-subnet2]
}
resource "azurerm_subnet" "onprem-gateway-subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.onprem-vnet.name
  address_prefixes       = [var.onprem-subnet3]
}
resource "azurerm_virtual_network" "services-vnet" {
  name                = "services-vnet"
  location            = var.location-spoke-services
  resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name
  address_space       = [var.shared-cidr]
  tags = {
    environment = "services"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_subnet" "services-vm-1-subnet" {
  name                 = "servicesSubnet-1"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.services-vnet.name
  address_prefixes       = [var.shared-subnet1]
}
resource "azurerm_subnet" "services-vm-2-subnet" {
  name                 = "servicesSubnet-2"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.services-vnet.name
  address_prefixes       = [var.shared-subnet2]
}
resource "azurerm_subnet" "bastion-services-subnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.services-vnet.name
  address_prefixes       = [var.shared-subnet3]
}
resource "azurerm_virtual_network" "nva-vnet" {
  name                = "nva-vnet"
  location            = var.location-spoke-services
  resource_group_name = azurerm_resource_group.vwan-microhack-spoke-rg.name
  address_space       = [var.nva-cidr]
  tags = {
    environment = "nva"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_subnet" "nva-subnet-1" {
  name                 = "nva-subnet-1"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.nva-vnet.name
  address_prefixes       = [var.nva-subnet1]
}
resource "azurerm_subnet" "nva-subnet-2" {
  name                 = "nva-subnet-2"
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  virtual_network_name = azurerm_virtual_network.nva-vnet.name
  address_prefixes       = [var.nva-subnet2]
}
resource "azurerm_network_interface" "spoke-1-nic" {
  name                 = "spoke-1-nic"
  location             = var.location-hub-1
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  enable_ip_forwarding = false
  ip_configuration {
    name                          = "spoke-1-ipconfig"
    subnet_id                     = azurerm_subnet.spoke-1-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    environment = "spoke-1"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_network_interface" "spoke-2-nic" {
  name                 = "spoke-2-nic"
  location             = var.location-hub-1
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  enable_ip_forwarding = false
  ip_configuration {
    name                          = "spoke-2-ipconfig"
    subnet_id                     = azurerm_subnet.spoke-2-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    environment = "spoke-1"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_network_interface" "spoke-3-nic" {
  name                 = "spoke-3-nic"
  location             = var.location-hub-2
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  enable_ip_forwarding = false
  ip_configuration {
    name                          = "spoke-3-ipconfig"
    subnet_id                     = azurerm_subnet.spoke-3-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    environment = "spoke-3"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_network_interface" "spoke-4-nic" {
  name                 = "spoke-4-nic"
  location             = var.location-hub-2
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  enable_ip_forwarding = false
  ip_configuration {
    name                          = "spoke-4"
    subnet_id                     = azurerm_subnet.spoke-4-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    environment = "spoke-4"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_network_interface" "onprem-nic" {
  name                 = "onprem-nic"
  location             = var.location-onprem
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  enable_ip_forwarding = false
  ip_configuration {
    name                          = "onprem-ipconfig"
    subnet_id                     = azurerm_subnet.onprem-vm-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    environment = "onprem"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_network_interface" "spoke-addc-1-nic" {
  name                 = "spoke-addc-1-nic"
  location             = var.location-spoke-services
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  enable_ip_forwarding = false
  ip_configuration {
    name                          = "addc-1-ipconfig"
    subnet_id                     = azurerm_subnet.services-vm-1-subnet.id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    environment = "services"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_windows_virtual_machine" "spoke-1-vm" {
  name                  = "spoke-1-vm"
  location              = var.location-hub-1
  resource_group_name   = azurerm_resource_group.vwan-microhack-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.spoke-1-nic.id]
  size               = var.vmsize
  computer_name  = "spoke-1-vm"
  admin_username = var.username
  admin_password = var.password
  provision_vm_agent = true
  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  os_disk {
    name              = "spoke-1-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  tags = {
    environment = "spoke-1"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_windows_virtual_machine" "spoke-2-vm" {
  name                  = "spoke-2-vm"
  location              = var.location-hub-1
  resource_group_name   = azurerm_resource_group.vwan-microhack-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.spoke-2-nic.id]
  size               = var.vmsize
  computer_name  = "spoke-2-vm"
  admin_username = var.username
  admin_password = var.password
  provision_vm_agent = true
  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  os_disk {
    name              = "spoke-2-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  tags = {
    environment = "spoke-2"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_windows_virtual_machine" "spoke-3-vm" {
  name                  = "spoke-3-vm"
  location              = var.location-hub-2
  resource_group_name   = azurerm_resource_group.vwan-microhack-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.spoke-3-nic.id]
  size               = var.vmsize
  computer_name  = "spoke-3-vm"
  admin_username = var.username
  admin_password = var.password
  provision_vm_agent = true
  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  os_disk {
    name              = "spoke-3-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  tags = {
    environment = "spoke-3"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_windows_virtual_machine" "spoke-4-vm" {
  name                  = "spoke-4-vm"
  location              = var.location-hub-2
  resource_group_name   = azurerm_resource_group.vwan-microhack-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.spoke-4-nic.id]
  size               = var.vmsize
  computer_name  = "spoke-4-vm"
  admin_username = var.username
  admin_password = var.password
  provision_vm_agent = true
  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  os_disk {
    name              = "spoke-4-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  tags = {
    environment = "spoke-4"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_windows_virtual_machine" "onprem-vm" {
  name                  = "onprem-vm"
  location              = var.location-onprem
  resource_group_name   = azurerm_resource_group.vwan-microhack-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.onprem-nic.id]
  size               = var.vmsize
  computer_name  = "onprem-vm"
  admin_username = var.username
  admin_password = var.password
  provision_vm_agent = true

  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  os_disk {
    name              = "onprem-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  tags = {
    environment = "onprem"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_windows_virtual_machine" "spoke-addc-vm" {
  name                  = "spoke-addc-vm"
  location              = var.location-spoke-services
  resource_group_name   = azurerm_resource_group.vwan-microhack-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.spoke-addc-1-nic.id]
  size               = var.vmsize
  computer_name  = "spoke-addc-vm"
  admin_username = var.username
  admin_password = var.password
  provision_vm_agent = true

  source_image_reference {
    offer     = "WindowsServer"
    publisher = "MicrosoftWindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  os_disk {
    name              = "spoke-addc-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  tags = {
    environment = "addc"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_public_ip" "nva-iptables-vm-pub-ip"{
    name                 = "nva-iptables-vm-pub-ip"
    location             = var.location-spoke-services
    resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
    allocation_method   = "Static"
    tags = {
      environment = "nva"
      deployment  = "terraform"
      microhack    = "vwan"
    }
}
resource "azurerm_network_security_group" "nva-iptables-vm-nsg"{
    name = "nva-iptables-vm-nsg"
    location             = var.location-spoke-services
    resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name

    security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    }
    security_rule {
    name                       = "http"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    }
    security_rule {
    name                       = "https"
    priority                   = 210
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    }
    security_rule {
    name                       = "icmp"
    priority                   = 220
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    }

    tags = {
      environment = "nva"
      deployment  = "terraform"
      microhack    = "vwan"
    }
}
resource "azurerm_network_interface" "nva-iptables-vm-nic-1" {
  name                 = "nva-iptables-vm-nic-1"
  location             = var.location-spoke-services
  resource_group_name  = azurerm_resource_group.vwan-microhack-spoke-rg.name
  enable_ip_forwarding = true
  ip_configuration {
    name                          = "nva-1-ipconfig"
    subnet_id                     = azurerm_subnet.nva-subnet-1.id
    private_ip_address_allocation = "Static"
    private_ip_address = "10.20.0.4"
    public_ip_address_id = azurerm_public_ip.nva-iptables-vm-pub-ip.id
  }
  tags = {
    environment = "nva"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
resource "azurerm_network_interface_security_group_association" "nva-iptables-vm-nsg-ass" {
  network_interface_id      = azurerm_network_interface.nva-iptables-vm-nic-1.id
  network_security_group_id = azurerm_network_security_group.nva-iptables-vm-nsg.id
}
resource "azurerm_linux_virtual_machine" "nva-iptables-vm" {
  name                  = "nva-iptables-vm"
  location              = var.location-spoke-services
  resource_group_name   = azurerm_resource_group.vwan-microhack-spoke-rg.name
  network_interface_ids = [azurerm_network_interface.nva-iptables-vm-nic-1.id]
  size               = var.vmsize
  admin_username = var.username
  admin_password = var.password
  disable_password_authentication = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  os_disk {
    name              = "nva-iptables-vm-osdisk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }  

  tags = {
    environment = "nva"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
