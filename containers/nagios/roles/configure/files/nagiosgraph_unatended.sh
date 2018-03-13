!#/bin/bash

export NG_LAYOUT=overlay
export NG_PREFIX=/usr/local/nagios
export NG_VAR_DIR=/usr/local/nagios/var
export NG_LOG_DIR=/usr/local/nagios/var
export NG_MODIFY_NAGIOS_CONFIG=y
export NG_NAGIOS_CONFIG_FILE=/usr/local/nagios/etc/nagios.cfg
export NG_NAGIOS_COMMANDS_FILE=/usr/local/nagios/etc/objects-extra/00-Graph-Commands.cfg
export NG_MODIFY_APACHE_CONFIG=y
export NG_APACHE_CONFIG_DIR=/etc/$1/conf.d

echo '' > /usr/local/nagios/etc/objects-extra/00-Graph-Commands.cfg
./install.pl
