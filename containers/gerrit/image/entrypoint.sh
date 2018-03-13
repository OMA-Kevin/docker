#!/bin/bash
set -e
echo ENTRYPOINT
env | grep -v COLOR | sort

build_config() {
    git config -f "/var/gerrit/review_site/etc/gerrit.config" gerrit.canonicalWebUrl "$GERRIT_WEBURL"
    git config -f "/var/gerrit/review_site/etc/gerrit.config" auth.type "$AUTH_TYPE"
    git config -f "/var/gerrit/review_site/etc/gerrit.config" auth.gitBasicAuth "true"
    git config -f "/var/gerrit/review_site/etc/gerrit.config" ldap.server "$LDAP_SERVER"
    git config -f "/var/gerrit/review_site/etc/gerrit.config" ldap.accountBase "$LDAP_ACCOUNTBASE"
    git config -f "/var/gerrit/review_site/etc/gerrit.config" \
        ldap.accountPattern "$LDAP_ACCOUNTPATTERN"
    git config -f "/var/gerrit/review_site/etc/gerrit.config" ldap.accountFullName "$LDAP_ACCOUNTFULLNAME"
    git config -f "/var/gerrit/review_site/etc/gerrit.config" ldap.accountEmailAddress "mail"
    git config -f "/var/gerrit/review_site/etc/gerrit.config" \
        ldap.username "$LDAP_USERNAME"
    git config -f "/var/gerrit/review_site/etc/gerrit.config" ldap.password "$LDAP_PASSWORD"
    git config -f "/var/gerrit/review_site/etc/gerrit.config" ldap.groupBase "$LDAP_GROUPBASE"
    git config -f "/var/gerrit/review_site/etc/gerrit.config" container.heapLimit "2048m"
    git config -f "/var/gerrit/review_site/etc/gerrit.config" container.javaHome "$JAVA_HOME"
    git config -f "/var/gerrit/review_site/etc/gerrit.config" container.javaOptions ""
    git config -f "/var/gerrit/review_site/etc/gerrit.config" sendemail.enable "false"
    git config -f "/var/gerrit/review_site/etc/gerrit.config" sendemail.smtpServer "localhost"
    git config -f "/var/gerrit/review_site/etc/gerrit.config" plugins.allowRemoteAdmin "true"
    git config -f "/var/gerrit/review_site/etc/gerrit.config" gitweb.cgi "/var/www/git/gitweb.cgi"
    git config -f "/var/gerrit/review_site/etc/gerrit.config" httpd.listenUrl "proxy-http://*:8080"
#    git config -f "/var/gerrit/review_site/etc/gerrit.config" theme.backgroundColor "002b36"
#    git config -f "/var/gerrit/review_site/etc/gerrit.config" theme.topMenuColor "002b36"
#    git config -f "/var/gerrit/review_site/etc/gerrit.config" theme.textColor "839496"
#    git config -f "/var/gerrit/review_site/etc/gerrit.config" theme.trimColor "EEEEEE"
#    git config -f "/var/gerrit/review_site/etc/gerrit.config" theme.tableOddRowColor "FFFFFF"
#    git config -f "/var/gerrit/review_site/etc/gerrit.config" theme.tableEvenRowColor "FFFF99"
#    git config -f "/var/gerrit/review_site/etc/gerrit.config" theme.selectionColor "586e75"
    

}
   

init_gerrit() {
if [ ! -f /var/gerrit/review_site/etc/gerrit.init ]
then
    echo "Gerrit logs directory is empty" && echo attempting to initialize gerrit
    java -jar "${GERRIT_WAR}" init --batch --no-auto-start -d "${GERRIT_SITE}"
    build_config
    cp /tmp/*.jar /var/gerrit/review_site/plugins/ && rm /tmp/*.jar && chown gerrit /var/gerrit/review_site/plugins -R
    git clone https://github.com/mlmeyers/gerrit_theme_blue.git /tmp/gerrit_theme_blue
#    cp /tmp/gerrit_theme_blue/static/* /var/gerrit/review_site/static/
#    cp /tmp/gerrit_theme_blue/etc/* /var/gerrit/review_site/etc/
    date > /var/gerrit/review_site/etc/gerrit.init
else
    echo "else"
    config=$(cat /var/gerrit/review_site/etc/gerrit.config /var/gerrit/review_site/etc/gerrit.init)
    echo "Gerrit Configuration:"
    echo "$config"
fi
run_gerrit
}

run_gerrit() {
    echo attempting to start gerrit
    exec /var/gerrit/review_site/bin/gerrit.sh daemon -d /var/gerrit/review_site
}

if [ "$1" == 'init' ]; then
   init_gerrit

elif [ "$1" == '' ]; then
   build_config
   run_gerrit

else
   echo /bin/bash
fi

exec "$@"

