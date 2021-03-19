terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.52.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {

  }
}
#######################################################################
## Create Resource Group
#######################################################################

resource "azurerm_resource_group" "vwan-microhack-spoke-rg" {
  name     = "vwan-microhack-spoke-rg"
  location = var.location-hub-1
 tags = {
    environment = "spoke"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}

resource "azurerm_resource_group" "vwan-microhack-hub-rg" {

  name     = "vwan-microhack-hub-rg"
  location = var.location-hub-1
 tags = {
    environment = "hub"
    deployment  = "terraform"
    microhack    = "vwan"
  }
}
