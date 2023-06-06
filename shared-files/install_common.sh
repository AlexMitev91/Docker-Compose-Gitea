#!/bin/bash

echo "192.168.111.202 gitea.lab gitea" >> /etc/hosts


echo "* Update repositories and install common packages"

#echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" | sudo tee /etc/resolv.conf >/dev/null
apt-get upgrade
apt-get update
apt-get install -y ca-certificates curl gnupg lsb-release fontconfig openjdk-11-jre git nano