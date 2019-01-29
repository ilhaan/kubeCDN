# Kubernetes Cluster Setup 

## Run Instructions
1. Use terraform to deploy cluster infrastructure:  
```
terraform apply -auto-approve 
```
2. Run the `setup.sh` script to connect `kubectl` to the above deployed cluster. Note that this script needs to be run as commands in the current shell, as opposed to running in a child process.
```
. ./setup.sh 
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

## TODO 
* Describe what is being deployed in this directory
* Move `terraform output *` commands to tf scripts as [local-exec provisioner](https://www.terraform.io/docs/provisioners/local-exec.html). This way `setup.sh` will solely be used to apply config maps to cluster and setup workstation connection to cluster, making the script idempotent. 
