terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
      version = ">= 6.0.0"
    }
  }
}

provider "oci" {
    region = "us-ashburn-1"
    config_file_profile = "DEFAULT"
}