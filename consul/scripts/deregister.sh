#doc https://www.consul.io/api/agent/service.html
# last portion is the ID field from ls-services.sh of service to deregister

curl \
    --request PUT \
    http://192.168.1.120:8500/v1/agent/service/deregister/registrator:consul:53:udp

