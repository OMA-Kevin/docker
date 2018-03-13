
FROM java
MAINTAINER kmhansen, kmhansen@oppd.com

USER root
RUN yum -y install cgit git gitweb httpd curl
ENV JAVA_HOME /usr/java/latest
ENV GERRIT_HOME /var/gerrit
ENV GERRIT_SITE ${GERRIT_HOME}/review_site
ENV GERRIT_WAR ${GERRIT_HOME}/gerrit.war
ENV GERRIT_VERSION 2.11.3
ENV GERRIT_USER gerrit
ENV GERRIT_CONFIG ${GERRIT_SITE}/etc/gerrit.config
ENV GERRIT_WEBURL "http://gerrit"
ENV DATABASE_TYPE postgresql 
ENV AUTH_TYPE LDAP
#ENV LDAP_SERVER 'ldap://sepds03.oppd.oppd-ds.com:3268'
ENV LDAP_USERNAME 'cn=wlaldap,ou=Accounts,dc=oppd,dc=oppd-ds,dc=com'
ENV LDAP_PASSWORD 'www.wla1'
ENV LDAP_ACCOUNTBASE 'ou=Accounts,dc=oppd,dc=oppd-ds,dc=com'
ENV LDAP_ACCOUNTPATTERN '(&(objectClass=person)(sAMAccountName=${username}))'
ENV LDAP_ACCOUNTFULLNAME 'sAMAccountName'
ENV LDAP_GROUPBASE 'ou=Accounts,dc=oppd,dc=oppd-ds,dc=com'
RUN useradd -m -d "$GERRIT_HOME" -u 20000 -U  -s /bin/bash $GERRIT_USER
USER $GERRIT_USER
RUN mkdir -p $GERRIT_SITE
VOLUME $GERRIT_SITE
RUN curl -L https://gerrit-releases.storage.googleapis.com/gerrit-${GERRIT_VERSION}.war -o $GERRIT_WAR
USER gerrit
RUN mkdir -p /var/gerrit/review_site
VOLUME /var/gerrit/review_site

COPY entrypoint.sh /usr/bin/
COPY plugins/*.jar /tmp/
COPY Dockerfile ${GERRIT_HOME}/Dockerfile
USER root
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 8080 29418

