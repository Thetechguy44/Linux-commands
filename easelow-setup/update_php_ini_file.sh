#!/bin/bash

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
