build:
	mkdir -p /docker/volumes/motion-prereq
	docker build -t motion-prereq .
clean:
	docker stop motion-prereq
	docker rm --force motion-prereq
	docker rmi -force motion-prereq
