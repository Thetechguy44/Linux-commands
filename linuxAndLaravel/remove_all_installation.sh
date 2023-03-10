#!/bin/bash

# Stop Apache service
sudo systemctl stop apache2

# Remove Apache
sudo apt purge apache2 -y
sudo apt autoremove -y

# Remove PHP and related packages
sudo apt purge php* -y
sudo apt autoremove -y

# Remove Composer
sudo rm -rf /usr/local/bin/composer

# Remove Laravel project
sudo rm -rf /var/www/easelow
sudo rm -rf /etc/apache2/sites-available/easelow.conf

# Remove ondrej/php repository
sudo add-apt-repository --remove ppa:ondrej/php -y
sudo apt update

# Reset server
sudo apt-get install debconf-utils -y
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
sudo apt-get purge mysql-server -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y
sudo apt-get update -y

echo "All installations and projects have been removed."
