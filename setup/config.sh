#!/bin/bash

# Create virtual host file for Laravel application
sudo cat <<EOT >> /etc/apache2/sites-available/hidden.conf
<VirtualHost *:80>
    ServerName easelow.com.ng
    ServerAlias www.easelow.com.ng
    DocumentRoot /var/www/hidden

    <Directory /var/www/hidden>
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOT

# Enable the virtual host and rewrite module, then restart Apache
sudo a2ensite hidden.conf
sudo a2enmod rewrite
sudo systemctl restart apache2
sudo systemctl restart apache2
