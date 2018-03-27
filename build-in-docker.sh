#!/bin/bash

set -e

VERSION=$1
if [ -z "$VERSION" ]; then
  echo "Provide the Terraform provider version number as an argument"
  exit -1
fi

IMAGE_NAME=terraform-provider-aws-build
docker -D build -t $IMAGE_NAME .
docker run -v $(pwd):/opt/project -e VERSION=${VERSION} -e GIT_SHORT_HASH=$(git rev-parse --short HEAD) --entrypoint /bin/ash $IMAGE_NAME /opt/project/copy-build-output.sh
