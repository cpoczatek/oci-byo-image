###
# compute.tf outputs
###

output "instance_public_ips" {
  value = {
    for instance in oci_core_instance.simple-vm:
      "${instance.id} - ${instance.shape}" => instance.public_ip
  }
}
