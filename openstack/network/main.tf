# network related definition 
#
terraform {
  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}

resource "openstack_networking_network_v2" "project_internal_network" {
  name           = "${var.project_internal_network}"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "internal_network_block" {
  name       = "${var.project_internal_network}-subnetA"
  network_id = "${openstack_networking_network_v2.project_internal_network.id}"
  cidr       = "${var.internal_network_block}"
  ip_version = 4
  dns_nameservers = "${var.dnsnameservers}"
}

resource "openstack_networking_router_v2" "project_main_router" {
  name      = "${var.project_main_router}"
  admin_state_up      = true
  external_network_id = "${data.openstack_networking_network_v2.public.id}"
}

resource "openstack_networking_router_interface_v2" "router_interface_1" {
  router_id = "${openstack_networking_router_v2.project_main_router.id}"
  subnet_id = "${openstack_networking_subnet_v2.internal_network_block.id}"
}
