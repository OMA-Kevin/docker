
#firewall-cmd --zone=public --add-port=8765/tcp --permanent
#firewall-cmd --reload

docker run -i \
           -t \
           --name zoneminder \
           -p 9000:80 \
           -h zoneminder \
           -d zoneminder
docker logs -f zoneminder
#           --device=/dev/video0 \
#           -v /docker/volumes/zoneminder/etc:/etc/zoneminder \
#           -v /docker/volumes/zoneminder/run:/var/run/motion \
#           -v /docker/volumes/zoneminder/data:/var/lib/motion \
#
