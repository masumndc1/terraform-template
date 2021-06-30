# variables will come here

variable "datacenter" {
  description = "datacenter name"
  type = string
  default = "HomeDataCenter"
}

variable "datastore" {
  description = "datastore name"
  type = string
  default = "datastore1"
}

variable "pubnet" {
  description = "Public network"
  type = string
  default = "VMNetwork"
}

variable "internal" {
  description = "Internal network"
  type = string
  default = "InterNal1"
}

variable "pool" {
  description = "Resource pool"
  type = string
  default = "resourcePool1"
}

variable "centos7template" {
  description = "CentOS7 template" 
  default = "centos7template"
}

variable "vmname" {
  description = "Name of VM"
  default = "centos7"
}

variable "vnictype" {
  description = "Type of VNIX"
  default = "vmxnet3"
}

variable "disk_size" {
  description = "disk size in GB"
  type = string
  default = 30 
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

variable "domain" {
  description = "domain name" 
  type = string
  default = "masum.io"
}

variable "ipv4mask" {
  description = "ipv4 Subnet mask"
  type = string
  default = 24
}

variable "vmgateway" {
  description = "VM gateway"
  type = string
  default = "192.168.2.1"
}

variable "dns" {
  type = list
  default = ["8.8.8.8","4.2.2.1"]
}
