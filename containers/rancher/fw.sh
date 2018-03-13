firewall-cmd --zone=public --add-port=500/udp --permanent
firewall-cmd --zone=public --add-port=4500/udp --permanent
firewall-cmd --zone=public --add-port=1111/tcp --permanent
firewall-cmd --reload

