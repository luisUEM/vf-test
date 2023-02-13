#!/bin/bash

##
## This file is executed as an entrypoint
## for the Dockerfile.
## The Dockerfile is used inside setup.sh
##

## Add helm repositories
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts && \
  helm repo update

## Deploy Nginx
kubectl apply --filename https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s

## Deploy Prometheus
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring --create-namespace --values ./values/prometheus.yaml

cat << EOF
###################
### Infra install completed
###################
EOF