#variable "access_key" {}
#variable "secret_key" {}
# Above values are handled by awscli

# Infrastructure variables

variable "region" {
  default = "us-west-2"
}

variable "keypair_name" {
	description = "The name of your pre-made key-pair in Amazon (e.g. david-IAM-keypair )"
}

variable "cluster-name" {
  default = "ilhaan-terraform-eks-demo"
  type    = "string"
}

# Kubernetes Service variables

variable "namespace_name" {
  default = "demo-service"
  type    = "string"
}

variable "nginx_pod_name" {
  default = "nginxpod"
  type    = "string"
}

variable "nginx_pod_image" {
  default = "nginx:latest"
  type    = "string"
}
