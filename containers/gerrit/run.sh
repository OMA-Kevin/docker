
docker run -i -t \
           -v /docker/volumes/gerrit:/var/gerrit/review_site \
           --name gerrit \
           -e LDAP_SERVER='ldap://sepds03.oppd.oppd-ds.com:3268' \
           -p 8080:8080 \
           -p 29418:29418 \
           -e "SERVICE_29418_NAME=gerrit-sshd" \
           -e "SERVICE_8080_NAME=gerrit-web" \
           -e "SERVICE_8080_TAGS=git,infra,gerrit,proxy" \
           -d gerrit $1
docker logs -f  gerrit
















#docker run --name pg-gerrit \
#                  -p 5432:5432 \
#                  -e POSTGRES_USER=gerrit \
#                  -e POSTGRES_PASSWORD=gerrit \
#                  -e POSTGRES_DB=reviewdb \
#                  -d postgres
#while [ -z "$(docker logs pg-gerrit 2>&1 | grep 'autovacuum launcher started')" ]; do
#    echo "Waiting postgres ready."
#    sleep 1
#done
#docker run -i \
#           -t \
#           -v /docker/volumes/gerrit:/var/gerrit/review_site \
#           --name gerrit \
#           --link pg-gerrit:db \
#           -p 8080:8080 \
#           -p 29418:29418 \
#           -d gerrit $1
#docker run -i -t  -v /docker/volumes/gerrit:/var/gerrit/review_site --name gerrit -p 8080:8080 -p 29418:29418 -d gerrit $1
#docker logs -f  gerrit




