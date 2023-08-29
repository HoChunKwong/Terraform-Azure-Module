  variable "base_name" {
    type        =  string
    description = "The base of the name for the resource group, storage account and Virtual Machine"
}

variable "location" {
    type        = string
    description = "The location for the deployment"
}

variable "resource_group_name" {
    type         = string
    description  = "The name of resource group"
}

variable "address_space" {
    type        = list(any)
    description = "the address space of the VNet"
    default     = ["10.13.0.0/16"]
}

variable "address_prefixes" {
    type        = list(any)
    description = "the address prefixes of the VNet"
    default     = ["10.123.1.0/24"]
}

variable "vmcount" {
    type        = number
    description = "Number of VM"
    default     = 1
}

variable "nsg_rules" {
    type = list(object({
        name                        = string
        priority                    = number
        direction                   = string
        access                      = string
        protocol                    = string
        source_port_range           = string 
        destination_port_range      = string
        source_address_prefix       = string
        destination_address_prefix  = string 
    }))

    description = "The values for each NSG rule"
}

variable "size" {
    type        = string
    description = "The size of VM"
    default     = "Standard_B1s"
}

variable "admin_username" {
    type        = string
    description = "VM admin username"
    default     = "adminuser" 
}

variable "publisher" {
    type        = string
    description = "source image reference's publisher"
    default     = "MicrosoftWindowsServer"
}

variable "offer" {
    type        = string
    description = "source image reference's offer"
    default     = "WindowsServer"
}

variable "sku" {
    type        = string
    description = "source image reference's sku"
    default     = "2019-Datacenter"
}

variable "vmversion" {
    type        = string 
    description = "source image reference's version"
    default     = "latest"
}


variable "tags" {
    type        = map(string)
    description = "Tags used fro the deployment"
    default     = {
                "Environment" = "local"
                "Owner"       = "Trustmarque"
    }   
}


  
  
  