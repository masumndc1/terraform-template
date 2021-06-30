# Create on Ubuntu18 VM in vCenter/ESXi. More from
# https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs

provider "vsphere" {
  vsphere_server       = var.vsphere_server
  user                 = var.vsphere_user
  password             = var.vsphere_password
  allow_unverified_ssl = true
}

module "ubuntu16" {
  source = "./clone/ubuntu16"
}
