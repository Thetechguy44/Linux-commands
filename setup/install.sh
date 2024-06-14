#!/bin/bash

DIR="/var/www/html"
# DIR="/var/www"
LOCATION="update"

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

# use this if it complains of versions 
composer global require laravel/installer --update-with-all-dependencies

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
php artisan key:generate
php artisan cache:clear
php artisan config:clear
php artisan config:cache
php artisan optimize:clear
php artisan route:clear
php artisan view:clear

sudo service apache2 restart


# How to install phpmyadmin on Linux
sudo apt-get install phpmyadmin
#Then installation begins. When prompted, select “Apache2” from the “Configuring phpMyAdmin” dialogue box. When asked for MySQL username and password enter “root” for username and YOUR_MYSQL_PASSWORD for password.

#After installation is complete, configure phpMyAdmin to be recognised by the local web server.

#Open the apache configuration file in your favourite text editor;
sudo gedit /etc/apache2/apache2.conf
#and add the following line at the bottom of the file (you can add it anywhere in the file, I just choose the bottom here so that you can easily access it for modification):
Include /etc/phpmyadmin/apache.conf

#then restart the web server;
sudo service apache2 restart

#Now enter the following url in your browser;
https://localhost/phpmyadmin


# How to Pull and Run
# sudo wget https://raw.githubusercontent.com/thetechguy44/Linux-commands/raw/main/setup/install.sh   
# OR
# sudo curl -LO https://raw.githubusercontent.com/thetechguy44/Linux-commands/raw/main/setup/install.sh

# sudo chmod +x install.sh
# sudo ./install.sh


