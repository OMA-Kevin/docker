FROM alpine:latest
MAINTAINER Stephen Packer <steve@stevepacker.com>

RUN apk -U add openrc zoneminder mysql mysql-client php5-fpm php5-pdo_mysql lighttpd bash vlc-libs \
    && rm -rf /var/cache/apk/*


COPY  mysql_setup.sh /mysql_setup.sh

RUN mkdir -p /run/openrc \
    && touch /run/openrc/softlevel && chmod 777 /var/log/zoneminder \
    && mkdir -p /var/log/zoneminder/ /var/run/zoneminder /var/lib/zoneminder \
    && chown -R lighttpd /etc/zm.conf /var/log/zoneminder /var/lib/zoneminder /var/run/zoneminder \
    && touch /var/log/zoneminder/web_php.log /var/log/zoneminder/zmdc.log /var/run/zoneminder/zm.pid \
    && sed -i 's/nobody/lighttpd/' /etc/php5/php-fpm.conf \
    && sed -i 's/apache/lighttpd/' /etc/zm.conf \
    && sed -i 's/ZM_DB_HOST=localhost/ZM_DB_HOST=127.0.0.1/' /etc/zm.conf \
    && sed -i 's/^#   include "mod_cgi.conf"/include "mod_cgi.conf"/' /etc/lighttpd/lighttpd.conf \
    && sed -i 's/^#   include "mod_fastcgi_fpm.conf"/include "mod_fastcgi_fpm.conf"/' /etc/lighttpd/lighttpd.conf \
    && /mysql_setup.sh

COPY entrypoint.sh /entrypoint.sh
CMD  ["/entrypoint.sh"]

