# all the data sources are from here
#

data "openstack_networking_network_v2" "public" {
  name = "${var.project_external_network}"
}
