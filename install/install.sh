#curl -fsSL https://get.docker.com/ | sh
#sudo systemctl enable docker.service
#sudo systemctl start docker
#sudo docker run hello-world

echo docker installed
mkdir -p /docker
mkdir -p /docker/volumes
chmod 775 /docker
chmod 770 /docker/volumes
chown root.docker /docker/volumes
yum -y install system-storage-manager
