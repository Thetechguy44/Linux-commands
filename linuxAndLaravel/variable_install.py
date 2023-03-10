import os



# You can also use the input command to prompt the user for input and store it in a variable. 
# os.system("php = input(\"Enter your Project Php version (e.g. 7.4): \")")
# os.system("domain = input(\"Enter your Project Domain name extension(.com or .com.ng): \")")
# os.system("ProjectUrl = input(\"Enter your Project github url (e.g. https://github.com/Incrisz/easelow.git): \")")
# os.system("project = input(\"Enter your Project name (in LowerCase): \")")


# Update the packages list and install necessary packages
os.system("sudo apt update")
os.system("sudo apt install apache2 -y")

# Install PHP version 7.2+ on Ubuntu
os.system("sudo add-apt-repository -y ppa:ondrej/php")
os.system("sudo apt update")
os.system("sudo apt install php7.2 -y")
os.system("sudo apt-get install php7.2-bcmath php7.2-bz2 php7.2-intl php7.2-gd php7.2-mbstring php7.2-mysql php7.2-zip -y")

# Install Composer
os.system("curl -sS https://getcomposer.org/installer | sudo php7.2 -- --install-dir=/usr/local/bin --filename=composer")

# Configure Apache to serve the Laravel application
easelow_conf = """
<VirtualHost *:80>
    ServerName easelow.com.ng
    ServerAlias www.easelow.com.ng
    DocumentRoot /var/www/easelow

    <Directory /var/www/easelow>
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
"""

with open("/etc/apache2/sites-available/easelow.conf", "w") as f:
    f.write(easelow_conf)

os.system("sudo a2ensite easelow.conf")
os.system("sudo a2enmod rewrite")
os.system("sudo systemctl restart apache2")

# Clone the Laravel application to the /var/www/ directory
os.system("sudo git clone https://github.com/Incrisz/easelow.git /var/www/easelow")

# Install Laravel dependencies using Composer
os.chdir("/var/www/easelow")
os.system("sudo composer install --no-interaction")

# Set proper file permissions
os.system("sudo chown -R www-data:www-data /var/www/easelow")
os.system("sudo chmod -R 755 /var/www/easelow")

# Create an environment file for the Laravel application
os.system("cp .env.example .env")
os.system("sudo nano .env")

# Generate the application key and migrate the database
os.system("sudo php artisan key:generate")
os.system("sudo php artisan migrate")



# sudo python3 install_easelow.py
