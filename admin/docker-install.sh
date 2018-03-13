#http://docs.docker.com/installation/fedora/#fedora-21-and-later-installation
#http://docs.docker.com/installation/fedora/#starting-the-docker-daemon
sudo yum -y install docker
sudo yum -y update docker
systemctl start docker
systemctl enable docker
groupadd docker
chown root:docker /var/run/docker.sock
usermod -a -G docker x8693
#docker run -i -t fedora /bin/bash

