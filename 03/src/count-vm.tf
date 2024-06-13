

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_yandex_compute_image
}


resource "yandex_compute_instance" "count" {
  depends_on = [yandex_compute_instance.foreach]
  count = 2

  name        = "netology-develop-platform-web-${count.index+1}"
  platform_id = "standard-v1"

  resources {
    cores         = var.default_vm.resources.cpu
    memory        = var.default_vm.resources.ram
    core_fraction = var.default_vm.resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.default_vm.disktype
      size     = var.default_vm.disksize
    }
  }

  metadata = local.metadata

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  allow_stopping_for_update = true
}

resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}