data "azurerm_subnet" "datasubnet" {
  for_each             = var.nsg_subnet_associations
  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}


data "azurerm_network_security_group" "nsgdata" {
  for_each            = var.nsg_subnet_associations
  name                = each.value.nsgname
  resource_group_name = each.value.resource_group_name
}
