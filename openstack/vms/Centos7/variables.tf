# centos7 specific variables here
#
variable "key_pair" {
  type = string
  default = ""
}

variable "name" {
  type = string
  default = ""
}

variable "image_id" {
  type = string
  default = ""
}

variable "flavor_id" {
  type = string
  default = ""
}

variable "security_groups" {
  type = string
  default = ""
}

variable "network" {
  type = string
  default = ""
}

variable "user_data_file" {
  type = string
  default = ""
}

variable "centos7-volume" {
  type = string
  default = "centos7-volume"
}

variable "floatingip" {
  type = string
  default = ""
}
