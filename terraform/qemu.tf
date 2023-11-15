resource "proxmox_vm_qemu" "resource-name" {
  for_each = { for machine in var.machines : machine.hostname => machine }

  name        = each.value.hostname
  target_node = "pve"
  clone       = "ubuntu-cloud"
  full_clone  = true

  # preprovision      = true
  os_type = "cloud-init"
  # ciuser     = "proxmox"
  # cipassword = "swordfish"
  cores  = each.value.cpu
  memory = each.value.memory

  // NETWORK
  automatic_reboot = true
  ipconfig0        = "ip=${each.value.ip},gw=192.168.0.1"
  ssh_user         = "ubuntu"
  ssh_private_key  = data.local_file.ssh_private_key.content
  sshkeys          = data.local_file.ssh_public_key.content

  // DISK
  # hotplug           = "network,disk,usb,memory,cpu"
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"
  boot     = "c"

  # disk {
  #   slot    = 0
  #   size    = "20G"
  #   storage = "local-lvm"

  #   type = "scsi"
  # }
}