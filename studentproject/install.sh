#!/bin/bash

DIR="/var/www/html"
# DIR="/var/www"
LOCATION="update"

# Update packages and install necessary packages
sudo apt update
sudo apt-get install unzip
sudo apt-get install p7zip

sudo apt install apache2 -y


# Add the ondrej/php repository and install PHP 8.1
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt install php8.1 -y

# to check packages installed
# sudo php -m



# Update packages and install necessary packages
sudo apt install php8.1-dom
sudo apt install php8.1-gd -y
sudo apt install php8.1-intl  
sudo apt install php8.1-mbstring -y
# sudo apt install php8.1-simplexml
sudo apt install php8.1-xml 
sudo apt install php8.1-xsl 
sudo apt install php8.1-zip -y
sudo apt-get install php8.1-curl
sudo apt install php8.1-pdo-mysql
sudo apt-get install php8.1-bcmath -y
sudo apt install php8.1-sodium
sudo apt install php8.1-fileinfo
sudo apt install php8.1-ctype
sudo apt install php8.1-json





# Install Composer
curl -sS https://getcomposer.org/installer | sudo php8.1 -- --install-dir=/usr/local/bin --filename=composer



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


sudo service apache2 restart



# How to Pull and Run
# sudo wget https://raw.githubusercontent.com/thetechguy44/Linux-commands/raw/main/setup/install.sh   
# OR
# sudo curl -LO https://raw.githubusercontent.com/thetechguy44/Linux-commands/raw/main/setup/install.sh

# sudo chmod +x install.sh
# sudo ./install.sh


