# variables will come here

variable "vsphere_server" {
  description = "vsphere server info"
  type = "string"
  default = "192.168.20.142"
}

variable "vsphere_user" {
  description = "administrative user"
  type = "string"
  default = "root"
}

variable "vsphere_password" {
  description = "administrative user password"
  type = "string"
  default = "YourPasswordH3r3"
}
