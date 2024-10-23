#! /bin/bash
# export AUTH_LDAP_BIND_PASSWORD=******
docker stop master-data-manager
docker rm master-data-manager
docker build -t master-data-manager:1 .
docker run -e DJANGO_ENV=local -e AUTH_LDAP_BIND_PASSWORD=$AUTH_LDAP_BIND_PASSWORD -it --name master-data-manager -d -p 8000:8000 master-data-manager:1
docker logs -f master-data-manager

