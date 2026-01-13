# Use the official PHP-Apache image
FROM php:8.4-apache

# Install PDO MySQL extension for MariaDB communication
RUN docker-php-ext-install pdo pdo_mysql mysqli

# Enable Apache mod_rewrite (common for PHP apps)
RUN a2enmod rewrite

# Set the working directory to the standard Apache path
WORKDIR /var/www/html

# Copy your app folders into the container
# This matches your structure: app/php, app/css, etc.
COPY ./app .


# Adjust permissions so Apache can read the files
RUN chown -R www-data:www-data /var/www/html