firewall-cmd --zone=public --add-port=554/tcp --permanent
firewall-cmd --zone=public --add-port=554/udp --permanent
firewall-cmd --zone=public --add-port=62088/tcp --permanent
firewall-cmd --zone=public --add-port=62088/udp --permanent
firewall-cmd --zone=public --add-port=888/tcp --permanent
firewall-cmd --zone=public --add-port=888/udp --permanent
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --zone=public --add-port=8080/udp --permanent
firewall-cmd --reload
