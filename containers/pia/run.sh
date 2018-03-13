
export login="p0214593"
export password="Kehansen01"
export dns="209.222.18.222\n209.222.18.218"
docker run --privileged  -d \
           --name pia \
           --dns=209.222.18.222 \
           --restart always \
           -v /docker/volumes/pia/:/data \
           -e "OPENVPN_PROVIDER=PIA" \
           -e "OPENVPN_CONFIG=Netherlands" \
           -e "OPENVPN_USERNAME=$login" \
           -e "OPENVPN_PASSWORD=$password" \
           -e "RESOLVE_OVERRIDE=$password" \
           -p 9091:9091 \
           pia-docker

