variable "base_name" {
  type        = string
  description = "he base of the name for the resource group, storage account and Virtual Machine"
}

variable "location" {
  type        = string
  description = "The location for the deployment"
}

variable "vmcount" {
  type        = number
  description = "Number of VM"
  default     = 1
}

variable "nsg_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))

  description = "The values for each NSG rule"
}


variable "tags" {
  type        = map(string)
  description = "Tags used fro the deployment"
  default = {
    "Environment" = "local"
    "Owner"       = "Trustmarque"
  }
}
