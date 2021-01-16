#!/bin/bash -
IMAGE_NAME="$(jq --raw-output .name id.json)"
IMAGE_VERSION="$(jq --raw-output .version id.json)"
set -x
DOCKER_BUILDKIT=1 \
    docker build . \
    --tag "${IMAGE_NAME}:${IMAGE_VERSION}" \
    --tag "${IMAGE_NAME}:latest"
