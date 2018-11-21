# This Dockerfile builds on golang:alpine by building Terraform from source
# using the current working directory.
#
# This produces a docker image that contains a working Terraform binary along
# with all of its source code, which is what gets released on hub.docker.com
# as terraform:full. The main releases (terraform:latest, terraform:light and
# the release tags) are lighter images including only the officially-released
# binary from releases.hashicorp.com; these are built instead from
# scripts/docker-release/Dockerfile-release.

FROM golang:1.11-alpine
LABEL maintainer="HashiCorp Terraform Team <terraform@hashicorp.com>"

RUN apk add --update git bash openssh make gcc musl-dev

ENV TF_DEV=true
ENV TF_RELEASE=1

WORKDIR $GOPATH/src/github.com/terraform-providers/terraform-provider-aws
COPY . .
RUN make fmt && make build && make test

WORKDIR $GOPATH
ENTRYPOINT ["terraform"]
