#!/usr/bin/env bash

set -e

# East Setup
terraform output -module=east-pipeline kubeconfig > east-kubeconfig
export KUBECONFIG=$(PWD)/east-kubeconfig
echo $KUBECONFIG
terraform output -module=east-pipeline config-map-aws-auth > east-config-map-aws-auth.yaml
kubectl apply -f east-config-map-aws-auth.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml
kubectl apply -f helm_rbac.yaml
helm init --service-account tiller
# Install heapster to display graphics on Kubernetes dashboard
helm install --name heapster --namespace kube-system stable/heapster

# West Setup
terraform output -module=west-pipeline kubeconfig > west-kubeconfig
export KUBECONFIG=$(PWD)/west-kubeconfig
echo $KUBECONFIG
terraform output -module=west-pipeline config-map-aws-auth > west-config-map-aws-auth.yaml
kubectl apply -f west-config-map-aws-auth.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml
kubectl apply -f helm_rbac.yaml
helm init --service-account tiller
# Install heapster to display graphics on Kubernetes dashboard
helm install --name heapster --namespace kube-system stable/heapster
