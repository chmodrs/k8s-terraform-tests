resource "azurerm_virtual_machine" "k8s-node1" {
    name                  = "k8s-node1"
    location              = "eastus"
    resource_group_name   = "${azurerm_resource_group.myterraformgroup.name}"
    network_interface_ids = ["${azurerm_network_interface.k8s-node1-nic.id}"]
    vm_size               = "Standard_DS1_v2"

    storage_os_disk {
        name              = "k8s-node1-disk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "k8s-node1"
        admin_username = "azureuser"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/azureuser/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAwSGdMX+AkCj3Z4bBshcFv0qugHrGKOrMF5YoidW17275Z0Dl+AkFIubeB5Ma9jBhgaPe7UGQwnUV7U/AmMhf/IRburLqSArWXKz2WBRKnlRHU/fgh9U9NpKUT2ZMMrBqoNK3QtkxLk3OJ5DClEBRnsYdfsoRzwZa9ixonXGNXVMoE6jFU9D3o3Q7v6v3W9qbME435MZf80WW6nHo3HmProZSX9qV8/vhm8zjzEnz3ssq3ExBGCEEuDCfrkpcuDnzzmR8SPyq3LSOmhF7oWFnJ34wc77PJfSATaxHGlPEk4TJoReSSYLur6+jBiXTtbCbD7VUYpVdrFOfTUYQTUoqew=="
        }
    }

    boot_diagnostics {
        enabled     = "true"
        storage_uri = "${azurerm_storage_account.mystorageaccount.primary_blob_endpoint}"
    }

    tags {
        environment = "Terraform Demo"
    }
}
