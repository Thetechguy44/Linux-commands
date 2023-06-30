#!/bin/bash

# sudo ./cron-job.sh

cd /var/www/html/update
sudo rm .env
sudo wget https://easelowstore.s3.amazonaws.com/envaf.txt
sudo mv envaf.txt .env
git config --global --add safe.directory /var/www/html/update
sudo git pull 


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