#
# Cluster Infrastructure Variables
#

variable "region" {
  description = "AWS region to launch servers"
}

variable "cluster-name" {
  type = "map"

  default = {
    "us-east-1" = "kubundancy-east"
    "us-west-2" = "kubundancy-west"
  }
}
