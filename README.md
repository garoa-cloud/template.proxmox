# Proxmox Template


## How to use it?
1. Create SSH keys to connect to VMs
```sh
ssh-keygen -t rsa -b 2048 -f vm_pem
``````

2. Copy `vars.tfvars.template` to `terraform.tfvars`` and fill with proxmox connection params.
```sh
cp vars.tfvars.template terraform.tfvars
```

```terraform
proxmox_api         = "https://192.168.0.158:8006/api2/json"
proxmox_username    = username
proxmox_password    = passwd
```

3. Modify resource settings on `vars.tf``

4. Initialize Terraform
```sh
cd terraform
terraform init

```

5. Apply resources
```sh
terraform apply
``````