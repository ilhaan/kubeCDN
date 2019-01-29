# AWS EKS using Terraform

**This dir is under development**

This is a test repo that has not been organized as per best practices. Makeshift instructions shown below.

## Instructions
1. Make sure `awscli` is configured, keypair is stored in `~/.ssh/` and keypair name to `terraform.tfvafs` (refer to [`README`](../README.md) from the root dir of this repo).
1. ```terraform init```
1. ```terraform apply -auto-approve```
After running the above, k8s components (namespace, pod & service) will not be deployed since `kubeconfig` and AWS Auth steps need to be completed before these can be run.
1. ```terraform output kubeconfig > kubeconfig```
1. ```export KUBECONFIG=$(PWD)/kubeconfig ```
1. ```terraform output config-map-aws-auth > config-map-aws-auth.yaml```
1. ```kubectl apply -f config-map-aws-auth.yaml```
1. ```terraform plan``` - You should see 3 services that need to be added
1. ```terraform apply -auto-approve```
1, k8s components should now be deployed
1. Deploy dashboard: ```kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml```
1. Copy access token for dashboard to clipboard: ```aws-iam-authenticator token -i <ENTER-YOUR-CLUSTER-NAME> --token-only | pbcopy```
1. Run: `kubectl proxy` (background this process if you'd like).  
1. Navigate to http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/, select "Token" and paste to login.

### Help Setup 
`helm` install instructions below are based on instructions [here](https://eksworkshop.com/helm_root/). 
1. Install [`helm`](https://helm.sh/) on your local machine before proceeding to install on your cluster. 
1. Run: `kubectl apply -f rbac.yaml `
1. `helm init --service-account tiller`
  * Verify server install using `helm version`
1. Install bitnami/nginx: `helm install --name mywebserver bitnami/nginx`
  * Inspect deployment object: `kubectl describe deployment mywebserver-nginx`
  * Verify pod deployment: `kubectl get pods -l app=mywebserver-nginx`
  * Get external IP for service: `kubectl get service mywebserver-nginx -o wide`
1. Run: `kubectl proxy` (background this process if you'd like).  
1. Navigate to http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/, select "Token" and paste to login. 
1. Setup `helm` based on instructions [here](https://eksworkshop.com/helm_root/)
