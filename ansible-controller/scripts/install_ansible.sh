#!/usr/bin/env bash
set -e

# Update & Grundtools
sudo apt-get update -y
sudo apt-get install -y software-properties-common curl git

# Ansible installieren (über offizielle PPA)
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get install -y ansible

# SSH-Schlüssel vorbereiten (optional, falls du Hosts per Key ansteuern willst)
if [ ! -f /home/vagrant/.ssh/id_rsa ]; then
  sudo -u vagrant ssh-keygen -t rsa -b 4096 -N "" -f /home/vagrant/.ssh/id_rsa
fi

# Ownership sicherstellen
sudo chown -R vagrant:vagrant /home/vagrant/ansible

