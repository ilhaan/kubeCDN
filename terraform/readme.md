# kubeCDN: Deploy Clusters

Follow instructions below to setup clusters in multiple regions.

Please note that by default this repo sets up clustesr in the `us-west-2` and `us-east-1` AWS regions. This can changed or extended by editing the [`main.tf`](./main.tf) file located in this directory before proceeding to the instructions below.

## Instructions
1. Make sure you are in the `terraform` repo
2. Run: `terraform init`
3. Create a file named `terraform.tfvars` and insert the following. Read more about AWS Keypairs [here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
```
keypair_name="<enter-your-aws-keypair-name-here-without-extensions>"
```
4. Run: `terraform apply -auto-approve`. This process takes about 15 minutes to setup two regions.
5. After the terraform process above has completed, run `./setup.sh `. This script performs the following tasks:
  * Generates `kubedconfig` files for each deployment region. `kubeconfig` files are used to connect to different clusters for service deployments and other tasks.
  * Generates and applies config map to each cluster.
  * Install Kubernetes dashboard.
  * Install `helm`
  * Install heapster using `helm` to enable graphs in Kubernetes Dashboard

After running the steps above, your current directory should contain `*-kubeconfig` files for each region. These files will be used by other scripts and components of the kubeCDN project for various setup and deployment procedures. Do not delete these files or move them to a different location. Doing so will prevent you from running subsequent instructions successfully.

## Connect to Kubernetes Dashboard
Following are instructions to connect to the [Kubernetes Dashboard](https://github.com/kubernetes/dashboard) (installed in steps shown above):

1. Set your `KUBECONFIG` environment variable to point to the `kubeconfig` file of the cluster you would like to connect to (`kubeconfig` files are generated in step 5 of the instructions section). For example, if you are in the `terraform/` directory and you would like to connect to the cluster deployed to the west coast:
```
export KUBECONFIG=$(PWD)/west-kubeconfig
```
2. Generate and copy dashboard access code to your clipboard (example below is specific to macOS, Linux systems should use `xclip` instead of `pbcopy`):
```
aws-iam-authenticator token -i <ENTER-YOUR-CLUSTER-NAME> --token-only | pbcopy
```
3. Set up proxy connection to cluster:
```
kubectl proxy &
```
4. Navigate to the following URL to view dashboard:
http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/

## References
* https://github.com/ilhaan/terraform-test
* https://github.com/christopherhein/terraform-eks
* https://eksworkshop.com/
