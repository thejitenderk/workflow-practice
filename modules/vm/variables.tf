# variable "linux_vms" {
#   description = "Map of Linux VMs"
#   type = map(object({
#     resource_group_key = string
#     vnet_key           = string
#     subnet_key         = string
#     vm_size            = string
#     admin_username     = string
#     os_disk_type       = string
#     tags               = map(string)
#     image = object({
#       publisher = string
#       offer     = string
#       sku       = string
#       version   = string
#     })
#   }))
# }


variable "windowsvm" {
  description = "Map of windows VMs"
  type = map(object({
    resource_group_name  = string
    virtual_network_name = string
    location             = string
    subnet_name          = string
    vm_size              = string
    admin_username       = string
    admin_password       = string
  }))
}
