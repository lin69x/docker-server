FROM composer:latest AS composer
FROM php:8.2-fpm

# Install system dependencies
#RUN apt-get update && apt-get install -y git libzip-dev zip
RUN apt-get update && \
    apt-get install -y \
    git zip \
    libzip-dev \
    libpng-dev \
    libwebp-dev \
    zlib1g-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmagickwand-dev

#LDAP
#libldap php-ldap ldb-dev openldap openldap-dev openldap-clients openldap-back-mdb

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
#RUN composer --version

# Install PHP extensions
RUN docker-php-ext-install pdo exif zip mysqli pdo_mysql sockets pcntl \
    && docker-php-ext-configure gd --with-webp --with-jpeg --with-freetype \
    && docker-php-ext-install -j$(nproc) gd \
    && pecl install imagick && docker-php-ext-enable imagick

# Additional extensions
#opcache \
#pgsql pdo_pgsql \
#dom session openssl json xml xmlreader intl iconv mbstring gd curl ctype dom zip pcntl phar session zlib

# Set configs files
#COPY ./configs/php.ini /usr/local/etc/php/php.ini
COPY ./configs/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./configs/docker.conf /usr/local/etc/php-fpm.d/docker.conf
COPY ./configs/zz-docker.conf /usr/local/etc/php-fpm.d/zz-docker.conf
COPY ./configs/zz-global.conf /usr/local/etc/php-fpm.d/zz-global.conf
#COPY ./configs/cacert.pem /usr/local/etc/php-fpm.d/cacert.pem

# abbreviated entry "php artisan" => "pa"
RUN echo "alias pa='php artisan'" > ~/.bash_profile \
    && echo "source ~/.bash_profile" >> /etc/bash.bashrc \
    && /bin/bash --login -C "/etc/bash.bashrc"
