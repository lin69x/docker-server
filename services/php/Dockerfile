FROM composer:latest AS composer
FROM php:8.1-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y git libzip-dev zip libpng-dev zlib1g-dev libfreetype6-dev libjpeg62-turbo-dev

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install PHP extensions
RUN docker-php-ext-install pdo exif zip mysqli pdo_mysql sockets \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd
    
    # Additional extensions
    #opcache \
    #pgsql pdo_pgsql \
    #dom session openssl json xml xmlreader intl iconv mbstring gd curl ctype dom zip pcntl phar session zlib

# Set configs files
COPY ./configs/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./configs/docker.conf /usr/local/etc/php-fpm.d/docker.conf
COPY ./configs/zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf
COPY ./configs/zz-global.conf /usr/local/etc/php-fpm.d/zz-global.conf
