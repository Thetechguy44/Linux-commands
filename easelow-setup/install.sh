#!/bin/bash


# Update packages and install necessary packages
sudo apt update
sudo apt-get install unzip
sudo apt-get install p7zip

sudo apt install apache2 -y


# Add the ondrej/php repository and install PHP 8.0
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt install php8.0 -y

# to check packages installed
# sudo php -m



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




# Install Composer
curl -sS https://getcomposer.org/installer | sudo php8.0 -- --install-dir=/usr/local/bin --filename=composer

cd /var/www/html/
# Folder for git work

sudo git clone https://github.com/Incrisz/hidden.git
cd hidden
cd app/
sudo git clone https://github.com/Incrisz/exceptions.git
sudo mv exceptions/Exceptions /var/www/html/hidden/app/
cd ..
sudo mkdir storage/framework/cache/data

sudo cp .env.example .env
# composer tester

sudo composer update -n
cd app/
sudo mv exceptions/CoreComponentRepository.php /var/www/html/hidden/vendor/mehedi-iitdu/core-component-repository/src/
sudo rm -r exceptions
cd ..
sudo wget https://github.com/Incrisz/Linux-commands/blob/main/.env

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


sudo service apache2 restart



# How to Pull and Run
# sudo wget https://github.com/Incrisz/Linux-commands/raw/main/easelow-setup/install.sh   
# OR
# sudo curl -LO https://github.com/Incrisz/Linux-commands/raw/main/easelow-setup/install.sh

# sudo chmod +x install.sh
# sudo ./install.sh


