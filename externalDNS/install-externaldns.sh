#!/usr/bin/env bash

set -e

# East
kubectl apply -f externaldns.yaml --kubeconfig=../terraform/east-kubeconfig

# West
kubectl apply -f externaldns.yaml --kubeconfig=../terraform/west-kubeconfig
