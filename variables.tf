variable "location-hub-1" {
  description = "Location to deploy hub-1"
  type        = string
  default     = "EastUS2"
}
variable "location-hub-2" {
  description = "Location to deploy hub-2"
  type        = string
  default     = "WestUS2"
}
variable "location-onprem" {
  description = "Location to deploy onprem"
  type        = string
  default     = "EastUS2"
}
variable "location-spoke-services" {
  description = "Location to deploy spoke-services"
  type        = string
  default     = "CentralUS"
}
variable "hub1-cidr" {
  description = "HUB1-CIDR RANGE"
  type        = string
  default     = "10.100.0.0/16"
}
variable "hub1-subnet1" {
  description = "HUB1-CIDR SUBNET1"
  type        = string
  default     = "10.100.0.0/24"
}
variable "hub2-cidr" {
  description = "HUB2-CIDR RANGE"
  type        = string
  default     = "10.200.0.0/16"
}
variable "hub2-subnet1" {
  description = "HUB1-CIDR SUBNET1"
  type        = string
  default     = "10.200.0.0/24"
}
variable "spoke1-cidr" {
  description = "SPOKE1-CIDR RANGE"
  type        = string
  default     = "10.1.0.0/16"
}
variable "spoke1-subnet1" {
  description = "SPOKE1-CIDR SUBNET1"
  type        = string
  default     = "10.1.0.0/24"
}
variable "spoke1-subnet2" {
  description = "SPOKE1-CIDR SUBNET2"
  type        = string
  default     = "10.1.1.0/24"
}
variable "spoke1-subnet3" {
  description = "SPOKE1-CIDR SUBNET3"
  type        = string
  default     = "10.1.2.0/24"
}
variable "spoke2-cidr" {
  description = "SPOKE2-CIDR RANGE"
  type        = string
  default     = "10.2.0.0/16"
}
variable "spoke2-subnet1" {
  description = "spoke2-CIDR SUBNET1"
  type        = string
  default     = "10.2.0.0/24"
}
variable "spoke2-subnet2" {
  description = "spoke2-CIDR SUBNET2"
  type        = string
  default     = "10.2.1.0/24"
}
variable "spoke2-subnet3" {
  description = "spoke2-CIDR SUBNET3"
  type        = string
  default     = "10.2.2.0/24"
}
variable "spoke3-cidr" {
  description = "SPOKE3-CIDR RANGE"
  type        = string
  default     = "10.3.0.0/16"
}
variable "spoke3-subnet1" {
  description = "spoke3-CIDR SUBNET1"
  type        = string
  default     = "10.3.0.0/24"
}
variable "spoke3-subnet2" {
  description = "spoke3-CIDR SUBNET2"
  type        = string
  default     = "10.3.1.0/24"
}
variable "spoke3-subnet3" {
  description = "spoke3-CIDR SUBNET3"
  type        = string
  default     = "10.3.2.0/24"
}
variable "spoke4-cidr" {
  description = "SPOKE4-CIDR RANGE"
  type        = string
  default     = "10.4.0.0/16"
}
variable "spoke4-subnet1" {
  description = "spoke4-CIDR SUBNET1"
  type        = string
  default     = "10.4.0.0/24"
}
variable "spoke4-subnet2" {
  description = "spoke4-CIDR SUBNET2"
  type        = string
  default     = "10.4.1.0/24"
}
variable "spoke4-subnet3" {
  description = "spoke4-CIDR SUBNET3"
  type        = string
  default     = "10.4.2.0/24"
}
variable "nva-cidr" {
  description = "NVA-CIDR RANGE"
  type        = string
  default     = "10.20.0.0/16"
}
variable "nva-subnet1" {
  description = "nva-CIDR SUBNET1"
  type        = string
  default     = "10.20.0.0/24"
}
variable "nva-subnet2" {
  description = "nva-CIDR SUBNET2"
  type        = string
  default     = "10.20.1.0/24"
}
variable "nva-subnet3" {
  description = "nva-CIDR SUBNET3"
  type        = string
  default     = "10.20.2.0/24"
}
variable "nva-vm1-ip" {
 description = "nva-VM1 IP"
  type        = string
  default     = "10.20.2.4"
}
variable "shared-cidr" {
  description = "SHARED-CIDR RANGE"
  type        = string
  default     = "10.10.0.0/16"
}
variable "shared-subnet1" {
  description = "shared-CIDR SUBNET1"
  type        = string
  default     = "10.10.0.0/24"
}
variable "shared-subnet2" {
  description = "shared-CIDR SUBNET2"
  type        = string
  default     = "10.10.1.0/24"
}
variable "shared-subnet3" {
  description = "shared-CIDR SUBNET3"
  type        = string
  default     = "10.10.2.0/24"
}
variable "onprem-cidr" {
  description = "ONPREM-CIDR RANGE"
  type        = string
  default     = "10.0.0.0/16"
}
variable "onprem-subnet1" {
  description = "ONPREM1-CIDR RANGE"
  type        = string
  default     = "10.0.0.0/24"
}
variable "onprem-subnet2" {
  description = "ONPREM2-CIDR RANGE"
  type        = string
  default     = "10.0.1.0/24"
}
variable "onprem-subnet3" {
  description = "ONPREM2-CIDR RANGE"
  type        = string
  default     = "10.0.2.0/24"
}
variable "username" {
  description = "Username for Virtual Machines"
  type        = string
  default     = "AzureAdmin"
}
variable "vngBGPAS" {
  description = "VNG BGP AS"
  type = string
  default = "64000"
}
variable "password" {
  description = "Virtual Machine password, must meet Azure complexity requirements"
   type        = string
   default     = "Microhack2020"
}
variable "vmsize" {
  description = "Size of the VMs"
  default     = "Standard_B1s"
}
