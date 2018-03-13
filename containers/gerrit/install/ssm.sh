#!/bin/bash

mkdir -p /docker
mkdir -p /docker/volumes
mkdir -p /docker/volumes/gerrit

chmod 775 /docker
chmod 770 /docker/volumes
chmod 750 /docker/volumes/gerrit
chown root.docker /docker/volumes
chown gerrit.gerrit /docker/volumes/gerrit

yum -y install system-storage-manager
ssm create -s 20000M -n pool --fstype xfs -p docker /dev/sdb /docker
ssm list volumes

grep -q '/docker' '/etc/fstab' || echo "/dev/docker/pool /docker                       xfs     defaults        0 0"


