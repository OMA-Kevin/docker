build:
	mkdir -p /docker/volumes/pa_server
	docker build -t pa_server .
clean:
	docker rm --force pa_server
	docker rmi --force pa_server
	rm -rf /docker/volumes/pa_server
