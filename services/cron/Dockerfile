FROM php:8.1-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y cron && cron && service cron start

# Install PHP extensions
RUN docker-php-ext-install pdo exif \
    mysqli pdo_mysql
    #opcache \
    #pgsql pdo_pgsql \
    #dom session openssl json xml xmlreader intl iconv mbstring gd curl ctype dom zip pcntl phar session zlib

# Cron add
COPY crontab /etc/crontab
RUN touch /var/log/cron.log && crontab -u root /etc/crontab
CMD cron && tail -f /var/log/cron.log