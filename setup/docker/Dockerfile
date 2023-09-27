# Use the official PHP 8.0 base image
FROM php:8.0-fpm

# Update packages and install necessary packages
RUN apt-get update && apt-get install -y \
    unzip \
    p7zip \
    software-properties-common \
    curl

# Add the ondrej/php repository and install PHP 8.0
RUN add-apt-repository -y ppa:ondrej/php && apt-get update && apt-get install -y php8.0

# Install additional PHP extensions
RUN apt-get install -y \
    php8.0-dom \
    php8.0-gd \
    php8.0-intl \
    php8.0-mbstring \
    php8.0-xml \
    php8.0-xsl \
    php8.0-zip \
    php8.0-curl \
    php8.0-pdo-mysql \
    php8.0-bcmath

# Fetch the custom entrypoint script from GitHub
RUN curl -o /usr/local/bin/update_php_ini_docker.sh -L https://raw.githubusercontent.com/Incrisz/Linux-commands/main/setup/nginx/update_php_ini_docker.sh

# Make the entrypoint script executable
RUN chmod +x /usr/local/bin/update_php_ini_docker.sh

# Set the custom entrypoint script
ENTRYPOINT ["/usr/local/bin/update_php_ini_docker.sh"]

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# Set the working directory
WORKDIR /var/www/html/update

# Copy your Laravel application code into the container
COPY . /var/www/html/update



# Expose port 9000 (used by PHP-FPM)
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]
