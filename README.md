<img src="images/kubeCDN_logo.png" width="100">

# kubeCDN
A self-hosted content delivery network based on Kubernetes. Easily setup Kubernetes clusters in multiple AWS regions and deploy resilient and reliable services to a global user base within minutes.

This project was developed by [Ilhaan Rasheed](https://www.ilhaan.com) during his tenure as a DevOps Engineering Fellow at [Insight](https://www.insightdevops.com/). The capabilities of this project have been demonstrated using video streaming as an example. Ilhaan's presentation slides with a short demo is available [here](https://www.ilhaan.com/slides).

----

# Instructions

## Getting Started
Before deploying your self-hosted CDN using kubeCDN, you will need the following:

* AWS account and credentials with appropriate permissions to setup EC2 instances, VPCs and EKS clusters. All documentation and software components of this project assumes that [`awscli`](https://aws.amazon.com/cli/) is being used to manage AWS credentials.
* Install Terraform. This project was developed using Terraform v0.11.11.
* Install `kubectl` v1.13.2 or higher.
* Install `helm` v2.12.3 or higher. On macOS, you can install helm using `brew install kubernetes-helm`.
* Install [`aws-iam-authenticator`](https://github.com/kubernetes-sigs/aws-iam-authenticator)

After the components above have been installed, clone this repo and proceed to the next section.

## Deploy Clusters & Service
1. Deploy Clusters
	* To deploy EKS clusters in multiple regions, follow instructions from [here](./terraform/readme.md).
2. Setup Route53
	* Instructions to setup Route53 can be found [here](./route53/readme.md). 
3. Install ExternalDNS
 	* Follow instructions [here](./externalDNS/readme.md).
4. Install Monitoring tools
  	* Install Prometheus and Grafana by following instructions [here](./monitoring/readme.md).
5. Deploy Demo Video Server
  	* To demonstrate kubeCDN, a simple Nginx based RTMP streaming server was created. Follow instructions [here](./video-server/readme.md) for more information on this server and for deploy instructions.

## Teardown 
Follow these instructions to teardown all deployed services and infrastructure. 

1. First, all services that have been deployed need to be removed. There is a script in the root directory of this repo that performs this task. Run it using: 
```
./services_teardown.sh
```
2. The second teardown step is to remove all infrastructure that was setup in step 1 of the section above. This can be done by navigating to the `terrform` directory and running the following: 
```
terraform destroy -auto-approve 
```
This process takes about 15 minutes to complete with two regions. 
3. After successful run of the previous step, all infrastructure associated with kubeCDN should have been torn down. Verify this on AWS Console in order to avoid accidental charges on your account. 
