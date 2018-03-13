sudo groupadd -g 1000 jenkins
sudo mkdir -p /docker/data/jenkins/var /docker/data/nexus3
sudo chown -R svc_unix.jenkins /docker/data/jenkins
sudo chmod -R 775 /docker/data/jenkins
sudo mkdir nexus3
sudo firewall-cmd --zone=public --add-port=2375/tcp --permanent
sudo firewall-cmd --zone=public --add-port=5000/tcp --permanent
sudo firewall-cmd --zone=public --add-port=5001/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8082/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --zone=public --add-port=50000/tcp --permanent
sudo firewall-cmd --reload

