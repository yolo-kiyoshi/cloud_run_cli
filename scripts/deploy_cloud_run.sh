#!/usr/bin/env bash

set -eu

service=${1:-}
project=${2:-}
image=${3:-}
tag=${4:-latest}

fullname="gcr.io/${project}/${image}:${tag}"

# read param
env=$(cat ./.env  | tr '\n' ',' | sed -e 's/,$/\n/g')
. .param

gcloud run deploy ${service} \
    --image=${fullname} \
    --platform=${PLATFORM} \
    --region=${REGION} \
    --update-env-vars ${env}