PATH=$PATH:.

#firewall.sh
firewall-cmd --get-default-zone
firewall-cmd --get-active-zones
firewall-cmd --zone=public --add-port=8080/tcp
firewall-cmd --zone=public --add-port=29418/tcp
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --reload

#docker-install.sh
echo "adding gerrit user" && useradd -m -d /var/gerrit -u 20000 -U  -s /bin/bash gerrit
sudo yum -y install docker
systemctl start docker
systemctl enable docker
groupadd docker
chown root:docker /var/run/docker.sock
usermod -a -G docker gerrit

#fix permissions
mkdir -p /docker
mkdir -p /docker/volumes
mkdir -p /docker/volumes/gerrit
chmod 775 /docker
chmod 770 /docker/volumes
chmod 750 /docker/volumes/gerrit
chown root.docker /docker/volumes
chown gerrit.gerrit /docker/volumes/gerrit

yum -y install system-storage-manager
ssm create -s 20000M -n pool --fstype xfs -p docker /dev/sdb /docker &&  echo "/dev/mapper/docker-pool  /docker   xfs     defaults        0 0"  >> /etc/fstab
ssm list volumes

cd .. && ln -s install/run.sh run.sh
cd .. && cp ./run.sh /usr/local/bin/run-gerrit.sh


