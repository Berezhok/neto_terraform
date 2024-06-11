resource "local_file" "hosts_templatefile" {
  content = templatefile("${path.module}/hosts.tftpl",
  { count = yandex_compute_instance.count
    foreach = yandex_compute_instance.foreach
    storage = [ yandex_compute_instance.storage ]
   })

  filename = "${abspath(path.module)}/hosts.cfg"
}