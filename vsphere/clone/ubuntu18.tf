provider "vsphere" {
  user = var.vsphere_user
  password = var.vsphere_password
  vsphere_server = var.vsphere_server
  allow_unverified_ssl = true
}

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

data "vsphere_virtual_machine" "ubuntu18template" {
  name = var.ubuntu18template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

#data "vsphere_virtual_machine" "template" {
#  name = var.vsphere_virtual_machine_template
#  datacenter_id = data.vsphere_datacenter.dc.id
#}

resource "vsphere_virtual_machine" "cloned_virtual_machine" {
  name = var.vmname
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id = data.vsphere_datastore.datastore.id

#  num_cpus = "${data.vsphere_virtual_machine.template.num_cpus}"
#  memory   = "${data.vsphere_virtual_machine.template.memory}"
  guest_id = data.vsphere_virtual_machine.template.guest_id

  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id = data.vsphere_network.pubnet.id
    #adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  network_interface {
    network_id = data.vsphere_network.internal.id
    #adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label = "disk0"
    size = var.disk_size
    thin_provisioned = true
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.ubuntu18template.id

    customize {
      linux_options {
        host_name = var.vmname
        domain = var.domain

        network_interface {
          #ipv4_address = "10.0.0.10"
          ipv4_netmask = var.ipv4mask
        }

        ipv4_gateway = var.vmgateway
     }
  }
}