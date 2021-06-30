data "vsphere_datacenter" "datacenter" {
  name = var.datacenter
}

data "vsphere_datastore" "datastore" {
  name = var.datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "pool" {
  name = var.pool
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "pubnet" {
  name = var.pubnet
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "internal" {
  name = var.internal
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "centos7template" {
  name = var.centos7template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "cloned_virtual_machine" {
  name = var.vmname
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id = data.vsphere_datastore.datastore.id
  guest_id = data.vsphere_virtual_machine.centos7template.guest_id

  #scsi_type = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id = data.vsphere_network.pubnet.id
    adapter_type = var.vnictype
  }

  disk {
    label = "disk0"
    size = var.disk_size
    #size = "100"
    thin_provisioned = true
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.centos7template.id
  

    customize {
      linux_options {
        host_name = var.vmname
        domain = var.domain
      }

      network_interface {
        ipv4_address = "192.168.2.230"
        ipv4_netmask = var.ipv4mask
      }
      ipv4_gateway = var.vmgateway
      #dns_server_list = var.dns
      dns_server_list = ["8.8.8.8","4.2.2.1"]
    }
  }  
}
