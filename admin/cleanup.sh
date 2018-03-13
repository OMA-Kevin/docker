echo "Delete old containers" && docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs docker rm

echo "Delete stopped containers" && docker rm -v `docker ps -a -q -f status=exited`

echo "Delete dangling images" && docker rmi $(docker images -q -f dangling=true)

