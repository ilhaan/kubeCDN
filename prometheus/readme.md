# Prometheus Setup 

Run the following for each cluster: 

```
k create -f prometheus-storageclass.yaml 
```

```
helm install -f prometheus-values.yaml stable/prometheus --name prometheus --namespace prometheus
```
