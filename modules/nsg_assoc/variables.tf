variable "nsg_subnet_associations" {
  description = "Map of NSG to Subnet associations"
  type = map(object({
    subnet_name          = string
    nsgname              = string
    virtual_network_name = string
    resource_group_name  = string
  }))
}
