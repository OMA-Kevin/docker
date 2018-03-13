build:
	mkdir -p /docker/volumes/ffmpeg
	docker build -t ffmpeg .
clean:
	docker stop ffmpeg
	docker rm --force ffmpeg
	docker rmi -force ffmpeg
