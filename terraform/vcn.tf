resource "oci_core_vcn" "internal" {
  dns_label      = "internal"
  cidr_block     = "10.23.0.0/20"
  compartment_id = local.lab_user_cmp
  display_name   = "IC_VCN"
}
