resource "yandex_compute_disk" "disk" {

    count = 3

    name       = "disk-${count.index+1}"
    #type       = var.storages.disktype
    #zone      = "<зона_доступности>"
    #size       = 1
    #block_size= <размер_блока>
}

resource "yandex_compute_instance" "storage" {

  name        = var.storage.name
  platform_id = "standard-v1"

  resources {
    cores         = var.storage.resources.cpu
    memory        = var.storage.resources.ram
    core_fraction = var.storage.resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.storage.disktype
      size     = var.storage.disksize
    }
  }

  #  dynamic "secondary_disk" {
  #   for_each = "${yandex_compute_disk.disk.*.id}"
  #   content {
  #     disk_id  = secondary_disk.value.id
  #   }
  # }

  dynamic "secondary_disk" {
    for_each = { for s in yandex_compute_disk.disk[*]: s.name=> s }
    content {
        disk_id = secondary_disk.value.id
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

