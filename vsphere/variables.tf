# variables will come here

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

variable "vmname" {
  description = "Name of VM"
  default = "vmname"
}

variable "disk_size" {
  description = "disk size in GB"
  type = string
  default = 25
}

variable "instances_num" {
  description = "number of instances"
  type = string
  default = 1
}

variable "cpu_num" {
  description = "number of CPU"
  type = string
  default = 1
}

variable "ram_size" {
  description = "Amount of RAM in MB"
  type = string
  default = 1560
}

variable "ipv4mask" {
  description = "ipv4 Subnet mask"
  type = string
  default = 24
}

variable "ipaddress" {
   description = "VM IP address"
   type = list
   default = ["192.168.20.200"]
}

variable "dc" {
  description = "datacenter Name"
  type = string
  default = "HomeDataCenter"
}

variable "datastore" {
  description = "datastore Name"
  type = string
  default = "datastore1"
}

variable "vmgateway" {
  description = "VM gateway"
  type = string
  default = "192.168.20.2"
}

variable "dns" {
  type = list
  default = ["8.8.8.8","4.2.2.1"]
}
