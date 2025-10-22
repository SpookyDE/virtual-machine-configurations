#!/usr/bin/env bash
set -eux

# clear port 53
sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved || true

echo -e "nameserver 1.1.1.1\nnameserver 8.8.8.8" | sudo tee /etc/resolv.conf

# directories for pihole
mkdir -p /opt/pihole/etc-pihole /opt/pihole/etc-dnsmasq.d
cd /opt/pihole

# copy docker compose with env
cp /vagrant/docker/docker-compose.yml /opt/pihole/
cp /vagrant/docker/.env /opt/pihole/

# start container
cd /opt/pihole
docker compose --env-file .env up -d
