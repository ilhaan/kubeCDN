# Kubernetes Cluster Setup 

## Run Instructions
1. Use terraform to deploy cluster infrastructure:  
```
terraform apply -auto-approve 
```
2. Run the `setup.sh` script to connect `kubectl` to the above deployed cluster: 
```
./setup.sh 
```
3. Copy dashboard access code to clipboard: 
```
aws-iam-authenticator token -i <ENTER-YOUR-CLUSTER-NAME> --token-only | pbcopy
```
4. Set up proxy connection to cluster: 
```
kubectl proxy &
```
5. Navigate to the following URL to view the dashboard: 
http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/ 
