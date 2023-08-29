variable "base_name" {
    type        =  string
    description = "The base of the name for the resource group and storage account"
}

variable "location" {
    type        = string
    description = "The location for the deployment"
}

variable "tags" {
    type        = map(string)
    description = "Tags used fro the deployment"
    default     = {
                "Environment" = "local"
                "Owner"       = "Trustmarque"
    }
}
