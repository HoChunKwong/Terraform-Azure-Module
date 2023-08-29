This module creates azure resource group, storage account and Virtual Machine. It aims for creating reusable Terraform modules to deploy Azure resources repeatadly and consistently. 

Rules are defined in the vairable and a Dynamic block is used to loop through and create NSG rule.

location = "<location>"
resource_group_name = "<resource group name>"
name = "<NSG name"
tags = {
"<key>" = "<value>"
"<key>" = "<value>"
}
nsg_rules = [
{
name = "AllowWebIn"
priority = 100
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = ""
destination_port_range = "80"
source_address_prefix = ""
destination_address_prefix = ""
},
{
name = "AllowSSLIn"
priority = 110
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = ""
destination_port_range = "443"
source_address_prefix = ""
destination_address_prefix = ""
},
{
name = "AllowRDPIn"
priority = 120
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = ""
destination_port_range = "3389"
source_address_prefix = ""
destination_address_prefix = "*"
} ]


Variables vmcount for creating multiple VMs in Azure. Insert the expected number vm in vmcount value and used to loop thorugh and create each Virtual machine.

vmcount = "<number of vm creation>"


