##nomad
sudo firewall-cmd --zone=public --add-port=4646/tcp --permanent
sudo firewall-cmd --zone=public --add-port=4647/tcp --permanent
sudo firewall-cmd --zone=public --add-port=4648/tcp --permanent
##vault
sudo firewall-cmd --zone=public --add-port=8200/tcp --permanent
##fabio
sudo firewall-cmd --zone=public --add-port=9998/tcp --permanent
sudo firewall-cmd --zone=public --add-port=9999/tcp --permanent
##consul
sudo firewall-cmd --zone=public --add-port=8300/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8301/tcp --permanent
sudo firewall-cmd --zone=public --add-port=8500/tcp --permanent
sudo firewall-cmd --zone=public --add-port=53/udp --permanent
sudo firewall-cmd --zone=public --add-port=53/tcp --permanent
sudo firewall-cmd --reload
#
