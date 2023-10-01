# Used for prod build.
FROM php:8.0-fpm as php

# Set environment variables
ENV PHP_OPCACHE_ENABLE=1
ENV PHP_OPCACHE_ENABLE_CLI=0
ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS=0
ENV PHP_OPCACHE_REVALIDATE_FREQ=0

# Install dependencies.
RUN apt-get update && apt-get install -y unzip libpq-dev libcurl4-gnutls-dev nginx libonig-dev

# Install PHP extensions.
RUN docker-php-ext-install mysqli pdo pdo_mysql bcmath curl opcache mbstring

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libxslt-dev \
    libgd-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip bcmath pdo_mysql xsl intl gd \
    && apt-get clean

# Copy composer executable.
COPY --from=composer:2.3.5 /usr/bin/composer /usr/bin/composer

# Copy configuration files.
COPY ./docker/php/php.ini /usr/local/etc/php/php.ini
COPY ./docker/php/php-fpm.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./docker/nginx/nginx.conf /etc/nginx/nginx.conf


# Set the desired values
ENV UPLOAD_MAX_FILESIZE="258M"
ENV POST_MAX_SIZE="258M"
ENV MAX_EXECUTION_TIME="600"
ENV MAX_INPUT_TIME="120"
ENV MEMORY_LIMIT="512M"
ENV MAX_INPUT_VARS="1000"
ENV MAX_FILE_UPLOADS="20"

# Update php.ini with the desired values
#TO CHECK docker exec -it <container_name_or_id> /bin/bash
#THEN echo $POST_MAX_SIZE
RUN sed -i "s/upload_max_filesize.*/upload_max_filesize = ${UPLOAD_MAX_FILESIZE}/" /usr/local/etc/php/php.ini \
    && sed -i "s/post_max_size.*/post_max_size = ${POST_MAX_SIZE}/" /usr/local/etc/php/php.ini \
    && sed -i "s/max_execution_time.*/max_execution_time = ${MAX_EXECUTION_TIME}/" /usr/local/etc/php/php.ini \
    && sed -i "s/max_input_time.*/max_input_time = ${MAX_INPUT_TIME}/" /usr/local/etc/php/php.ini \
    && sed -i "s/memory_limit.*/memory_limit = ${MEMORY_LIMIT}/" /usr/local/etc/php/php.ini \
    && sed -i "s/max_input_vars.*/max_input_vars = ${MAX_INPUT_VARS}/" /usr/local/etc/php/php.ini \
    && sed -i "s/max_file_uploads.*/max_file_uploads = ${MAX_FILE_UPLOADS}/" /usr/local/etc/php/php.ini

# Expose port 9000 for PHP-FPM
#if you change this port also change it in the docker/nginx/nginx.conf & php/php-fpm.conf file :9000
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]

# Set working directory to /var/www.
WORKDIR /var/www

# Copy files from current folder to container current folder (set in workdir).
COPY --chown=www-data:www-data . .

# Create laravel caching folders.
RUN mkdir -p /var/www/storage/framework
RUN mkdir -p /var/www/storage/framework/cache
RUN mkdir -p /var/www/storage/framework/testing
RUN mkdir -p /var/www/storage/framework/sessions
RUN mkdir -p /var/www/storage/framework/views

# Fix files ownership.
RUN chown -R www-data /var/www/storage
RUN chown -R www-data /var/www/storage/framework
RUN chown -R www-data /var/www/storage/framework/sessions

# Set correct permission.
RUN chmod -R 755 /var/www/storage
RUN chmod -R 755 /var/www/storage/logs
RUN chmod -R 755 /var/www/storage/framework
RUN chmod -R 755 /var/www/storage/framework/sessions
RUN chmod -R 755 /var/www/bootstrap

# Adjust user permission & group
RUN usermod --uid 1000 www-data
RUN groupmod --gid 1001 www-data

# Run the entrypoint file.
ENTRYPOINT [ "docker/entrypoint.sh" ]