# kubeCDN: Route53 Setup 

[Route53](https://aws.amazon.com/route53/) is a DNS web service from AWS. kubeCDN uses Route53 to route users to servers with lower latency. 

Route53 setup will take place on AWS Console. The decision to carry this out on AWS Console was made since Route53 can be setup in many different ways and AWS Console was determined to be the best way to expose all options to the user. Future versions of kubeCDN should include an automated Route53 setup mechanism. 

## Setup Instructions 
1. Log in to AWS Console and follow instructions [here](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/CreatingHostedZone.html) to create a public hosted zone. 
2. Once you have created a public hosted zone for your domain, proceed to setup ExteranlDNS. 

## Resources 
* If you would like to use a subdomain on Route53 without migrating the parent domain, [this](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/CreatingNewSubdomain.html) is a useful guide from AWS. 

