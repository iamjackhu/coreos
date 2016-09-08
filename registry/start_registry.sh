#!/bin/bash

docker load -i registry

docker run -d -p 5000:5000  --restart=always --name registry \
  -v `pwd`/data:/var/lib/registry \
  -v `pwd`/auth:/auth \
  -v `pwd`/config.yml:/etc/docker/registry/config.yml \
  -e "REGISTRY_AUTH=htpasswd" \
  -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \
  -e REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd \
  registry
