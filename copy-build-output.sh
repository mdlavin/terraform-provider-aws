#!/bin/sh

OUTPUT_DIR=${VERSION}_patched_${GIT_SHORT_HASH}/linux_amd64
mkdir -p /opt/project/${OUTPUT_DIR}
cp /go/bin/terraform-provider-aws /opt/project/${OUTPUT_DIR}/terraform-provider-aws_$VERSION
cd /opt/project/${OUTPUT_DIR}
sha256sum terraform-provider-aws_$VERSION > SHA256SUMS