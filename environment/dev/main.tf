module "rgs" {
  source = "../../modules/rg"
  resource_groups = var.resource_groups
}

module "vnets" {
  depends_on = [ module.rgs ]
  source = "../../modules/vnet"
  vnets = var.vnets
}

module "vms" {
  depends_on = [ module.rgs, module.vnets ]
  source = "../../modules/vm"
  linux_vms = var.linux_vms

}

module "nsg" {
  depends_on = [ module.rgs, module.vnets, module.vms ]
  source = "../../modules/nsg"
  nsgs = var.nsgs
}

module "nsgassoc" {
  depends_on = [  module.nsg ]
  source = "../../modules/nsg_assoc"
  nsg_subnet_associations = var.nsgassoc
}