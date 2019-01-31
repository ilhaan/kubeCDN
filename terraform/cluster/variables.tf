#
# Cluster Infrastructure Variables
#

variable "region" {
  description = "AWS region to launch servers"
}

variable "keypair_name" {
  description = "The name of your pre-made key-pair in Amazon (e.g. david-IAM-keypair )"
}

variable "cluster-name" {
  default = "ilhaan-terraform-eks-demo"
  type    = "string"
}
