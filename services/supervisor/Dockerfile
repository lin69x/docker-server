FROM php:8.1-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y cron supervisor
#RUN apt-get install libldap php-ldap ldb-dev openldap openldap-dev openldap-clients openldap-back-mdb

# Install PHP extensions
RUN docker-php-ext-install pdo exif \
    mysqli pdo_mysql
    #opcache \
    #pgsql pdo_pgsql \
    #dom session openssl json xml xmlreader intl iconv mbstring gd curl ctype dom zip pcntl phar session zlib

CMD service supervisor start