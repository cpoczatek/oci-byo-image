#Variables declared in this file must be declared in the marketplace.yaml
#Provide a description to your variables.

############################
#  Hidden Variable Group   #
############################
variable "tenancy_ocid" {
}

variable "region" {
}

variable "compartment_ocid" {
}

############################
#  Compute Configuration   #
############################

variable "custom_image_id" {
}

variable "password" {
}

# only used for E3 Flex shape
variable "vm_flex_shape_ocpus" {
  description = "Flex Shape OCPUs"
  default     = 1
}

variable "availability_domain_name" {
  default     = ""
  description = "Availability Domain name, if non-empty takes precedence over availability_domain_number"
}

variable "availability_domain_number" {
  default     = 1
  description = "OCI Availability Domains: 1,2,3  (subject to region availability)"
}

variable "ssh_public_key" {
  description = "SSH Public Key"
}

variable "hostname_label" {
  default     = "simple"
  description = "DNS Hostname Label. Must be unique across all VNICs in the subnet and comply with RFC 952 and RFC 1123."
}

variable "shapes" {

    default = [
      "VM.Standard2.2",
      "VM.Standard.E2.2",
      "VM.Standard.E3.Flex",
      "VM.Standard.E4.Flex"
    ]

  # ["BM.Standard.E2.64", "BM.Standard.E3.128", "BM.Standard.E4.128"]

}

############################
#  Network Configuration   #
############################

variable "subnet_id" {
}
