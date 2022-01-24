#!/bin/bash

# exit with error status code if user is not root
if [[ $EUID -ne 0 ]]; then
  echo "* This script must be executed with root privileges (sudo)." 1>&2
  exit 1
fi

# check for curl
if ! [ -x "$(command -v curl)" ]; then
  echo "* curl is required in order for this script to work."
  echo "* install using apt (Debian and derivatives) or yum/dnf (CentOS)"
  exit 1
fi

apt upgrade && apt update && apt install firewalld && apt remove ufw && firewall-cmd --permanent --zone=public --add-port=80/tcp && firewall-cmd --permanent --zone=public --add-port=80/udp && firewall-cmd --permanent --zone=public --add-port=443/tcp && firewall-cmd --permanent --zone=public --add-port=443/udp && firewall-cmd --permanent --zone=public --add-port=2022/tcp && firewall-cmd --permanent --zone=public --add-port=2022/udp && firewall-cmd --permanent --zone=public --add-port=22/tcp && firewall-cmd --permanent --zone=public --add-port=22/udp && firewall-cmd --permanent --zone=public --add-port=5657/tcp && firewall-cmd --permanent --zone=public --add-port=5657/udp && firewall-cmd --permanent --zone=public --add-port=56423/tcp && firewall-cmd --permanent --zone=public --add-port=56423/udp && firewall-cmd --permanent --zone=public --add-port=8080/tcp && firewall-cmd --permanent --zone=public --add-port=8080/udp && firewall-cmd --permanent --zone=public --add-port=25565/tcp && firewall-cmd --permanent --zone=public --add-port=25565/udp && firewall-cmd --reload && curl -sL https://deb.nodesource.com/setup_14.x | sudo bash - && deb https://deb.nodesource.com/node_14.x focal main && deb-src https://deb.nodesource.com/node_14.x focal main && sudo apt -y install nodejs && node -v && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && sudo apt-get update && sudo apt-get install yarn && yarn ––version

bash <(curl -s https://pterodactyl-installer.se)
