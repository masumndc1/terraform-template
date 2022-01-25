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

resource "openstack_compute_instance_v2" "Centos7" {
  name          = "${var.name}"
  image_id      = "${var.image_id}"
  flavor_id     = "${var.flavor_id}"
  key_pair      = "${var.key_pair}"
  security_groups  = ["${var.security_groups}"]

  metadata = {
    #    this = "that"
  }

  network {
    name = "${var.network}"
  }

  user_data = "${file("file/${var.user_data_file}")}"

}
