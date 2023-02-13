#!/bin/bash

_NAME="vf"

kind get clusters | grep "$_NAME"

if [[ $? -eq 0 ]]; then
 echo "VF Cluster already created. Skipping..."
 exit 0
else
  kind create cluster --name "$_NAME" --config kind-cluster.yaml
fi
