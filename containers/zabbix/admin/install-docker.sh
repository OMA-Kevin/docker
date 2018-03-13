#docker-install.sh
echo "adding zabbix user" && useradd -m -d /home/zabbix -u 20001 -U  -s /bin/bash zabbix
sudo yum -y install docker
systemctl start docker
systemctl enable docker
groupadd docker
chown root:docker /var/run/docker.sock
usermod -a -G docker x8693
usermod -a -G zabbix x8693
usermod -a -G docker zabbix

#fix permissions
mkdir -p /docker
mkdir -p /docker/volumes
mkdir -p /docker/volumes/zabbix
chmod 775 /docker
chmod 770 /docker/volumes
chmod 750 /docker/volumes/zabbix
chown root.docker /docker
chown root.docker /docker/volumes
chown zabbix.zabbix /docker/volumes/zabbix
