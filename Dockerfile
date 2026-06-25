FROM php:8.3-fpm

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

RUN php artisan package:discover --ansi
RUN php artisan storage:link 

RUN chown -R www-data:www-data storage bootstrap/cache
RUN php artisan optimize:clear

EXPOSE 9000

CMD ["php-fpm"]