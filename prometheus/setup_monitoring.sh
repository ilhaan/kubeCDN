#!/usr/bin/env bash

set -e

# East
k create -f prometheus-storageclass.yaml --kubeconfig=../terraform/east-kubeconfig
helm install -f prometheus-values.yaml stable/prometheus --name prometheus --namespace prometheus --kubeconfig=../terraform/east-kubeconfig
helm install -f grafana-values.yaml stable/grafana --name grafana --namespace grafana --kubeconfig=../terraform/east-kubeconfig

# West
k create -f prometheus-storageclass.yaml --kubeconfig=../terraform/west-kubeconfig
helm install -f prometheus-values.yaml stable/prometheus --name prometheus --namespace prometheus --kubeconfig=../terraform/west-kubeconfig
helm install -f grafana-values.yaml stable/grafana --name grafana --namespace grafana --kubeconfig=../terraform/west-kubeconfig
