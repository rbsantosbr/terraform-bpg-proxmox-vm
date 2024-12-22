# terraform-bpg-proxmox-vm

## Description

Terraform module which creates a proxmox vm.

## Usage

```hcl
module "proxmox_instance" {
    source "../terraform-bpg-proxmox-vm

    vm_name  = "vm01"
    vm_tags  = ["proxmox", "terraform"]
    nodename = pve-host01
    vm_id    = "1000"
    
    cpu = {
      cores = 2
      type  = "qemu64"
    }

    disk = {
      datastore = "local-lvm"
      image     = "local:iso/jammy-server-cloudimg-amd64.img"
      interface = virtio0
      iothread  = true
      discard   = on
      size      = 20
      format    = "raw"
    }

    memory = 2048

    dns = ["8.8.8.8", "8.8.4.4"]

    snippet = "local:snippets/snippets.yaml"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_bpg/proxmox"></a> [proxmox](#requirement\_bpg/proxmox) | >= 0.68.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [proxmox](#provider\_bpg/proxmox) | >= 0.68.0 |

## Inputs

- `vm_name`: Name of the vm instance.
- `vm_description`: VM description.
- `vm_tags`: VM tags.
- `nodename`: Hostname where the vm is allocated.
- `vm_id`: ID of the vm instance.
- `cpu`: The CPU configuration.
- `memory`: The memory configuration.
- `agent`: The QEMU agent configuration.
- `disk`: The disk configuration.
- `dns`: The DNS configuration.
- `ipv4`: The IPv4 configuration
- `snippet`: The identifier for a file containing custom user data.
- `net_interface`: A network device.
- `os_type`: The Operating System configuration.

## Outputs

- `vm_id`: ID of the vm instance.
- `vm_name`: Name of the vm instance.
- `vm_node_name`: Hostname where the vm is allocated.
- `vm_ip_address`: IP address of the vm instance.

## Notes

- To use this module you need to load a *.env* file ( `source .env`) exporting the following variables with their respective values:

```bash
  export PROXMOX_VE_ENDPOINT=''
  export PROXMOX_VE_API_TOKEN=''
  export PROXMOX_VE_SSH_AGENT=true
  export PROXMOX_VE_SSH_USERNAME=''
```
