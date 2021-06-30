# variables

variable "vsphere_server" {
  description = "vsphere server info"
  type = string
  default = "192.168.2.70"
}

variable "vsphere_user" {
  description = "administrative user"
  type = string
  default = "administrator@vspere.local"
}

variable "vsphere_password" {
  description = "administrative user password"
  type = string
  default = "YourPasswordH3r3"
}
