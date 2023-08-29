variable "base_name" {
    type        = string
    description = "The storage account base name"
}

variable "resource_group_name"{
    type        = string
    description = "Name of the resource group"
}

variable "location" {
    type        = string
    description = "The location for the deployment"
}

variable "account_tier" {
    type        = string
    description = "The storage account tier"
    default     = "Standard"
}

variable "replication_type" {
    type        = string
    description = "The storage account replication type"
    default     = "GRS"
}

variable "tags" {
    type        = map(string)
    description = "Tags used fro the deployment"
    default     = {
                "Environment" = "local"
                "Owner"       = "Trustmarque"
    }
}

