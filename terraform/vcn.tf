resource "oci_core_vcn" "internal" {
  dns_label      = "internal"
  cidr_block     = "10.0.0.0/16"
  compartment_id = "" #obtain from interviewer
  display_name   = "Sample VCN"
}