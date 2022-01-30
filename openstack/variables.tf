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

variable "securitygroup" {
  description = "a security group"
  type = string
  default = "ssh-https-ping"
}

variable "centos7" {
  description = "centos 7 info"
  type = string
  default = "CentOS-7"
}

variable "centos8" {
  description = "centos 8 info"
  type = string
  default = "CentOS-8"
}

variable "ubuntu18" {
  description = "ubuntu 18.04 info"
  type = string
  default = "Ubuntu-18.04"
}

variable "ubuntu20" {
  description = "ubuntu 20.04 info"
  type = string
  default = "Ubuntu-20.04"
}

variable "vm_flavor" {
  description = "instance flavor"
  type = string
  default = "standard.tiny"
}

variable "vm_keypair" {
  description = "keypair to be used"
  type = string
  default = "khabirtest"
}

variable "user_data_file" {
  description = "commands to be used from this file"
  type = string
  default = "bootstrap.sh"
}

variable "centos7-ip" {
  description = "floating ip for centos7"
  type = string
  default = "86.50.168.33"
}
