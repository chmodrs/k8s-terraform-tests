resource "azurerm_network_security_group" "temyterraformpublicipnsg2" {
    name                = "myNetworkSecurityGroup2"
    location            = "eastus"
    resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"

    security_rule {
        name                       = "HTTP"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "187.4.254.146/32"
        destination_address_prefix = "*"
    }

    tags {
        environment = "Terraform Demo"
    }
}
