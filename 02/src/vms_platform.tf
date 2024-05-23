variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_db_yandex_compute_image" {
  type = string
  default = "ubuntu-2004-lts"
}

variable "vm_db_yandex_compute_instance_name" {
  type = string
  default = "netology-develop-platform-db"
}

variable "vm_db_yandex_compute_instance_platform" {
  type = string
  default = "standard-v1"
}

variable "vpc_name_db" {
  type = string
  default = "db"
}

variable "default_cidr_db" {
  type = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vms_resources" {
  default = {
     web={
       cores          = 2
       memory         = 1
       core_fraction  = 5
     },
     db= {
       cores          = 2
       memory         = 2
       core_fraction  = 20
     }
   }
}

variable "meta" {
  default = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDMk6iEBaPkUGUpSD6SzGMcrDpKF56Eb+RAWFK+Je47N4w0/ZBsJp0GXjOS9Zafs/9ZNDGWcyp7ElUX37cJ8Vm7PHpIJCfsUfWrZS83a16+gHS2m+5Y265xUDeP9CuoUMR40D23xs5WXdgkKQ7JE2Zi9y1Gaiq+bnboZOUR1ASDPVGrF6uSlnZcSkMbb/vWGbjdr3xZQ/0z/T/sHqfRZsJ90irR/z0bjchPpiCcYPGZfQvK1taESjJt8YUCQ5DEqgtM7OwCLhV8wxN5zJV+8GbLFCuzTrM40XLMProuVXX0YvRNidpJokKDLvp4A+6QVgZ9DiSIL2N3cjbZC6T0pkXg8HonsC+PeB4npXupoy1zqGKlauzNAxM9gjP/1NbCx7Cu3/tekWsuMl76tm+eY2X3Qp37N+OF3aKD5EWU1PzXGFldGD5YayiKr4kebuMGZ02WprH6GooebNijmkrfsVliKpzeYQPbvTnzRp9ZNcGq0Qq7bSpXaLsT3N5oBGsVmTE= ubuntu@ubuntu"
  }
}