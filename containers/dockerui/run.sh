docker stop docker-ui
docker rm -f docker-ui

docker run -d \
           --privileged \
           --restart always \
           --name docker-ui \
           -v /var/run/docker.sock:/var/run/docker.sock \
           -p 9000:9000 \
           -e "SERVICE_NAME=docker-ui" \
           -e "SERVICE_TAGS=infra,docker,http:9000" \
           dockerui/dockerui

docker logs -f docker-ui

