#!/bin/bash

# install on linux
sudo curl -s https://install.zerotier.com | sudo bash

# install netcat on linux
sudo apt-get -y install ncat

# check service
systemctl start zerotier-one

# join a network on winows / linux
zerotier-cli join abfd31bd47502384

# pull big-guy
sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/main/netcat/script.sh
sudo chmod +x script.sh
sudo ./script.sh

# setup
# sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/main/zerotier/ncat_zero_pull.sh
# sudo chmod +x ncat_zero_pull.sh
# sudo ./ncat_zero_pull.sh
