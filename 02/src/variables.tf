###cloud vars
variable "token" {
  type        = string
  default = "y0_AgAAAAANQkQyAATuwQAAAADurlqQk3eRkWBmT4aFOf91I3WOHhYGyDs"
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
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDMk6iEBaPkUGUpSD6SzGMcrDpKF56Eb+RAWFK+Je47N4w0/ZBsJp0GXjOS9Zafs/9ZNDGWcyp7ElUX37cJ8Vm7PHpIJCfsUfWrZS83a16+gHS2m+5Y265xUDeP9CuoUMR40D23xs5WXdgkKQ7JE2Zi9y1Gaiq+bnboZOUR1ASDPVGrF6uSlnZcSkMbb/vWGbjdr3xZQ/0z/T/sHqfRZsJ90irR/z0bjchPpiCcYPGZfQvK1taESjJt8YUCQ5DEqgtM7OwCLhV8wxN5zJV+8GbLFCuzTrM40XLMProuVXX0YvRNidpJokKDLvp4A+6QVgZ9DiSIL2N3cjbZC6T0pkXg8HonsC+PeB4npXupoy1zqGKlauzNAxM9gjP/1NbCx7Cu3/tekWsuMl76tm+eY2X3Qp37N+OF3aKD5EWU1PzXGFldGD5YayiKr4kebuMGZ02WprH6GooebNijmkrfsVliKpzeYQPbvTnzRp9ZNcGq0Qq7bSpXaLsT3N5oBGsVmTE= ubuntu@ubuntu"
  description = "ssh-keygen -t ed25519"
}

variable "vm_web_yandex_compute_image" {
  type = string
  default = "ubuntu-2004-lts"
}

variable "vm_web_yandex_compute_instance_name" {
  type = string
  default = "netology-develop-platform-web"
}

variable "vm_web_yandex_compute_instance_platform" {
  type = string
  default = "standard-v1"
}

