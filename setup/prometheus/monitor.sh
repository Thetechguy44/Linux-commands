#!/bin/bash


# prometheus file
sudo wget https://raw.githubusercontent.com/thetechguy44/Linux-commands/main/setup/prometheus/prometheus.sh
sudo chmod +x prometheus.sh
sudo ./prometheus.sh

# grafana 
sudo wget https://raw.githubusercontent.com/thetechguy44/Linux-commands/main/setup/prometheus/grafana.sh
sudo chmod +x grafana.sh
sudo ./grafana.sh

# node_exporter
sudo wget https://raw.githubusercontent.com/thetechguy44/Linux-commands/main/setup/prometheus/node-exporter.sh
sudo chmod +x node-exporter.sh 
sudo ./node-exporter.sh 



#!/bin/bash

# sudo wget https://raw.githubusercontent.com/thetechguy44/Linux-commands/main/setup/prometheus/monitor.sh
# sudo chmod +x monitor.sh
# sudo ./monitor.sh