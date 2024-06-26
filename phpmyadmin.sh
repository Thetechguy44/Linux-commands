# Update the package lists on your server:

sudo apt update
# Install MySQL server:

sudo apt install mysql-server -y
# During the installation, you'll be prompted to set a password for the MySQL root user. Choose a secure password and remember it.

# Secure the MySQL installation by running the security script:

sudo mysql_secure_installation
# This script will guide you through securing various aspects of your MySQL installation. You can choose the default recommended options.

# Install PHP and required extensions:

sudo apt install php8.0 libapache2-mod-php8.0 php8.0-mysql -y
# Install phpMyAdmin:

sudo apt install phpmyadmin -y
# During the installation, you'll be prompted to select the web server that should be automatically configured for phpMyAdmin. Choose apache2 using the spacebar, and then press Enter to continue.

# In the next prompt, select Yes to configure the database for phpMyAdmin with dbconfig-common.

# Provide the MySQL root user password that you set earlier when prompted.

# Configure Apache to recognize phpMyAdmin:

sudo nano /etc/apache2/apache2.conf
# Add the following line at the bottom of the file:


Include /etc/phpmyadmin/apache.conf
# Save the file and exit the text editor.

# Restart Apache to apply the changes:

sudo service apache2 restart
# Access phpMyAdmin in a web browser:

mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1ncrease';


# Open your web browser and enter the following URL:

https://localhost/phpmyadmin
# Replace your_server_ip with the actual IP address or domain name of your server.

# Start MySQL if it's not running:
# If the service is not active, you can start it:
sudo systemctl start mysql

# or for MariaDB:
sudo systemctl start mariadb

# Enable MySQL to start on boot:
# To ensure the MySQL server starts on boot:
sudo systemctl enable mysql

# or for MariaDB:
sudo systemctl enable mariadb


# Giving permission previledges to root 
# Access MySQL with System Root
# Access MySQL as the root user using the system root privileges:
sudo mysql

# Step 2: Verify MySQL Authentication Plugin
# Check the authentication plugin for the root user:
SELECT user, host, plugin FROM mysql.user WHERE user='root';

# This command will show you the authentication plugin used for the root user. If the plugin is auth_socket, you may need to change it to mysql_native_password to use a password for authentication.

# Update the authentication plugin if necessary:
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your_password';
FLUSH PRIVILEGES;


# Check the Current Authentication Plugin

# connect to MySQL using the root user with the password:
mysql -u root -p

# Check the current authentication plugin for the root user:
SELECT user, host, plugin FROM mysql.user WHERE user='root';

# Step 2: Update the Authentication Plugin for the root User
# Update the authentication plugin to mysql_native_password and set a new password:
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('your_password');

# If you need to change the authentication plugin explicitly, you can use:
UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE user = 'root' AND host = 'localhost';
FLUSH PRIVILEGES;

# Step 3: Test the Connection
# Exit MySQL:
EXIT;

# Try connecting to MySQL using the root user with the password:
mysql -u root -p

# Log in with the MySQL root username and password you set during the installation.

# That's it! You should now have MySQL and phpMyAdmin installed and accessible on your Ubuntu server