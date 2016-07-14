#!/usr/bin/env bash

apt-get update -y

apt-get install make -y
apt-get install build-essential -y
apt-get install openssl -y
apt-get install libssl-dev -y
apt-get install pkg-config -y
apt-get install rabbitmq-server -y

## Add apache
apt-get install -y unzip vim git-core curl wget build-essential python-software-properties
add-apt-repository -y ppa:nginx/stable
apt-get update
#apt-get install -y nginx
apt-get install -y apache

## Add php-fpm
sudo add-apt-repository -y ppa:ondrej/php5
sudo apt-get update
sudo apt-get install -y php5-mysql php5 php5-memcached php5-cli php5-apcu php5-xdebug php5-curl

## Add hhvm
#add-apt-repository -y ppa:mapnik/boost
#wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | sudo apt-key add -
#echo deb http://dl.hhvm.com/ubuntu precise main | sudo tee /etc/apt/sources.list.d/hhvm.list
#apt-get update
#apt-get install -y hhvm
## Set HHVM as php for path
#/usr/bin/update-alternatives --install /usr/bin/php php /usr/bin/hhvm 60

## Add composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

## Add the www dir
mkdir -p /var/www/html

#wget http://nodejs.org/dist/v0.10.35/node-v0.10.35.tar.gz
#tar -zxf node-v0.10.35.tar.gz
#cd node-v0.10.35
#./configure
#make
#sudo make install

apt-get install git -y
apt-get install php-pear -y
apt-get install php5-dev -y
apt-get install aptitude -y
aptitude install libtool -y
aptitude install pkg-config -y
cd /tmp
rm -rf rabbitmq-c
git clone -b v0.5.2 git://github.com/alanxz/rabbitmq-c.git
cd rabbitmq-c
git fetch --tags
git checkout tags/v0.5.2
autoreconf -i && ./configure && make && make install
pecl install amqp
