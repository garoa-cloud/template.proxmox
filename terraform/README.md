SSH to your node

Download a cloud image, you can find Ubuntu versions on https://cloud-images.ubuntu.com/

```sh
wget https://cloud-images.ubuntu.com/mantic/current/mantic-server-cloudimg-amd64.img
```
Create a VM with a high ID so we can use it as a template
```sh
qm create 8000 --memory 2048 --name ubuntu-cloud --net0 virtio,bridge=vmbr0
```

Add the cloud-image image as a hard drive to our VM
```sh
qm importdisk 8000 mantic-server-cloudimg-amd64.img local-lvm
```

Set the hard driver controller as SCSI pointing to the device we create on previos step
```sh
qm set 8000 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-8000-disk-0
```

Mount a cloud image device as CD-ROM on the VM
```sh
qm set 8000 --ide2 local-lvm:cloudinit
```

Set the SCSI drive as the boot device
```sh
qm set 8000 --boot c --bootdisk scsi0
```

Add a VGA serial port, this is used so we can see the terminal output on proxmox
```sh
qm set 8000 --serial0 socket --vga serial0
```