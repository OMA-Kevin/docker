
firewall-cmd --zone=public --add-port=500/udp --permanent
firewall-cmd --zone=public --add-port=4500/udp --permanent
firewall-cmd --reload

sudo docker run -d --privileged -v /var/run/docker.sock:/var/run/docker.sock rancher/agent:v0.8.2 http://xvxax500:9090/v1/scripts/7D73A48C9992C27CF5EC:1446656400000:uR0T4Kfz9AZjvmi8Bxldicols
