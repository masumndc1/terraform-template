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

# Internal network
resource "openstack_networking_network_v2" "project_internal_network" {
  name           = "${var.project_internal_network}"
  admin_state_up = "true"
}

# Internal network subnet 1
resource "openstack_networking_subnet_v2" "subnet_1" {
  network_id = "${openstack_networking_network_v2.var.project_internal_network.id}"
  cidr       = "${var.internal_network_block}"
  ip_version = 4
}

# router of the project
resource "openstack_networking_router_v2" "primary-router" {
  name                = "${var.project_main_router}"
  admin_state_up      = true
  external_network_id = "${data.openstack_networking_network_v2.public.id}"
}

resource "openstack_networking_router_interface_v2" "router_internal_interface_1" {
  router_id = "${openstack_networking_router_v2.primary-router.id}"
  subnet_id = "${openstack_networking_subnet_v2.subnet_1.id}"
}

#module "centos" {
#  source = "./vms/centos.tf"
#}

