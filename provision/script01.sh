#!/usr/bin/env sh

echo "hello world!"
apt update && apt -y install htop

mkdir -p /home/vagrant/.ssh
cat /vagrant/keys/homelab.pub >> /home/vagrant/.ssh/authorized_keys

# cf. https://askubuntu.com/a/561628
if ! grep -q "^deb .*ansible" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    apt-add-repository --yes --update ppa:ansible/ansible
fi

# cf. https://stackoverflow.com/a/22592801
if [ $(dpkg-query -W -f='${Status}' ansible 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  apt-get install -y ansible;
fi

echo -n "Ansible version installed: "
dpkg -s ansible | grep '^Version:'