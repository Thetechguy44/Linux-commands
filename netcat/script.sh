#!/bin/bash

cd /var

sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/raw/main/netcat/systemd.sh
sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/raw/main/netcat/auto-run.sh


sudo systemctl enable restart_listener.service
sudo systemctl start restart_listener.service

# sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/raw/main/netcat/script.sh
