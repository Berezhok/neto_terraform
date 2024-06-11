#создаем 2 разые ВМ
resource "yandex_compute_instance" "foreach" {
  for_each   = {
    for index, vm in var.foreach:
    vm.vm_name => vm # не очень понял эту строку, для чего она?
    #vm.vm_name => vm # Perfect, since VM names also need to be unique
    # OR: index => vm (unique but not perfect, since index will change frequently)
    # OR: uuid() => vm (do NOT do this! gets recreated everytime)
  }
  name = each.value.vm_name
   # ip_address = each.value.ip_address
  platform_id = "standard-v1"

  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = "network-hdd"
      size     = each.value.disk_volume
    }
  }

  metadata = local.metadata


   network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = toset([yandex_vpc_security_group.example.id])
  }
  allow_stopping_for_update = true
}