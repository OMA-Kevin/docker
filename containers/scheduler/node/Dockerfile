FROM pa_server
RUN echo "http://dl-6.alpinelinux.org/alpine/edge/community" > /etc/apk/repositories 

RUN apk --update add ca-certificates curl docker openssl && rm -rf /var/cache/apk/*
ENV DOCKER_COMPOSE_VERSION 1.5.1
RUN wget -qO- https://get.docker.com/ | sh

# Install Docker Compose
RUN ["/bin/bash", "-c", "curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"]
RUN ["/bin/bash", "-c", "chmod +x /usr/local/bin/docker-compose"]

### VOLUMES
VOLUME /var/lib/docker

ADD container-start-script.sh /
RUN ["/bin/bash", "-c", "chmod +x /container-start-script.sh"]
#ENTRYPOINT ["bash"]
ENTRYPOINT ["/container-start-script.sh", "-Dproactive.useIPaddress=true"]
