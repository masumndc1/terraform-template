# more on openstack terraform template
# https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs

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

resource "openstack_compute_instance_v2" "basic" {
  name            = "basic"
  image_id        = "8eba1ccc-bbeb-4769-b0a3-1f2b3b523b75"
  flavor_id       = "0143b0d1-4788-4d1f-aa04-4473e4a7c2a6"
  key_pair        = "khabirtest"
  security_groups = ["default"]

  metadata = {
    #    this = "that"
  }

  network {
      name = "test-network"
  }

}
