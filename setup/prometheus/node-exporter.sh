#!/bin/bash

cd /opt

wget https://github.com/prometheus/node_exporter/releases/download/v1.6.0/node_exporter-1.6.0.linux-amd64.tar.gz
sudo tar xvzf node_exporter-1.6.0.linux-amd64.tar.gz

sudo mv node_exporter-1.6.0.linux-amd64 node_exporter
# cd node_exporter
# sudo cp node_exporter /usr/local/bin



# cd /lib/systemd/system
cd /etc/systemd/system
# sudo nano node_exporter.service

sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/main/setup/prometheus/node_exporter.service

#promtool check config prometheus.yml

sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter
sudo systemctl status node_exporter

sudo systemctl restart prometheus
