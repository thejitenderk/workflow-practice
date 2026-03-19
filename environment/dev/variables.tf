variable "resource_groups" {
  description = "Map of resource groups to create"
  type = map(object({
    location = string
  }))
}

variable "vnets" {
  description = "Map of VNets with their subnets"
  type = map(object({
    resource_group_name = string
    address_space       = list(string)
    location            = string

    subnets = list(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))
}


# variable "linux_vms" {
  
# }

variable "windowsvm" {
  
}

variable "nsgs" {
  
}

variable "nsgassoc" {
  
}