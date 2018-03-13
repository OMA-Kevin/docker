#firewall-cmd --zone=public --permanent --add-service=ssh
#firewall-cmd --zone=public --list-services
#firewall-cmd --zone=public --add-service=ssh --permanent
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --zone=public --add-port=8008/tcp --permanent
firewall-cmd --zone=public --add-port=9091/tcp --permanent
firewall-cmd --zone=public --add-port=9092/tcp --permanent
firewall-cmd --reload
