variable "vm_name" {
  description = "VM name"
  type        = string
}

variable "vm_description" {
  description = "VM decription"
  type        = string
  default     = "Managed by Terraform"
}

variable "vm_tags" {
  description = "VM tags"
  type        = list(string)
  default     = ["terraform"]
}

variable "nodename" {
  description = "Proxmox host"
  type        = string
  default     = "none"
}

variable "vm_id" {
  description = "Proxmox vm id"
  type        = string
}

variable "cpu" {
  description = "CPU configuration"
  type = object({
    cores = number
    type  = string
  })
  default = {
    cores = 1
    type  = "x86-64-v2-AES"
  }
}

variable "memory" {
  description = "VM memory"
  type        = number
  default     = 1024
}

variable "agent" {
  description = "QEMU agent"
  type        = bool
  default     = true
}

variable "disk" {
  description = "VM disk"
  type = object({
    datastore = string
    image     = string
    interface = string
    iothread  = bool
    discard   = string
    size      = number
    format    = string
  })

  validation {
    condition     = contains(["qcow2", "raw", "vmdk"], var.disk["format"])
    error_message = "The disk format is invalid. "
  }

  # Review this validation rule
  validation {
    condition     = contains(["scsi", "sata", "virtio"], replace(var.disk["interface"], "0", ""))
    error_message = "The disk interface is invalid."
  }
}

variable "dns" {
  description = "VM dns servers"
  type        = set(string)
}

variable "ipv4" {
  description = "VM ipv4 address"
  type        = map(string)
  default = {
    address = "dhcp"
    gateway = null
  }
}

variable "snippet" {
  description = "User data - Cloud init"
  type        = string
  default     = "none"
}

variable "net_interface" {
  description = "VM interface"
  type        = map(string)
  default = {
    bridge = "vmbr0"
    vlan   = "128"
  }
}

variable "os_type" {
  description = "The Operating System configuration"
  type        = string
  default     = "l26"
}


