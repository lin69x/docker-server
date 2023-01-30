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

if [ "$1" = "clear" ]
then
    echo '#Clear ...'
    echo 'Неиспользуемые тома'
    docker volume ls -f dangling=true
    docker volume rm $(docker volume ls -f dangling=true -q)
    docker volume prune -f

    echo 'Остановленные контейнеры'
    docker ps -a -f status=exited -q
    docker rm -vf $(docker ps -aq)
    docker container prune -f

    echo 'Недействительные образы'
    docker images -f dangling=true -q
    docker rmi -f $(docker images -aq)
    docker image prune -f

    echo 'Очистка неиспользуемых данных'
    docker network prune -f
    docker system prune -f
fi
