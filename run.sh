#!/bin/bash

echo "1"
set -o verbose

echo "2"
sudo apt-get update
sudo apt-get -y install git salt-minion

echo "3"
echo 'master: localhost'|sudo tee /etc/salt/minion
git clone https://github.com/haapjuu/qwerty
cd qwerty/
./highstate.sh

echo "4"
setxkbmap fi
sudo timedatectl set-timezone Europe/Helsinki
git config --global credential.helper "cache --timeout=3600"
git config --global push.default simple
# git config --global user.email "juuso.haapaniemi@myy.haaga-helia.fi"
# git config --global user.name "juuso haapaniemi"

echo "5"
echo "Done."
