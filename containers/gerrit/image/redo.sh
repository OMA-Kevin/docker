docker stop gerrit
docker rm gerrit
docker rmi gerrit
rm -rf /docker/volumes/gerrit

./build.sh
./run.sh init
