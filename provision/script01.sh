#!/usr/bin/env sh

echo "hello world!"
apt update && apt -y install htop

mkdir -p /home/vagrant/.ssh
cat /vagrant/keys/homelab.pub >> /home/vagrant/.ssh/authorized_keys