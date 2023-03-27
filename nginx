#!/bin/bash

echo 'NGINX'
if [ "$1" = "test" ]
then
    echo '#Testing configs ...'
    docker-compose exec nginx nginx -t
fi

if [ "$1" = "reload" ]
then
    echo '#Reload NGINX ...'
    docker-compose exec nginx nginx -s reload
fi

if [ "$1" = "restart" ]
then
    echo '#Restart container NGINX ...'
    docker-compose restart nginx
fi
