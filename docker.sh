#!/bin/bash

chown -R www-data:www-data ./
chmod -R g+w ./


echo '#START ...'
if [ "$1" = "build" ]
then
    echo '#STOP DOWN ...'
    docker-compose down
    echo '#Build ...'
    if [ "$2" = "start" ]
    then
        docker-compose up --build -d
    else
        docker-compose up --build
    fi
fi

if [ "$1" = "up" ]
then
    echo '#STOP DOWN ...'
    docker-compose down
    echo 'Up ...'
    docker-compose up -d
fi

if [ "$1" = "start" ]
then
    echo '#Start  ...'
    docker-compose start
fi

if [ "$1" = "stop" ]
then
    echo '#Stop ...'
    docker-compose stop
fi

if [ "$1" = "down" ]
then
    echo '#Down ...'
    docker-compose down
fi