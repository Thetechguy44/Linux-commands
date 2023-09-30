docker-compose exec php apt-get update
docker-compose exec php apt-get install -y libzip-dev
docker-compose exec php docker-php-ext-install zip
docker-compose exec php docker-php-ext-install bcmath
docker-compose exec php docker-php-ext-install pdo_mysql


docker-compose exec php apt-get update
docker-compose exec php apt-get install -y libxslt-dev
docker-compose exec php docker-php-ext-install xsl


docker-compose exec php docker-php-ext-configure intl
docker-compose exec php docker-php-ext-install intl


docker-compose exec php apt-get update
docker-compose exec php apt-get install -y libgd-dev
docker-compose exec php docker-php-ext-configure gd --with-freetype --with-jpeg
docker-compose exec php docker-php-ext-install -j$(nproc) gd


docker-compose exec php apt-get update
docker-compose exec php apt-get install -y libgd-dev
docker-compose exec php docker-php-ext-configure gd --with-freetype --with-jpeg
docker-compose exec php docker-php-ext-install -j$(nproc) gd

#to check
docker-compose exec php php -m | grep zip

#when you are inside the termianl
php -m | grep mysql
php -m | grep dom
