

variable "linux_vms" {
  description = "Map of Linux VMs"
  type = map(object({
    resource_group_key = string
    vnet_key           = string
    subnet_key         = string
    vm_size            = string
    admin_username     = string
    os_disk_type       = string
    tags               = map(string)
    image = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}
