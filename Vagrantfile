# -*- mode: ruby -*-
# vi: set ft=ruby :
 
# Requierements
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(2) do |config|
    config.vm.box = 'ubuntu/trusty64'
    config.vm.box_url = 'https://vagrantcloud.com/ubuntu/boxes/trusty64/versions/14.04/providers/virtualbox.box'
    config.vm.hostname = "gitlab.local"

    # Create a private network, which allows host-only access to the machine using a specific IP.
    config.vm.network :private_network, ip: "192.168.33.20"
    #config.vm.network "forwarded_port", guest: 22, host: 8022

    config.vm.synced_folder ".", "/vagrant", :mount_options => ["uid=5678,gid=65534"]

    config.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      #vb.gui = true

      # Customize the amount of memory on the VM:
      vb.memory = "2048"
    end

    # Shell provisioning
    config.vm.provision "shell" do |s|
        s.path = "provisioners/shell/bootstrap.sh"
        s.args = ["ubuntu"]
        s.privileged = true
    end
end
