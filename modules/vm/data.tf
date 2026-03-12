data "azurerm_subnet" "datasubnet" {
  for_each             = var.linux_vms
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}
