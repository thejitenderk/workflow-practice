output "vm_ips" {
  value = {
    for k,v in azurerm_public_ip.public_ip :
    k => v.ip_address
  }
}