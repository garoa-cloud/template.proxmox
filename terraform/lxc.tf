

resource "proxmox_lxc" "basic" {
  for_each = { for container in var.containers : container.hostname => container }

  target_node = "pve"
  hostname    = each.value.hostname
  ostemplate  = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
  start       = true

  cores  = each.value.cpu
  memory = each.value.memory

  password     = "BasicLXCContainer"
  unprivileged = false


  features {
    nesting = false
  }

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = each.value.ip
    gw     = var.gateway

  }

  ssh_public_keys = data.local_file.ssh_public_key.content
}

