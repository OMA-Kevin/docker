build:
	mkdir -p /docker/volumes/codec
	docker build -t codec .
clean:
	docker stop codec
	docker rm --force codec
	docker rmi -force codec
