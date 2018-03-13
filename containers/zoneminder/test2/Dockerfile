FROM php:7-fpm-alpine
MAINTAINER Benoît Vidis <contact@benoitvidis.com>

RUN  apk update \
  && docker-php-ext-install \
    pdo \
    pdo_mysql \
  && apk add --no-cache --virtual zm \
    gettext \
    nginx \
    mariadb-client \
    zoneminder \
  # zoneminder installs php5
  # we don't need it if it works with php7
  && apk del \
    php5 \
    php5-cli \
    php5-pdo \
    php5-pdo_mysql \
    php5-sockets \
  && mkdir -p /run/nginx \
  && chown -R nginx:nginx \
    /usr/share/webapps/zoneminder \
    /var/log/zoneminder \
  && chgrp nginx /etc/zm.conf \
  && chmod 0660 /etc/zm.conf

COPY etc/nginx/nginx.conf /etc/nginx/nginx.conf
COPY etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY etc/zm.conf /etc/
COPY etc/php7/php-fpm.d/www.conf /etc/php7/php-fpm.d/
COPY docker-entrypoint.sh /

CMD exec tail -f /dev/null
