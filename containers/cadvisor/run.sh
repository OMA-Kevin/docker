docker stop cadvisor
docker rm -f cadvisor
docker run --name cadvisor \
           --privileged \
           -v /run:/run:rw \
           -v /sys:/sys:ro \
           -v /var/lib/docker:/var/lib/docker:ro \
           -e "SERVICE_NAME=cadvisor" \
           -e "SERVICE_TAGS=cadvisor,infra,host,docker,monitor" \
           --restart always \
           -d -p 1010:8080 cadvisor





#           --rm=true \
