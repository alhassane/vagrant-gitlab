#!/bin/bash

DISTRIB=$1

if [ ! -e /vagrant/gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb ]; then
    wget -O /vagrant/gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb
fi

sudo dpkg -i /vagrant/gitlab_7.7.2-omnibus.5.4.2.ci-1_amd64.deb
sudo gitlab-ctl reconfigure