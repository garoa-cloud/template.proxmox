variable "proxmox_api_url" {
  type = string
}

variable "proxmox_username" {
  type      = string
  sensitive = true
}

variable "proxmox_password" {
  type      = string
  sensitive = true
}

variable "gateway" {
  type    = string
  default = "192.168.0.1"

}


variable "machines" {
  type = list(object({
    hostname = string
    ip       = string
    cpu      = number
    memory   = number
  }))

  default = [
    {
      hostname = "manager-1.k3s"
      ip       = "192.168.0.171/24"
      cpu      = 2
      memory   = 2046
    },
    # {
    #   hostname = "manager-2.k3s"
    #   ip       = "192.168.0.172/24"
    #   cpu      = 2
    #   memory   = 2046
    # },
    # {
    #   hostname = "manager-3.k3s"
    #   ip       = "192.168.0.173/24"
    #   cpu      = 2
    #   memory   = 2046
    # },
    {
      hostname = "worker-1.k3s"
      ip       = "192.168.0.181/24"
      cpu      = 2
      memory   = 2046
    },
    {
      hostname = "worker-2.k3s"
      ip       = "192.168.0.182/24"
      cpu      = 2
      memory   = 2046
    }
  ]
}
variable "containers" {
  type = list(object({
    hostname = string
    ip       = string
    cpu      = number
    memory   = number
  }))

  default = []
}