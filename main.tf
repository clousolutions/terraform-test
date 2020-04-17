provider oci {
  tenancy_ocid     = var.tenancy_id
  user_ocid        = var.user_id
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

data oci_identity_availability_domains this {
  compartment_id = var.compartment_ocid
}

terraform {
  backend etcdv3 {
    endpoints   = ["https://terraform-etcd.tprivatesubnet.terraform.oraclevcn.com:2379"]
    lock        = true
    prefix      = "terraform-state-new/"
    cacert_path = "/home/ubuntu/certs/ca.pem"
    cert_path   = "/home/ubuntu/certs/terraform.pem"
    key_path    = "/home/ubuntu/certs/terraform-key.pem"
  }
}


variable "tenancy_id" {}
variable "user_id" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_id" {}
variable "public_key" {}
variable "private_key" {}
