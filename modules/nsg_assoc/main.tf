resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  for_each = var.nsg_subnet_associations

  subnet_id                 = data.azurerm_subnet.datasubnet[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsgdata[each.key].id
}