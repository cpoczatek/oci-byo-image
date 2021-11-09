resource "null_resource" "compute-script" {
  for_each = oci_core_instance.simple-vm

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "opc"
      password = var.password
      host     = oci_core_instance.simple-vm[each.key].public_ip
      agent    = false
      timeout  = "20m"
    }
    inline = [
      "echo 'remote-exec called'",
      "touch ~opc/touchafile"
    ]
  }
}
