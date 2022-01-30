# more on openstack terraform template

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

# Security group
resource "openstack_compute_secgroup_v2" "securitygroup" {
  name        = "${var.securitygroup}"
  description = "A modified security group"

  rule {
      from_port   = 22
      to_port     = 22
      ip_protocol = "tcp"
      cidr        = "0.0.0.0/0"
  }

  rule {
      from_port   = 80 
      to_port     = 80 
      ip_protocol = "tcp"
      cidr        = "0.0.0.0/0"
  }

  rule {
      from_port   = 443
      to_port     = 443 
      ip_protocol = "tcp"
      cidr        = "0.0.0.0/0"
  }

  rule {
      from_port   = 8080
      to_port     = 8080
      ip_protocol = "tcp"
      cidr        = "0.0.0.0/0"
  }

  rule {
      from_port   = -1
      to_port     = -1
      ip_protocol = "icmp"
      cidr        = "0.0.0.0/0"
  }
}
