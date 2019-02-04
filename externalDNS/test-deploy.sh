#!/usr/bin/env bash

set -e

# East
kubectl apply -f testservice.yaml --kubeconfig=../terraform/east-kubeconfig

# West
kubectl apply -f testservice.yaml --kubeconfig=../terraform/west-kubeconfig
