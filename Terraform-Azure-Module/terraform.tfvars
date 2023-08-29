base_name = "testing"
location  = "East US"
vmcount   = 2
tags = {
  "Environment" = "testing"
  "Owner"       = "Trustmaque"
}
nsg_rules = [
  {
    name                       = "testing-nsg-rules"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "81.100.69.57"
    destination_address_prefix = "*"
  }
]


