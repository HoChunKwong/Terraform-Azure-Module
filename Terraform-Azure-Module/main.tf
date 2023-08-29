terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "ResourceGroup" {
  source    = "./ResourceGroup"
  base_name = var.base_name
  location  = var.location
  tags      = var.tags
}

module "StorageAccount" {
  source              = "./StorageAccount"
  base_name           = var.base_name
  resource_group_name = module.ResourceGroup.rg_name_out
  location            = var.location
  tags                = var.tags
}

module "VirtualMachine" {
  source              = "./VirtualMachine"
  base_name           = var.base_name
  resource_group_name = module.ResourceGroup.rg_name_out
  location            = var.location
  nsg_rules           = var.nsg_rules
  count               = var.vmcount
  tags                = var.tags
}




