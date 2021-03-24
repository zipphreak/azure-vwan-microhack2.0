terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.52.0"
    }
    fortios = {
      source  = "fortinetdev/fortios"
      version = "1.11.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {

  }
}
provider "fortios" {
  hostname     =  var.fg-mgmt-ip
  token        = var.fg-token
  insecure     = "true"
}