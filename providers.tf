terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.83.2"
    }
  }
  required_version = ">= 0.13"
}

provider "proxmox" {
  random_vm_ids = true
}
