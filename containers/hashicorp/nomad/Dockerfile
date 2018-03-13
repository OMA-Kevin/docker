FROM alpine:3.5
ENV NOMAD_VERSION 0.5.5-rc2
RUN apk --update add curl ca-certificates
COPY glibc-2.23-r3.apk /tmp
RUN apk add --allow-untrusted /tmp/glibc-2.23-r3.apk && rm -rf /tmp/glibc-2.23-r3.apk /var/cache/apk/*
#
ADD https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_linux_amd64.zip /tmp/nomad.zip
RUN  cd /bin && unzip /tmp/nomad.zip && chmod +x /bin/nomad && rm /tmp/nomad.zip && mkdir -p /data /config
VOLUME /data
VOLUME /config
EXPOSE 4646 4647 4648
ENTRYPOINT ["/bin/nomad", "agent", "-config=/config"]




