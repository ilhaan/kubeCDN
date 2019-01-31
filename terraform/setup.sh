#!/usr/bin/env bash 

set -e 

# Generate kubeconfig file 
terraform output kubeconfig > kubeconfig 

# Set env variable for kubectl access 
export KUBECONFIG=$(PWD)/kubeconfig 

# Generate aws auth config map 
terraform output config-map-aws-auth > config-map-aws-auth.yaml

# Apply aws auth config map 
kubectl apply -f config-map-aws-auth.yaml

# Deploy Kubernetes dashboard 
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml
