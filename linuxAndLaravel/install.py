import os

# Update the packages list and install necessary packages
os.system("sudo apt update")
os.system("sudo apt install apache2 -y")

# Install PHP version 7.2+ on Ubuntu
os.system("sudo add-apt-repository -y ppa:ondrej/php")
os.system("sudo apt update")
os.system("sudo apt install php7.2 -y")
os.system("sudo apt-get install php7.2-bcmath php7.2-bz2 php7.2-intl php7.2-gd php7.2-mbstring php7.2-mysql php7.2-zip -y")
sudo apt-get install php7.4-bz2 php7.4-calendar php7.4-core php7.4-ctype php7.4-curl php7.4-date php7.4-exif php7.4-filter php7.4-ftp php7.4-gettext php7.4-gmp php7.4-hash php7.4-iconv php7.4-libxml php7.4-openssl php7.4-pcntl php7.4-pcre php7.4-readline php7.4-reflection php7.4-session php7.4-shmop php7.4-simplexml php7.4-spl php7.4-sqlite3 php7.4-standard php7.4-tokenizer php7.4-xml php7.4-zlib

# Install Composer
os.system("curl -sS https://getcomposer.org/installer | sudo php7.2 -- --install-dir=/usr/local/bin --filename=composer")

# Configure Apache to serve the Laravel application
example_conf = """
<VirtualHost *:80>
    ServerName example.com.ng
    ServerAlias www.example.com.ng
    DocumentRoot /var/www/example

    <Directory /var/www/example>
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
"""

with open("/etc/apache2/sites-available/example.conf", "w") as f:
    f.write(example_conf)

os.system("sudo a2ensite example.conf")
os.system("sudo a2enmod rewrite")
os.system("sudo systemctl restart apache2")

# Clone the Laravel application to the /path/storage directory
os.system("sudo git clone https://github.com/thetechguy44/example.git /path/storage")

# Install Laravel dependencies using Composer
os.chdir("/path/storage")
os.system("sudo composer install --no-interaction")

# Set proper file permissions
os.system("sudo chown -R www-data:www-data /path/storage)
os.system("sudo chmod -R 755 /path/storage")

os.system("sudo chmod -R 755 /path/storage")
os.system("sudo chmod -R 755 /path/storage/bootstrap/cache")

# Create an environment file for the Laravel application
os.system("cp .env.example .env")
os.system("sudo nano .env")
)
# Generate the application key and migrate the database
os.system("sudo php artisan key:generate")
os.system("sudo php artisan migrate")



# sudo python3 install_example.py
