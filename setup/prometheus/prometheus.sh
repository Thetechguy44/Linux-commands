#!/bin/bash


# setup website
# https://www.fosstechnix.com/install-prometheus-and-grafana-on-ubuntu/
#install prometheus
sudo apt update -y

# switch to root user
# sudo su -

# Export the release of Prometheus
export RELEASE="2.2.1"

# Using below commands we can create a user and directory.
sudo useradd --no-create-home --shell /bin/false prometheus  
sudo useradd --no-create-home --shell /bin/false node_exporter
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

#2. Update Prometheus user
sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /var/lib/prometheus

#3. Download Prometheus Binary File
 cd /opt/
# Download the Prometheus setup using wget
wget https://github.com/prometheus/prometheus/releases/download/v2.26.0/prometheus-2.26.0.linux-amd64.tar.gz

sha256sum prometheus-2.26.0.linux-amd64.tar.gz
tar -xvf prometheus-2.26.0.linux-amd64.tar.gz
cd prometheus-2.26.0.linux-amd64


sudo cp /opt/prometheus-2.26.0.linux-amd64/prometheus /usr/local/bin/
sudo cp /opt/prometheus-2.26.0.linux-amd64/promtool /usr/local/bin/

sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool

sudo cp -r /opt/prometheus-2.26.0.linux-amd64/consoles /etc/prometheus
sudo cp -r /opt/prometheus-2.26.0.linux-amd64/console_libraries /etc/prometheus
sudo cp -r /opt/prometheus-2.26.0.linux-amd64/prometheus.yml /etc/prometheus

sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
sudo chown -R prometheus:prometheus /etc/prometheus/prometheus.yml



cd /etc/prometheus/
sudo mv prometheus.yml prometheus_backup.yml
sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/main/setup/prometheus/prometheus.yml



sudo -u prometheus /usr/local/bin/prometheus \
        --config.file /etc/prometheus/prometheus.yml \
        --storage.tsdb.path /var/lib/prometheus/ \
        --web.console.templates=/etc/prometheus/consoles \
        --web.console.libraries=/etc/prometheus/console_libraries

sudo cd /etc/systemd/system/
sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/main/setup/prometheus/prometheus.service

sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus
sudo systemctl status prometheus

sudo ufw allow 9090/tcp

# http://server-IP-or-Hostname:9090.


