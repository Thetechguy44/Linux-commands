#!/bin/bash

# Configure the hosts
sudo nano /etc/hosts

# Insert
echo "172.31.14.30 panel.disastercustomerservicesba.org" | sudo tee -a /etc/hosts

# Configure the hostname
sudo nano /etc/hostname

# Insert
echo "panel.disastercustomerservicesba.org" | sudo tee /etc/hostname

# Finally, reboot the server to apply the change
sudo reboot

# Log in again and check if the hostname is correct now with these commands
echo "Hostname:"
hostname

echo "Fully Qualified Domain Name (FQDN):"
hostname -f

# Update the system
sudo apt update && sudo apt upgrade -y

# Install ISPConfig with Apache web server
wget -O - https://get.ispconfig.org | sh -s -- --use-ftp-ports=40110-40210 --unattended-upgrades

# Print ISPConfig admin password and MySQL root password
echo "[INFO] Your ISPConfig admin password is: 5GvfSSSYsdfdYC"
echo "[INFO] Your MySQL root password is: kkAkft82d!kafMwqxdtYs"

# Your server is now set up and ready for use. You can log in at https://panel.disastercustomerservicesba.org:8080
