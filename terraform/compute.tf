resource "oci_core_instance" "simple-vm" {
  availability_domain = local.availability_domain
  compartment_id      = var.compute_compartment_ocid
  display_name        = var.vm_display_name
  shape               = var.vm_compute_shape

  dynamic "shape_config" {
    for_each = local.is_flex_shape
      content {
        ocpus = shape_config.value
      }
  }


  create_vnic_details {
    subnet_id              = var.subnet_id
    display_name           = var.subnet_display_name
    assign_public_ip       = true
    hostname_label         = var.hostname_label
    skip_source_dest_check = false
  }

  source_details {
    source_type = "image"
    source_id   = var.custom_image_id
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data           = base64encode(file("./scripts/example.sh"))
  }

}
