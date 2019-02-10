#!/usr/bin/env bash

# East
kubectl delete -f video-server/videoservice.yaml --kubeconfig=terraform/east-kubeconfig
helm delete grafana --purge --kubeconfig=terraform/east-kubeconfig
helm delete prometheus --purge --kubeconfig=terraform/east-kubeconfig
kubectl delete -f prometheus/prometheus-storageclass.yaml --kubeconfig=terraform/east-kubeconfig
helm delete heapster --purge --kubeconfig=terraform/east-kubeconfig
helm delete mywebserver --purge --kubeconfig=terraform/east-kubeconfig
kubectl delete -f externalDNS/externaldns.yaml --kubeconfig=terraform/east-kubeconfig

# West
kubectl delete -f video-server/videoservice.yaml --kubeconfig=terraform/west-kubeconfig
helm delete grafana --purge --kubeconfig=terraform/west-kubeconfig
helm delete prometheus --purge --kubeconfig=terraform/west-kubeconfig
kubectl delete -f prometheus/prometheus-storageclass.yaml --kubeconfig=terraform/west-kubeconfig
helm delete heapster --purge --kubeconfig=terraform/west-kubeconfig
helm delete mywebserver --purge --kubeconfig=terraform/west-kubeconfig
kubectl delete -f externalDNS/externaldns.yaml --kubeconfig=terraform/west-kubeconfig
