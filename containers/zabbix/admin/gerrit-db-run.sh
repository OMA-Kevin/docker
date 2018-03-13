
docker run --name pg-gerrit -p 5432:5432 -e POSTGRES_USER=gerrit -e POSTGRES_PASSWORD=gerrit -e POSTGRES_DB=reviewdb -d postgres


while [ -z "$(docker logs pg-gerrit 2>&1 | grep 'autovacuum launcher started')" ]; do
    echo "Waiting postgres ready."
    sleep 1
done


docker run -i -t  -v /docker/volumes/gerrit:/var/gerrit/review_site --name gerrit --link pg-gerrit:db -p 8080:8080 -p 29418:29418 -d gerrit $1
docker logs -f  gerrit




