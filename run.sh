#!/bin/bash

set -o verbose
sudo apt-get update
sudo apt-get -y install git salt-minion

echo 'master: localhost'|sudo tee /etc/salt/minion
git clone https://github.com/haapjuu/qwerty
sudo salt '*' state.apply mumble
setxkbmap fi
sudo timedatectl set-timezone Europe/Helsinki
git config --global credential.helper "cache --timeout=3600"
git config --global push.default simple
# git config --global user.email "juuso.haapaniemi@myy.haaga-helia.fi"
# git config --global user.name "juuso haapaniemi"
echo "OK!"
