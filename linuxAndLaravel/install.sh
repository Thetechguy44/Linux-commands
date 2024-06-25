#!/bin/bash

# Update packages and install necessary packages
sudo apt update
sudo apt install apache2 -y

# Add the ondrej/php repository and install PHP 7.2
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt install php7.2 -y
sudo apt-get install php7.2-bcmath php7.2-bz2 php7.2-intl php7.2-gd php7.2-mbstring php7.2-mysql php7.2-zip -y
sudo apt-get install php7.4-bz2 php7.4-calendar php7.4-core php7.4-ctype php7.4-curl php7.4-date php7.4-exif php7.4-filter php7.4-ftp php7.4-gettext php7.4-gmp php7.4-hash php7.4-iconv php7.4-libxml php7.4-openssl php7.4-pcntl php7.4-pcre php7.4-readline php7.4-reflection php7.4-session php7.4-shmop php7.4-simplexml php7.4-spl php7.4-sqlite3 php7.4-standard php7.4-tokenizer php7.4-xml php7.4-zlib 


# Install Composer
curl -sS https://getcomposer.org/installer | sudo php8.0 -- --install-dir=/usr/local/bin --filename=composer

# Create virtual host file for Laravel application
sudo tee -a /etc/apache2/sites-available/example.conf <<EOT
<VirtualHost *:80>
    ServerName hms.com
    ServerAlias www.hms.com
    DocumentRoot /var/www/example

    <Directory /var/www/example>
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOT

# Enable the virtual host and rewrite module, then restart Apache
sudo a2ensite example.conf
sudo a2enmod rewrite
sudo systemctl restart apache2
sudo nano /etc/hosts

# Clone the Laravel application and install dependencies
sudo git clone https://github.com/thetechguy44/example.git /var/www/example/
sudo composer install --no-interaction
sudo chown -R www-data:www-data /var/www/example/
sudo chmod -R 755 /var/www/example/
sudo chmod -R 755 /var/www/example/storage
sudo chmod -R 755 /var/www/example/bootstrap/cache


# Create environment file, generate application key, and migrate the database
cd /var/www/example/
cp .env.example .env
sudo nano .env # Edit the file with necessary configurations
sudo php artisan key:generate
sudo php artisan migrate


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


# Start MySQL if it's not running:

# If the service is not active, you can start it:
sudo systemctl start mysql

# or for MariaDB:
sudo systemctl start mariadb

# Enable MySQL to start on boot:
# To ensure the MySQL server starts on boot:
sudo systemctl enable mysql

# or for MariaDB:
sudo systemctl enable mariadb


# Giving permission previledges to root 

# Access MySQL with System Root
# Access MySQL as the root user using the system root privileges:
sudo mysql

# Step 2: Verify MySQL Authentication Plugin
# Check the authentication plugin for the root user:
SELECT user, host, plugin FROM mysql.user WHERE user='root';

# This command will show you the authentication plugin used for the root user. If the plugin is auth_socket, you may need to change it to mysql_native_password to use a password for authentication.

# Update the authentication plugin if necessary:
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your_password';
FLUSH PRIVILEGES;


# Check the Current Authentication Plugin

# connect to MySQL using the root user with the password:
mysql -u root -p

# Check the current authentication plugin for the root user:
SELECT user, host, plugin FROM mysql.user WHERE user='root';

# Step 2: Update the Authentication Plugin for the root User
# Update the authentication plugin to mysql_native_password and set a new password:
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('your_password');

# If you need to change the authentication plugin explicitly, you can use:
UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE user = 'root' AND host = 'localhost';
FLUSH PRIVILEGES;

# Step 3: Test the Connection
# Exit MySQL:
EXIT;

# Try connecting to MySQL using the root user with the password:
mysql -u root -p

# Save this script in a file with a .sh extension (e.g. install_example.sh). Then, make the script executable with the command chmod +x install_example.sh. Finally, run the script with ./install_example.sh. This should automate the installation process.
# #if it shows page not found 403 apache2 80 stuff...to solve add .htaccess and index.php files
