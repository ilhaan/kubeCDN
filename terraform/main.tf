module "west-pipeline" {
  source = "cluster"
  region = "us-west-2"
}

module "east-pipeline" {
  source = "cluster"
  region = "us-east-1"
}
