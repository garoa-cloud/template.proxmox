terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }
  }
}

provider "proxmox" {
  pm_api_url  = var.proxmox_api_url
  pm_user     = var.proxmox_username
  pm_password = var.proxmox_password
}

data "local_file" "ssh_public_key" {
  filename = "${path.module}/../keys/vm_pem.pub"
}

data "local_file" "ssh_private_key" {
  filename = "${path.module}/../keys/vm_pem"
}
