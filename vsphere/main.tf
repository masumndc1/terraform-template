# Create on Ubuntu18 VM in vCenter/ESXi. More from
# https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs

provider "vsphere" {
  vsphere_server = var.vsphere_server
  user = var.vsphere_user
  password = var.vsphere_password
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = "HomeDataCenter"
}

data "vsphere_datastore" "datastore" {
  name = "datastore1" 
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name = "interNal1"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "pool" {
  name = "resourcePool1"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {
  name = var.vmname
  datastore_id = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id

  num_cpus = var.cpu_num
  memory   = var.ram_size
  guest_id = "other3xLinux64Guest"

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "test.vmdk"
    size = var.disk_size 
    thin_provisioned = true
  }
}

output "testing" {
  value = data.vsphere_datastore.datastore.id
}
