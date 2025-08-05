output "vm_public_ips" {
  value = azurerm_public_ip.vm[*].ip_address
}

output "vm_private_ips" {
  value = azurerm_network_interface.vm[*].private_ip_address
}

output "ssh_commands" {
  value = {
    vm1 = "ssh vm1"
    vm2 = "ssh vm2"
  }
}
