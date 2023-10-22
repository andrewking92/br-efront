resource "azurerm_linux_virtual_machine" "test" {
  for_each = var.azure_vm_configs

  name                = each.value.virtual_machine_name

  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  size                = "Standard_F2"
  admin_username      = "adminuser"

  network_interface_ids = [var.network_interface_ids[each.key],]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file(each.value.public_key_file_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}