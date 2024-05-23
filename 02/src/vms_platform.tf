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

