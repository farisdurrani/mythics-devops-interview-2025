# Steps to Access Guest OCI Account on mythicsdemo2 tenancy

_These credentials may be out-of-date, please confirm with the interviewer_

You will not be given console UI access to Oracle Cloud. Instead, you will be given API access to the Oracle Cloud Infrastructure (OCI) tenancy.

You may ask the interviewer to screenshare of the current state of the resources on the console anytime.

## Set up OCI access

Create, or append, the file `~/.oci/config` with the following content

```
[DEFAULT]
user=ocid1.user.oc1..aaaaaaaan5jt7wdaejjmlfoi7o63czcnzexzuesofrxayzruvgejltcflfta
fingerprint=39:b0:fa:35:bb:d1:bb:12:24:b7:a7:3c:e4:a0:1a:da
tenancy=ocid1.tenancy.oc1..aaaaaaaan4to7ikejs4l65qpxmh3hzdhl4zq5i3cxpawtkgbvvj5f52x5lea
region=us-ashburn-1
key_file=<path to your private keyfile> # TODO
```

The private key file will be sent to you.

## Run the following sample Terraform script

This script creates a new Virtual Private Cloud Network.

> [!NOTE]
> If you do not have Terraform installed, install it from [here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

```tf
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
    config_file_profile = "DEMO2"
}

resource "oci_core_vcn" "internal" {
  dns_label      = "internal"
  cidr_block     = "10.0.0.0/16"
  compartment_id = "compartment_id" #obtain from interviewer
  display_name   = "Sample VCN"
}
```

Destroy the resources after you are done testing Terraform.
