#!/bin/bash

WEBSITENAME="easelow"
WEBSITEDOMAIN="easelow.com.ng"
EMAIL="incrisz4luv@gmail.com"

# Update packages and install necessary packages
sudo apt update
sudo apt install apache2 -y

# install unzip
sudo apt-get install unzip

# Clone the Laravel application and install dependencies
sudo cd /var/www/
sudo wget https://easelow.com/easelow.zip 

sudo unzip easelow.zip
sudo mv easelow7 easelow


#assign ssl certificate

# Install Certbot
sudo apt-get update
sudo apt-get install certbot -y

# Obtain and install an SSL certificate for a domain
sudo certbot certonly --standalone --agree-tos --email $EMAIL -d $WEBSITEDOMAIN --non-interactive

# Add a cron job to auto-renew the certificate twice a day
sudo crontab -l | { cat; echo "0 */12 * * * certbot renew >/dev/null 2>&1"; } | sudo crontab -



# Add the ondrej/php repository and install PHP 8*
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt install php -y
sudo apt-get install php-bcmath php-bz2 php-intl php-gd php-mbstring php-mysql php-zip -y
sudo apt-get install php-bz2 php-calendar php-core php-ctype php-curl php-date php-exif php-filter php-ftp php-gettext php-gmp php-hash php-iconv php-libxml php-openssl php-pcntl php-pcre php-readline php-reflection php-session php-shmop php-simplexml php-spl php-sqlite3 php-standard php-tokenizer php-xml php-zlib -y
sudo apt-get install libxml2-utils -y
sudo apt-get install php-xml php-curl -y




# Set the desired values
UPLOAD_MAX_FILESIZE="128M+"
POST_MAX_SIZE="128M+"
MAX_EXECUTION_TIME="600+"
MAX_INPUT_TIME="120+"
MEMORY_LIMIT="256M+"
MAX_INPUT_VARS="1000+"
MAX_FILE_UPLOADS="20+"

# Get the current active PHP version
PHP_VERSION=$(php -r "echo PHP_MAJOR_VERSION.'.'.PHP_MINOR_VERSION;")

# Locate the php.ini file for the current active PHP version
PHP_INI=$(find /etc -name "php.ini" | grep $PHP_VERSION | head -n 1)

# Change the values in the php.ini file
sudo sed -i "s/^upload_max_filesize.*/upload_max_filesize = ${UPLOAD_MAX_FILESIZE}/" $PHP_INI
sudo sed -i "s/^post_max_size.*/post_max_size = ${POST_MAX_SIZE}/" $PHP_INI
sudo sed -i "s/^max_execution_time.*/max_execution_time = ${MAX_EXECUTION_TIME}/" $PHP_INI
sudo sed -i "s/^max_input_time.*/max_input_time = ${MAX_INPUT_TIME}/" $PHP_INI
sudo sed -i "s/^memory_limit.*/memory_limit = ${MEMORY_LIMIT}/" $PHP_INI
sudo sed -i "s/^max_input_vars.*/max_input_vars = ${MAX_INPUT_VARS}/" $PHP_INI
sudo sed -i "s/^max_file_uploads.*/max_file_uploads = ${MAX_FILE_UPLOADS}/" $PHP_INI

# Create virtual host file for Laravel application
sudo cat <<EOT >> /etc/apache2/sites-available/$WEBSITENAME.conf
<VirtualHost *:80>

    Redirect permanent / https://$WEBSITEDOMAIN/

    ServerName $WEBSITEDOMAIN
    ServerAlias www.$WEBSITEDOMAIN
    DocumentRoot /var/www/$WEBSITENAME

    <Directory /var/www/$WEBSITENAME>
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOT

# Enable the virtual host and rewrite module, then restart Apache
sudo a2ensite $WEBSITENAME.conf
sudo a2enmod rewrite


# Create virtual host file for https

sudo cat <<EOT >> /etc/apache2/sites-available/$WEBSITENAME-le-ssl.conf

<VirtualHost *:443>
   ServerName $WEBSITEDOMAIN
    ServerAlias www.$WEBSITEDOMAIN
    DocumentRoot /var/www/$WEBSITENAME

    <Directory /var/www/$WEBSITENAME>
        AllowOverride All
    </Directory>

    SSLEngine on
     SSLCertificateKeyFile /etc/letsencrypt/live/$WEBSITEDOMAIN/privkey.pem
    SSLCertificateChainFile /etc/letsencrypt/live/$WEBSITEDOMAIN/chain.pem
    SSLCertificateFile /etc/letsencrypt/live/$WEBSITEDOMAIN/fullchain.pem
   
</VirtualHost>
EOT

# Enable the virtual host and rewrite module, then restart Apache
sudo a2enmod ssl
sudo a2ensite $WEBSITENAME-le-ssl.conf
sudo systemctl restart apache2



#For permission and Ownership
sudo chown -R www-data:www-data /var/www/$WEBSITENAME/
sudo chmod -R 755 /var/www/$WEBSITENAME/
sudo chmod -R 755 /var/www/$WEBSITENAME/storage
sudo chmod -R 755 /var/www/$WEBSITENAME/bootstrap/cache

cd /var/www/$WEBSITENAME/
find . -type f -exec chmod 644 {} \;
find . -type d -exec chmod 755 {} \;






# Set the URL to check
url="http://$WEBSITEDOMAIN"

# Set the script to run if the server is down
renew_cert_script="sudo certbot certonly --standalone --agree-tos --email $EMAIL -d $WEBSITEDOMAIN --force-renewal"

# Set the log file location
log_file="/var/log/check_server.log"

# Check the server status
status=$(curl -Is "$url" | head -n 1 | awk '{print $2}')

# If the status is not 200 (OK), run the specified script and log the result
if [ "$status" != "200" ]; then
  echo "$(date) - Server is down, running script..." >> "$log_file"
  sleep 10s
  result=$($renew_cert_script)
  echo "$(date) - $result" >> "$log_file"
fi



sudo systemctl reload apache2


