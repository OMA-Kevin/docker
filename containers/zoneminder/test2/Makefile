build:
	mkdir -p /docker/volumes/zoneminder
	docker build -t zoneminder .
clean:
	docker stop zoneminder
	docker rm -f zoneminder
	docker rmi zoneminder
	/usr/local/docker/admin/cleanup.sh
