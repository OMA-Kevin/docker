# groupmod -g 25000 kodi
# usermod -u 25000 -g 25000 kodi
#useradd kodi -g 25000 -u 25000 kodi
mkdir -p /docker/volumes/kodi
mkdir -p /docker/volumes/kodi/config
docker create --name=kodi -v /etc/localtime:/etc/localtime:ro -v /docker/volumes/kodi/config:/config/.kodi -e PGID=25000 -e PUID=25000 -e VERSION=15 -e TZ=CST6CDT -p 28080:8080 -p 29777:9777 kodi

