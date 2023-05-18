#!/bin/bash


# Update packages and install necessary packages
sudo apt update
sudo apt install apache2 -y


# Add the ondrej/php repository and install PHP 8.0
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt install php8.0 -y

# to check packages installed
sudo php -m



# Update packages and install necessary packages
sudo apt install php8.0-dom
sudo apt install php8.0-gd -y
sudo apt install php8.0-intl  
sudo apt install php8.0-mbstring -y
sudo apt install php8.0-simplexml
sudo apt install php8.0-xml 
sudo apt install php8.0-xsl 
sudo apt install php8.0-zip -y
sudo apt-get install php8.0-curl



# Install Composer
curl -sS https://getcomposer.org/installer | sudo php8.0 -- --install-dir=/usr/local/bin --filename=composer



# Folder for git work
sudo git clone https://github.com/Incrisz/exceptions.git
sudo cd app/
sudo mv exceptions/Exceptions /var/www/html/afriada/app/
  
sudo rm -r exceptions
sudo mkdir storage/framework/cache/data

find . -type f -exec chmod 644 {} \;
find . -type d -exec chmod 755 {} \;

sudo chown -R www-data:www-data .
sudo chmod -R 755 .
sudo chmod -R 755 storage
sudo chmod -R 755 bootstrap/cache

# To test the whole setup
php artisan cache:clear
php artisan config:clear
php artisan config:cache
php artisan optimize:clear
