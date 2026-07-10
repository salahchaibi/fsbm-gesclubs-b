FROM php:8.3-apache

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    libzip-dev \
    libicu-dev \
    libpq-dev \
    && docker-php-ext-install \
    pdo \
    pdo_mysql \
    zip \
    intl

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

COPY composer.json composer.lock ./

RUN composer install \
    --no-dev \
    --no-scripts \
    --optimize-autoloader \
    --no-interaction

COPY . .

# Enable Apache rewrite module
RUN a2enmod rewrite

# Set Laravel public directory as DocumentRoot
RUN sed -i 's!/var/www/html!/var/www/html/public!g' \
    /etc/apache2/sites-available/000-default.conf

# Laravel commands
RUN php artisan package:discover --ansi 
RUN php artisan storage:link 
RUN php artisan optimize:clear 

# Permissions
RUN chown -R www-data:www-data storage bootstrap/cache

EXPOSE 80

CMD ["apache2-foreground"]