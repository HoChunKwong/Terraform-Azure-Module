resource "azurerm_virtual_network" "vnet" {
  name                = "${var.base_name}-vnet"
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
  tags = var.tags
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.base_name}-subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_public_ip" "publicip" {
  count               = var.vmcount
  name                = "${var.base_name}-nsg-${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
  tags                = var.tags
}

resource "azurerm_network_interface" "nic" {
  count               = var.vmcount
  name                = "${var.base_name}-nic-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.publicip.*.id, count.index)
  }

}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.base_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
 

  dynamic "security_rule" {

    for_each = var.nsg_rules 
    content {
    name                        = security_rule.value["name"]
    priority                    = security_rule.value["priority"]
    direction                   = security_rule.value["direction"]
    access                      = security_rule.value["access"]
    protocol                    = security_rule.value["protocol"]
    source_port_range           = security_rule.value["source_port_range"]
    destination_port_range      = security_rule.value["destination_port_range"]
    source_address_prefix       = security_rule.value["source_address_prefix"]
    destination_address_prefix  = security_rule.value["destination_address_prefix"]
    }
}

    tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "watson-sga" {
  count                     = var.vmcount 
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_linux_virtual_machine" "vm" {
  count                 = var.vmcount
  name                  = "${var.base_name}-vm-${count.index}"
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.size 
  admin_username        = "adminuser"
  network_interface_ids = [
    element(azurerm_network_interface.nic.*.id, count.index)
    ,
    ]
  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")

  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version = var.vmversion
  }
}