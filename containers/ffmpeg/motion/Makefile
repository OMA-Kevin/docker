build:
	mkdir -p /docker/volumes/motion
	docker build -t motion .
clean:
	docker stop motion
	docker rm --force motion
	docker rmi -force motion
