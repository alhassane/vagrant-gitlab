# -*- mode: ruby -*-
# vi: set ft=ruby :
 
# Requierements
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.box_url = 'https://vagrantcloud.com/ubuntu/boxes/trusty64/versions/14.04/providers/virtualbox.box'
  config.vm.hostname = "gitlab.local"

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 22, host: 8022

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    #vb.gui = true
  
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y openssh-server
    debconf-set-selections <<< "postfix postfix/mailname string $HOSTNAME"
    debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
    DEBIAN_FRONTEND=noninteractive sudo apt-get install -y postfix

    if [ ! -e /vagrant/gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb ]; then
        wget -O /vagrant/gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb
    fi

    sudo dpkg -i /vagrant/gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb
    sudo gitlab-ctl reconfigure
  SHELL
end
