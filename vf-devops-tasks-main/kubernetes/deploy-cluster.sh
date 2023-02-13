#!/usr/bin/env bash
set -e
##
## This script builds all necessary images
## and starts the Kuberntes KinD Cluster
##

## pull basic images
docker pull busybox:latest
docker pull nginx:latest

## build vf-k8s docker image
docker build cluster/. \
  --platform=linux/amd64 \
  -t vf-k8s:latest

## start the vf-k8s container
docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --network=host \
  --platform=linux/amd64 \
  vf-k8s:latest

## Copy kubeconfig from control-plane
docker cp vf-control-plane:/etc/kubernetes/admin.conf ./apps/kubeconfig
cp ./apps/kubeconfig ./infra/kubeconfig

## Import basic images to KinD
docker run \
  --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --platform=linux/amd64 \
  --entrypoint="bash" \
  vf-k8s:latest -c "kind load docker-image busybox:latest --name vf && kind load docker-image nginx:latest --name vf"

# Build vf-infra
docker build infra/. \
  --platform=linux/amd64 \
  -t vf-infra:latest

## Setup vf-infra
docker run \
  --rm \
  --net=kind \
  --name=infra \
  --platform=linux/amd64 \
  vf-infra:latest

## Update etc/hosts to access ingress
cat << EOF
###################
### Requesting sudo...
### Updating etc/hosts to access KinD ingress
### Check this request at deploy-apps.sh
###################
EOF

sudo -- bash -c '\
echo "127.0.0.1 prometheus.vf" >> /etc/hosts && \
echo "127.0.0.1 web.vf" >> /etc/hosts \
'

exit