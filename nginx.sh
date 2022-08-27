#!/bin/bash

echo '#START ...'
if [ "$1" = "test" ]
then
    echo '#Testing configs ...'
    docker-compose exec nginx nginx -t
fi

if [ "$1" = "restart" ]
then
    echo '#Reload NGINX ...'
    docker-compose exec nginx nginx -s reload
fi