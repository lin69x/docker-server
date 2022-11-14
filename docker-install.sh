#!/bin/bash

echo "=-----------"
echo "Обновление списка репозиториев:"
apt update

echo "==----------"
echo "Установка необходимых утилит:"
apt install curl git

echo "===---------"
echo "Установка пакетов для использования HTTPS в APT:"
apt install apt-transport-https ca-certificates curl software-properties-common

echo "====--------"
echo "Добавление ключа GPG для официального репозитория Docker в систему:"
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

echo "=====-------"
echo "Добавление репозитория Docker в источники APT:"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable"

echo "======------"
echo "Обновление списка репозиториев:"
apt update

echo "=======-----"
echo "Проверка, что установка будет выполняться из репозитория Docker, а не из репозитория Debian по умолчанию:"
apt-cache policy docker-ce

echo "========----"
echo "Установка Docker:"
apt install docker-ce

echo "=========---"
echo "Установка Docker Compose:"
curl -L "https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "==========--"
echo "Проверка Docker Compose:"
docker-compose --version

echo "===========-"
echo "Клонируем готовый шаблон для Docker:"
cd /var/www/
git clone https://github.com/lin69x/docker-server.git --branch master

echo "============"
echo "Проверка статуса Docker:"
systemctl status docker
