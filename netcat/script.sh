#!/bin/bash

cd /var

# sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/main/netcat/systemd.service
# sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/main/netcat/auto-run.sh

sudo chmod +x auto-run.sh
# sudo chmod +x systemd.service

# this will start our file both on reboot and start-up

# Create a systemd service unit:

# Create a file, for example, /etc/systemd/system/restart_listener.service, and add the following content:
sudo mv restart_listener.service /etc/systemd/system/restart_listener.service


sudo nohup ./auto-run.sh > /dev/null 2>&1 &

# Replace /home/ubuntu/script.sh with the actual path to your script.

# Enable and start the service:
sudo systemctl enable restart_listener.service
sudo systemctl start restart_listener.service

# sudo wget https://raw.githubusercontent.com/Incrisz/Linux-commands/main/netcat/script.sh
