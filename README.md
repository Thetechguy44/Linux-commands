DIR="/var/www"
LOCATION="hidden"


cd /var/www/ng
# Folder for git work

sudo git clone git@github.com:Incrisz/hidden.git
cd $LOCATION
cd app/
sudo git clone https://github.com/Incrisz/exceptions.git
sudo mv exceptions/Exceptions /var/www/hidden/ng/hidden/app/
cd ..
sudo mkdir storage/framework/cache/data

# sudo cp .env.example .env
# composer tester

sudo composer update -n
sudo wget https://easelowstore.s3.amazonaws.com/env.txt
sudo mv env.txt .env
cd app/
sudo mv exceptions/CoreComponentRepository.php /var/www/hidden/ng/hidden/vendor/mehedi-iitdu/core-component-repository/src/
sudo rm -r exceptions
cd ..
# sudo wget https://github.com/Incrisz/Linux-commands/blob/main/.env

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






CRACK WINDOWS

irm https://massgrave.dev/get iex
