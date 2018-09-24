#!/bin/sh

docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"

docker tag sioworkers "liquidpl/sioworkers:latest"
docker push liquidpl/sioworkers:latest
