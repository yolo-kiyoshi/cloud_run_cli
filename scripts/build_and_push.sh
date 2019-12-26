#!/usr/bin/env bash

set -eu

project=${1:-}
image=${2:-}
tag=${3:-latest}

fullname="gcr.io/${project}/${image}:${tag}"

# read setting file
docker build -t ${image}:${tag} .
docker tag ${image}:${tag} ${fullname}
docker push ${fullname}
echo "image successfully pushed to: ${fullname}"