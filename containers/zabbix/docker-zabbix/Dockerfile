FROM java
MAINTAINER kmhansen, kmhansen@oppd.com




RUN yum install -y http://repo.zabbix.com/zabbix/2.4/rhel/7/x86_64/zabbix-release-2.4-1.el7.noarch.rpm
RUN yum makecache
RUN yum -y -q install \
              monit \
              nmap  \
              traceroute \
              wget  \
              sudo

RUN yum -y -q install \
              net-snmp-devel  \
              net-snmp-libs   \
              net-snmp        \
              net-snmp-perl   \
              net-snmp-python \
              net-snmp-utils


RUN yum -y -q install \
              mysql \
              mysql-server


RUN yum -y -q install \
              httpd \
              php \
              php-mysql \
              php-snmp  \
              php-ldap

RUN yum -y -q install zabbix-agent  \
              zabbix-get            \
              zabbix-java-gateway   \
              zabbix-sender         \
              zabbix-server         \
              zabbix-server-mysql   \
              zabbix-web            \
              zabbix-web-mysql      \
              zabbix22-dbfiles-mysql


RUN yum clean all && rm -rf /tmp/*
COPY ./mysql/my.cnf /etc/mysql/conf.d/my.cnf
RUN wget http://mysqltuner.pl -O /usr/local/bin/mysqltuner.pl
RUN chmod 755 /usr/local/bin/mysqltuner.pl
COPY ./sudoers.d/    /etc/sudoers.d/

COPY ./zabbix/zabbix.ini 				        /etc/php.d/zabbix.ini
COPY ./zabbix/httpd_zabbix.conf  		    /etc/httpd/conf.d/zabbix.conf
COPY ./zabbix/zabbix.conf.php    		    /etc/zabbix/web/zabbix.conf.php
COPY ./zabbix/zabbix_agentd.conf 		    /etc/zabbix/zabbix_agentd.conf
COPY ./zabbix/zabbix_java_gateway.conf 	/etc/zabbix/zabbix_java_gateway.conf
COPY ./zabbix/zabbix_server.conf 		    /etc/zabbix/zabbix_server.conf

RUN chmod 640 /etc/zabbix/zabbix_server.conf
RUN chown root:zabbix /etc/zabbix/zabbix_server.conf

# Monit
ADD ./monitrc /etc/monitrc
RUN chmod 600 /etc/monitrc

# https://github.com/dotcloud/docker/issues/1240#issuecomment-21807183
RUN echo "NETWORKING=yes" > /etc/sysconfig/network

# Add the script that will start the repo.
ADD ./scripts/entrypoint.sh /bin/docker-zabbix
RUN chmod 755 /bin/docker-zabbix

# Expose the Ports used by
# * Zabbix services
# * Apache with Zabbix UI
# * Monit
EXPOSE 10051 10052 80 2812

VOLUME ["/var/lib/mysql", "/usr/lib/zabbix/alertscripts", "/usr/lib/zabbix/externalscripts", "/etc/zabbix/zabbix_agentd.d"]

ENTRYPOINT ["/bin/docker-zabbix"]
CMD ["run"]
