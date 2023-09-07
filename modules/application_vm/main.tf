resource "azurerm_linux_virtual_machine" "test" {
  name                = var.virtual_machine_name

  resource_group_name = var.resource_group_name
  location            = var.location

  size                = "Standard_F2"
  admin_username      = "adminuser"

  network_interface_ids = [
    var.network_interface_id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file(var.public_key_file_path)
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