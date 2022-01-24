# variables will come here

variable "project" {
  description = "openstack project info"
  type = string
  default = ""
}

variable "project_main_router" {
  description = "project primary router"
  type = string
  default = "primary-router"
}

variable "project_external_network" {
  description = "project public network info"
  type = string
  default = "public"
}

variable "project_internal_network" {
  description = "project internal network info"
  type = string
  default = "internal"
}

variable "internal_network_block" {
  description = "project internal network block"
  type = string
  default = "192.168.50.0/24"
}

variable "image_centos7" {
  description = "centos 7 image"
  type = string
  default = "CentOS-7"
}

variable "image_centos8" {
  description = "centos 8 image"
  type = string
  default = "CentOS-8"
}

variable "image_ubuntu18" {
  description = "ubuntu 18.04 image"
  type = string
  default = "Ubuntu-18.04"
}

variable "image_ubuntu20" {
  description = "ubuntu 20.04 image"
  type = string
  default = "Ubuntu-20.04"
}
