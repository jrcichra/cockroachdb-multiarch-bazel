#!/bin/bash
set -x

# env vars
export SHA="sha-${SHA::7}"
# pull the containers
docker pull ghcr.io/jrcichra/cockroach-linux:${SHA}
docker pull ghcr.io/jrcichra/cockroach-linuxarm:${SHA}

#https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/

# update the current sha on the base image
docker manifest create ghcr.io/jrcichra/tira_backend:${SHA} \
    --amend ghcr.io/jrcichra/cockroach-linux:${SHA} \
    --amend ghcr.io/jrcichra/cockroach-linuxarm:${SHA}
docker manifest push ghcr.io/jrcichra/cockroach:${SHA}

# if main branch, update the latest tag on the base image
if [ "$BRANCH_NAME" == "main" ] || [ "$BRANCH_NAME" == "master" ]; then
    docker manifest create ghcr.io/jrcichra/cockroach:latest \
        --amend ghcr.io/jrcichra/cockroach-linux:${SHA} \
        --amend ghcr.io/jrcichra/cockroach-linuxarm:${SHA}
    docker manifest push ghcr.io/jrcichra/cockroach:latest
fi