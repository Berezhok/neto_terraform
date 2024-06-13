###cloud vars
variable "token" {
  type        = string
  default     = "####"
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  default = "b1gls123arn38ddjtrd9"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default = "b1g8qo5pjsu3j0o951sk"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

# variable "vms_ssh_root_key" {
#   type        = string
#   default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDMk6iEBaPkUGUpSD6SzGMcrDpKF56Eb+RAWFK+Je47N4w0/ZBsJp0GXjOS9Zafs/9ZNDGWcyp7ElUX37cJ8Vm7PHpIJCfsUfWrZS83a16+gHS2m+5Y265xUDeP9CuoUMR40D23xs5WXdgkKQ7JE2Zi9y1Gaiq+bnboZOUR1ASDPVGrF6uSlnZcSkMbb/vWGbjdr3xZQ/0z/T/sHqfRZsJ90irR/z0bjchPpiCcYPGZfQvK1taESjJt8YUCQ5DEqgtM7OwCLhV8wxN5zJV+8GbLFCuzTrM40XLMProuVXX0YvRNidpJokKDLvp4A+6QVgZ9DiSIL2N3cjbZC6T0pkXg8HonsC+PeB4npXupoy1zqGKlauzNAxM9gjP/1NbCx7Cu3/tekWsuMl76tm+eY2X3Qp37N+OF3aKD5EWU1PzXGFldGD5YayiKr4kebuMGZ02WprH6GooebNijmkrfsVliKpzeYQPbvTnzRp9ZNcGq0Qq7bSpXaLsT3N5oBGsVmTE= ubuntu@ubuntu"
#   description = "ssh-keygen -t ed25519"
# }

variable "vm_web_yandex_compute_image" {
  type = string
  default = "ubuntu-2004-lts"
}


variable "foreach" {
  type = list(object({
    vm_name      = string,
    cores         = number,
    memory        = number,
    core_fraction = number,
    disk_volume   = number

  }))
  default = [
    {
        vm_name       = "main"
        cores         = 2
        memory        = 1
        core_fraction = 20
        disk_volume   = 15
    },
     {
        vm_name       = "replica"
        cores         = 4
        memory        = 2
        core_fraction = 20
        disk_volume   = 10
    }
  ]
}

locals {
  metadata = {
    serial-port-enable = 1
    ssh-keys = "${file("id_rsa.pub")}"
  }
}

variable "storage"{
  type=object({name=string,disktype=string,disksize=number,resources=map(number)})
  default={
    name = "storage"
    disktype = "network-hdd"
    disksize = 15
    resources = {
      cpu=2
      ram=1
      core_fraction = 20  
    }
  }
}

variable "default_vm"{
  type=object({disktype=string,disksize=number,resources=map(number)})
  default={
    disktype = "network-hdd"
    disksize = 5
    resources = {
      cpu=2
      ram=1
      core_fraction = 20  
    }
  }
}