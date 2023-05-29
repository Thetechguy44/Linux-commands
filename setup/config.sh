#!/bin/bash

# Create virtual host file for Laravel application
sudo cat <<EOT >> /etc/apache2/sites-available/hidden.conf
<VirtualHost *:80>


	ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/update

    <Directory /var/www/html>
        AllowOverride All
        Require all granted
        Options Indexes FollowSymLinks
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOT

# Enable the virtual host and rewrite module, then restart Apache
sudo a2dissite 000-default.conf
sudo a2ensite hidden.conf
sudo a2enmod rewrite
sudo systemctl restart apache2

