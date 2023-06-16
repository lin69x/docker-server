#!/bin/bash
if [ -z "$2" ]
  then
    echo "Не указан домен(ы) для получения сертификата"
    echo "Вторым аргументом. Пример: -d domain.ru -d test.domain.ru"
else
    if [[ $2 == *"-d"* ]]; then
        
        if [ "$1" = "prod" ]; then
            echo '#certbot ...'
            certbot certonly --webroot --webroot-path=/var/www/html --email email@mail.ru $2
        elif [ "$1" = "renew" ]; then
            certbot renew --webroot --webroot-path=/var/www/html $2
        elif [ "$1" = "dry" ]; then
            certbot certonly --webroot --webroot-path=/var/www/html --email email@mail.ru --dry-run $2
        else
            echo "Не понял что нужно сделать... - prod || renew || dry?"
        fi

    else
        echo "Вторым аргументом. Пример: -d domain.ru -d test.domain.ru"
    fi

fi
