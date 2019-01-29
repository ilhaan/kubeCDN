#
# Cluster Infrastructure Variables
#

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
