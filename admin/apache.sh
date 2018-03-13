yum -y install httpd
cp ./gerrit.conf /etc/httpd/conf.d
lsof -i :80
systemctl enable httpd
systemctl restart httpd
