output "vm_ip_address" {
  value = try(
    flatten(proxmox_virtual_environment_vm.this.ipv4_addresses)[1],
    ""
  )
}

output "vm_id" {
  value = proxmox_virtual_environment_vm.this.id
}

output "vm_name" {
  value = proxmox_virtual_environment_vm.this.name
}

output "vm_node_name" {
  value = proxmox_virtual_environment_vm.this.node_name
}
