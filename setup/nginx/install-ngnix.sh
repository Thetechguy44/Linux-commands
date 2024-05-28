#!/bin/bash

DIR="/var/www/html"
# DIR="/var/www"
LOCATION="update"

# Update packages and install necessary packages
sudo apt-get update
sudo apt-get install unzip
sudo apt-get install p7zip

sudo apt-get install nginx -y


# Add the ondrej/php repository and install PHP 8.0
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt-get install php8.0-fpm -y




# Update packages and install necessary packages
sudo apt install php8.0-dom
sudo apt install php8.0-gd -y
sudo apt install php8.0-intl  
sudo apt install php8.0-mbstring -y
# sudo apt install php8.0-simplexml
sudo apt install php8.0-xml 
sudo apt install php8.0-xsl 
sudo apt install php8.0-zip -y
sudo apt-get install php8.0-curl
sudo apt install php8.0-pdo-mysql
sudo apt-get install php8.0-bcmath -y




# Install Composer
curl -sS https://getcomposer.org/installer | sudo php8.0 -- --install-dir=/usr/local/bin --filename=composer



cd $DIR/
# Folder for git work

# sudo git clone git@github.com:thetechguy44/hidden.git
sudo git clone git@github.com:thetechguy44/update.git

cd $LOCATION
cd app/
sudo git clone https://github.com/thetechguy44/exceptions.git
sudo mv exceptions/Exceptions $DIR/$LOCATION/app/
cd ..
sudo mkdir storage/framework/cache/data

# sudo cp .env.example .env
# composer tester

sudo composer update -n
sudo wget https://examplestore.s3.amazonaws.com/envaf.txt
sudo mv envaf.txt .env
cd app/
sudo mv exceptions/CoreComponentRepository.php $DIR/$LOCATION/vendor/mehedi-iitdu/core-component-repository/src/
sudo rm -r exceptions
cd ..
# sudo wget https://github.com/thetechguy44/Linux-commands/blob/main/.env

# sudo ./env.sh
# sudo rm env.sh

sudo find . -type f -exec chmod 644 {} \;
sudo find . -type d -exec chmod 755 {} \;

sudo chown -R www-data:www-data .
sudo chmod -R 755 .
sudo chmod -R 755 storage
sudo chmod -R 755 bootstrap/cache

# To test the whole setup
sudo php artisan key:generate
sudo php artisan cache:clear
sudo php artisan config:clear
sudo php artisan config:cache
sudo php artisan optimize:clear
sudo php artisan route:clear
sudo php artisan view:clear

sudo service nginx restart

# Create a Nginx Server Block Configuration:

# Nginx uses server block configurations to define how it should handle incoming requests. Create a new configuration file for your Laravel application in the /etc/nginx/sites-available/ directory:


