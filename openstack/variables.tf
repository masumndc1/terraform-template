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
