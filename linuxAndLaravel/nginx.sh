#!/bin/bash

# =========================
# UPDATE SYSTEM
# =========================
sudo apt update -y
sudo apt upgrade -y

# =========================
# INSTALL NGINX + MYSQL + GIT
# =========================
sudo apt install nginx git curl unzip -y
sudo apt install mysql-server -y

# =========================
# INSTALL PHP + EXTENSIONS
# (change version if needed)
# =========================
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update -y

sudo apt install php8.4-fpm php8.4-cli php8.4-mysql php8.4-mbstring php8.4-xml php8.4-curl php8.4-zip php8.4-bcmath php8.4-gd -y

# =========================
# START SERVICES
# =========================
sudo systemctl enable nginx
sudo systemctl start nginx

sudo systemctl enable php8.4-fpm
sudo systemctl start php8.4-fpm

sudo systemctl enable mysql
sudo systemctl start mysql

# =========================
# INSTALL COMPOSER
# =========================
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# =========================
# CREATE PROJECT DIRECTORY
# =========================
PROJECT_NAME="example"
DOMAIN="example.test"
PROJECT_PATH="/var/www/$PROJECT_NAME"

sudo mkdir -p $PROJECT_PATH
sudo chown -R $USER:$USER $PROJECT_PATH

# =========================
# CLONE LARAVEL PROJECT
# =========================
git clone https://github.com/thetechguy44/example.git $PROJECT_PATH

cd $PROJECT_PATH

composer install --no-interaction

cp .env.example .env

php artisan key:generate

# =========================
# FIX PERMISSIONS (Laravel)
# =========================
sudo chown -R www-data:www-data $PROJECT_PATH
sudo chmod -R 755 $PROJECT_PATH
sudo chmod -R 775 storage bootstrap/cache

# =========================
# CREATE NGINX CONFIG
# =========================
sudo tee /etc/nginx/sites-available/$PROJECT_NAME > /dev/null <<EOF

server {
    listen 80;
    server_name $DOMAIN;

    root $PROJECT_PATH/public;
    index index.php index.html;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.4-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}

EOF

# =========================
# ENABLE SITE
# =========================
sudo ln -s /etc/nginx/sites-available/$PROJECT_NAME /etc/nginx/sites-enabled/

# Remove default nginx page (optional but recommended)
sudo rm -f /etc/nginx/sites-enabled/default

# =========================
# TEST & RELOAD NGINX
# =========================
sudo nginx -t
sudo systemctl reload nginx

# =========================
# ADD LOCAL DOMAIN
# =========================
if ! grep -q "$DOMAIN" /etc/hosts; then
    echo "127.0.0.1 $DOMAIN" | sudo tee -a /etc/hosts
fi

# =========================
# INSTALL PHPMYADMIN
# =========================
sudo apt install phpmyadmin -y

# Enable phpMyAdmin for Nginx
sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

# =========================
# DONE
# =========================
echo "======================================"
echo "SETUP COMPLETE 🚀"
echo "Project: $PROJECT_NAME"
echo "URL: http://$DOMAIN"
echo "phpMyAdmin: http://$DOMAIN/phpmyadmin"
echo "======================================"
