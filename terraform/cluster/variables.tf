#
# Cluster Infrastructure Variables
#

variable "region" {
  description = "AWS region to launch servers"
}

variable "cluster-name" {
  default = "kubundancy"
  type    = "string"
}
