
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
