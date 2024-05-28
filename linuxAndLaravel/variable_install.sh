#!/bin/bash

# You can also use the read command to prompt the user for input and store it in a variable. 
read -p "Enter your Project Php version (e.g. 7.4): " php
read -p "Enter your Project Domain name extension(.com or .com.ng): " domain
read -p "Enter your Project github url (e.g. https://github.com/thetechguy44/example.git): " ProjectUrl
read -p "Enter your Project name (in LowerCase): " project



# Update packages and install necessary packages
sudo apt update
sudo apt install apache2 -y

# Add the ondrej/php repository and install PHP 7.2
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt install php$php -y
sudo apt-get install php$php-bcmath php$php-bz2 php$php-intl php$php-gd php$php-mbstring php$php-mysql php$php-zip -y

# Install Composer
curl -sS https://getcomposer.org/installer | sudo php8.2 -- --install-dir=/usr/local/bin --filename=composer

# Create virtual host file for Laravel application
sudo cat <<EOT >> /etc/apache2/sites-available/$project.conf
<VirtualHost *:80>
    ServerName $project$domain
    ServerAlias www.$project$domain
    DocumentRoot /var/www/$project

    <Directory /var/www/$project>
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOT

# Enable the virtual host and rewrite module, then restart Apache
sudo a2ensite $project.conf
sudo a2enmod rewrite
sudo systemctl restart apache2

# Clone the Laravel application and install dependencies
sudo git clone $ProjectUrl /var/www/$project/
sudo composer install --no-interaction
sudo chown -R www-data:www-data /var/www/$project/
sudo chmod -R 755 /var/www/$project/
sudo chmod -R 755 /var/www/$project/storage
sudo chmod -R 755 /var/www/$project/bootstrap/cache

# Create environment file, generate application key, and migrate the database
cd /var/www/$project/
cp .env.example .env
# sudo nano .env # Edit the file with necessary configurations
sudo php artisan key:generate
sudo php artisan migrate


# Save this script in a file with a .sh extension (e.g. install_$project.sh). Then, make the script executable with the command chmod +x install_example.sh. Finally, run the script with ./install_example.sh. This should automate the installation process.
#if it shows page not found 403 apache2 80 stuff...to solve add .htaccess and index.php files