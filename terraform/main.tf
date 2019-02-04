module "west-pipeline" {
  source               = "cluster"
  region               = "us-west-2"
  externaldnspolicyarn = "${aws_iam_policy.external-dns-policy.arn}"
}

module "east-pipeline" {
  source               = "cluster"
  region               = "us-east-1"
  externaldnspolicyarn = "${aws_iam_policy.external-dns-policy.arn}"
}

# Add policy for ExternalDNS
/* This is here since policies are not region specific on AWS (they are under
   "Global" region on AWS Console). Adding the policy creation here prevents
   the policy from being created multiple times by modules running in different
   regions.
*/

/* Specify AWS region for policy creation to prevent user prompt after apply.
   Without this, user is prompted to enter region despite policies being
   listed under "Global". This behavior was observed in Terraform v0.11.11
   and provider.aws v1.57.0.
*/
provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_policy" "external-dns-policy" {
  name        = "K8sExternalDNSPolicy"
  path        = "/"
  description = "Allows EKS nodes to modify Route53 to support ExternalDNS."

  policy = <<POLICY
{
		"Version": "2012-10-17",
		"Statement": [
				{
						"Effect": "Allow",
						"Action": [
								"route53:ListHostedZones",
								"route53:ListResourceRecordSets"
						],
						"Resource": ["*"]
				},
				{
						"Effect": "Allow",
						"Action": [
								"route53:ChangeResourceRecordSets"
						],
						"Resource": ["*"]
				}
		]
}
POLICY
}
