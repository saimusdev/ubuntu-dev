#!/bin/bash -
IMAGE_NAME="$(jq --raw-output .name id.json)"
# IMAGE_VERSION="$(jq --raw-output .version id.json)"

set -x

docker run -it --rm --user 1000:1000 \
    -v $HOME:/home/host \
    $@ \
    "${IMAGE_NAME}:latest" zsh
