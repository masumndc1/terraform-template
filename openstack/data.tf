# all the data sources are from here
#

# get the info on project
#data "openstack_identity_project_v3" "project" { 
#  name = "${var.project}"
#}

data "openstack_networking_network_v2" "public" {
  name = "${var.project_external_network}"
}

data "openstack_images_image_v2" "ubuntu20" {
  name        = "${var.ubuntu20}"
  most_recent = true
}

data "openstack_images_image_v2" "ubuntu18" {
  name        = "${var.ubuntu18}"
  most_recent = true
}

data "openstack_images_image_v2" "centos7" {
  name        = "${var.centos7}"
  most_recent = true
}

data "openstack_images_image_v2" "centos8" {
  name        = "${var.centos8}"
  most_recent = true
}

data "openstack_compute_flavor_v2" "small" {
  name        = "${var.vm_flavor}"
}
