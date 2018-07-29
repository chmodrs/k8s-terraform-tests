resource "azurerm_public_ip" "k8s-node1-ip" {
    name                         = "k8s-node1-ip"
    location                     = "eastus"
    resource_group_name          = "${azurerm_resource_group.myterraformgroup.name}"
    public_ip_address_allocation = "dynamic"

    tags {
        environment = "Terraform Demo"
    }
}
