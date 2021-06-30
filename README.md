# terraform-template

## Install hashicorp vault to secretly store your password and key.
## You can download package from https://www.vaultproject.io/downloads
## or you can run following playbook to install vault in debian/ubuntu.
1. Run "ansible-playbook -i inventory/hosts vault_install.yml"

## for mac: download vault.zip or install it by brew.
## unzip it and place it to as /usr/local/bin/vault.

## These .tf are tested on v0.14.9. Therefore we needed to use following syntax
type = "string"               will be     type = string
user = "${var.vsphere_user}"  will be     user = var.vsphere_user


...Customization of the guest operating system 'centos7_64Guest' is not
supported in this configuration. Microsoft Vista (TM) and Linux guest with
Logical Volume Manager are supported only for recent ESX host and VMware Tools
versions. Refer to vCenter documentation for supported configurations
