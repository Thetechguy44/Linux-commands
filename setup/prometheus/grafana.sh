#!/bin/bash

sudo su -
# Add the Grafana GPG key in Ubuntu using wget
curl https://packages.grafana.com/gpg.key | sudo gpg --dearmor > /usr/share/keyrings/grafana-archive-keyring.gpg

# Now add the Grafana repository in Ubuntu using APT
echo "deb [signed-by=/usr/share/keyrings/grafana-archive-keyring.gpg] https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list


sudo apt-get update
sudo apt-get install grafana
sudo systemctl start grafana-server
sudo systemctl status grafana-server
sudo systemctl enable grafana-server.service


# http://your_ip:3000
# Username – admin
# Password – admin