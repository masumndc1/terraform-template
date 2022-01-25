# more on openstack terraform template
# https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs
#
# this is the main.tf file

# Define required providers
terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}

provider "openstack" {
  # user_name   = "admin"
  # tenant_name = "admin"
  # password    = "pwd"
  # auth_url    = "http://myauthurl:5000/v2.0"
  # region      = "RegionOne"
  #
  # this empty openstack definition means terraform
  # will load username, tenant_name, password, auth_url
  # and region from auth_source file downloaded from 
  # openstack dash board. for example, openstack RC File V3 
  # source file.
  # you need to load the source file. 
  # like, source source.sh
}

# module network
module "network" {
  source = "./network"
}

# module Security 
module "security" {
  source = "./secgroup"
}

module "Centos7" {
  source     = "./vms/Centos7"
  name       = "${var.centos7}"
  image_id   = "${data.openstack_images_image_v2.centos7.id}"
  flavor_id  = "${data.openstack_compute_flavor_v2.small.id}"
  security_groups = "${var.securitygroup}"
  key_pair   = "${var.vm_keypair}"
  network    = "${var.project_internal_network}"
  user_data_file = "${var.user_data_file}"
}
