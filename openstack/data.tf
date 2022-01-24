# all the data sources are from here
#

# get the info on project
#data "openstack_identity_project_v3" "project" { 
#  name = "${var.project}"
#}

data "openstack_networking_network_v2" "public" {
  name = "${var.project_external_network}"
}
