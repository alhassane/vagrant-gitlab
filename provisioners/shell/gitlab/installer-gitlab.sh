#!/bin/bash

DISTRIB=$1

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