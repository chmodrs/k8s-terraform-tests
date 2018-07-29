resource "azurerm_network_interface" "k8s-node1-nic" {
    name                = "k8s-node1-nic"
    location            = "eastus"
    resource_group_name = "${azurerm_resource_group.myterraformgroup.name}"

    ip_configuration {
        name                          = "myNicConfiguration"
        subnet_id                     = "${azurerm_subnet.myterraformsubnet.id}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id          = "${azurerm_public_ip.k8s-node1-ip.id}"
    }

    tags {
        environment = "Terraform Demo"
    }
}
