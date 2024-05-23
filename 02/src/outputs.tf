output "info_vm1_vm2" {
  value = "info vm1 :\n name: ${yandex_compute_instance.platform.name} \n IP: ${yandex_compute_instance.platform.network_interface.0.nat_ip_address} \n fqdn: ${yandex_compute_instance.platform.fqdn} \n \n info vm2 : \n name: ${yandex_compute_instance.db.name} \n IP: ${yandex_compute_instance.db.network_interface.0.nat_ip_address} \n fqdn: ${yandex_compute_instance.db.fqdn}" 
}



# instance_name, external_ip, fqdn для каждой из ВМ в удобном лично для вас формате.
