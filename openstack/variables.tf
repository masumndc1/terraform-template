# variables will come here

variable "project" {
  description = "openstack project info"
  type = string
  default = ""
}

variable "project_external_network" {
  description = "project public network info"
  type = string
  default = "public"
}

variable "project_main_router" {
  description = "project public network info"
  type = string
  default = "primary-router"
}

