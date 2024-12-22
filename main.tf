resource "proxmox_virtual_environment_vm" "this" {
  name        = var.vm_name
  description = var.vm_description
  tags        = var.vm_tags

  node_name = var.nodename
  vm_id     = var.vm_id


  cpu {
    cores = var.cpu["cores"]
    type  = var.cpu["type"]
  }

  memory {
    dedicated = var.memory
  }


  agent {
    # read 'Qemu guest agent' section, change to true only when ready
    enabled = var.agent
  }

  startup {
    order      = "3"
    up_delay   = "60"
    down_delay = "60"
  }

  disk {
    datastore_id = var.disk["datastore"]
    file_id      = var.disk["image"]
    interface    = var.disk["interface"]
    iothread     = var.disk["iothread"]
    discard      = var.disk["discard"]
    size         = var.disk["size"]
    file_format  = var.disk["format"]
  }


  initialization {
    dns {
      servers = var.dns
    }
    ip_config {
      ipv4 {
        address = var.ipv4["address"]
        gateway = var.ipv4["gateway"]
      }
    }
    datastore_id = var.disk["datastore"]

    user_data_file_id = var.snippet
  }

  network_device {
    bridge  = var.net_device["bridge"]
    vlan_id = var.net_device["vlan"]
  }

  operating_system {
    type = var.os_type
  }

  keyboard_layout = "no"

  lifecycle {
    ignore_changes = [
      network_device,
    ]
  }


}