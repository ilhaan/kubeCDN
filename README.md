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

After the components above have been installed, clone this repo and proceed to the next section.

## Deploy Clusters
To deploy EKS clusters in multiple regions, follow instructions from [here](./terraform/readme.md).
