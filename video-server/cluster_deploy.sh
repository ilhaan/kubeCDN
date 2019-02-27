#!/usr/bin/env bash 

set -e 

kubectl apply -f videoservice.yaml --kubeconfig=../terraform/east-kubeconfig

kubectl apply -f videoservice.yaml --kubeconfig=../terraform/west-kubeconfig
