docker rm --force ffmpeg
docker run -i \
           -t \
           --name ffmpeg \
           -h ffmpeg \
           -d ffmpeg
docker logs -f ffmpeg

