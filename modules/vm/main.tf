# ─────────────────────────────────────────
# NETWORK INTERFACE CARDS
# ─────────────────────────────────────────
resource "azurerm_network_interface" "nic" {
  for_each = var.linux_vms

  name                = "${each.key}-nic"
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.datasubnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

# ─────────────────────────────────────────
# LINUX VIRTUAL MACHINES
# ─────────────────────────────────────────
resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.linux_vms

  name                            = each.key
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  size                            = each.value.vm_size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.nic[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
