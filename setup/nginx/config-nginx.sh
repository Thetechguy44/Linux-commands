#!/bin/bash

# Create virtual host file for Laravel application
sudo cat <<EOT >> /etc/nginx/sites-available/hidden.conf

server {
    listen 80;
    server_name localhost;

    root /var/www/html/update;
    index index.php;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_pass unix:/var/run/php/php8.0-fpm.sock; # Adjust for your PHP version
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}

EOT

# Create a Symbolic Link:
# Create a symbolic link to enable the server block configuration you just created:
#This is to enable site like we do in apache using a2ensite

#To enable site
sudo ln -s /etc/nginx/sites-available/hidden.conf /etc/nginx/sites-enabled/hidden.conf

# To test
sudo nginx -t

#To disable site 
sudo rm /etc/nginx/sites-enabled/default

sudo ufw allow 'Nginx Full'

sudo systemctl reload nginx


# Test Nginx Configuration:
# Run the following command to test your Nginx configuration for syntax errors:

# sudo nginx -t

#checking php
# systemctl status php8.0-fpm
sudo systemctl enable php8.0-fpm
sudo systemctl restart php8.0-fpm


# sudo systemctl start php8.0-fpm