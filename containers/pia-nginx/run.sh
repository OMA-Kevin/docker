docker rm -f pia-nginx
docker run -d --name pia-nginx --restart always -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:rw -p 8008:8008 nginx
docker ps -a 
docker logs -f pia-nginx
