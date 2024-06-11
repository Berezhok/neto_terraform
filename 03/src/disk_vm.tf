resource "yandex_compute_disk" "disk" {

    count = 3

    name       = "disk-${count.index+1}"
    type       = "network-hdd"
    #zone      = "<зона_доступности>"
    size       = 1
    #block_size= <размер_блока>
}

resource "yandex_compute_instance" "storage" {

  name        = "storage"
  platform_id = "standard-v1"

  resources {
    cores         = 2
    memory        = 1
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = "network-hdd"
      size     = 5
    }
  }

   dynamic "secondary_disk" {
    for_each = "${yandex_compute_disk.disk.*.id}"
    content {
      disk_id     = yandex_compute_disk.disk["${secondary_disk.key}"].id
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

