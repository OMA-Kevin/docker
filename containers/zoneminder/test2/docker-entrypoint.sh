#!/bin/sh

set -ev

MYSQL_HOST="${MYSQL_HOST:-mariadb}"
MYSQL_USER="${MYSQL_USER:-zm}"
MYSQL_PASSWORD="${MYSQL_PASSWORD:-zm}"
MYSQL_DATABASE="${MYSQL_DATABASE:-zm}"
PHP_TZ="${PHP_TZ:-Europe/Paris}"

echo init zoneminder db
mysql -h${MYSQL_HOST} -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < /usr/share/zoneminder/db/zm_create.sql

echo set php date.timezone
echo "date.timezone = ${PHP_TZ}" > /usr/local/etc/php/conf.d/zm.ini

php-fpm &
PHP_FPM_PID=$#
echo ${PHP_FPM_PID}

nginx
NGINX_PID=$(pidof nginx)
echo ${NGINX_PID}
