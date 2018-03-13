[root@host pritunl]# firewall-cmd --zone=public --add-port=2020/tcp --permanent
success
[root@host pritunl]# firewall-cmd --zone=public --add-port=2020/udp --permanent
success
[root@host pritunl]# firewall-cmd --reload
success
[root@host pritunl]# 

