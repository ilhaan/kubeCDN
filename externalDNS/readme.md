# kubeCDN: ExternalDNS Setup

Follow instructions below to setup and test ExternalDNS. Make sure to add IAM role as described in references section before following steps below.  

1. Update `--domain-filter` argument in `externaldns.yaml` and then run:
```./install-externaldns.sh```
2. If you would like to deploy an Nginx webserver as a test service, update `annotations` in `testservice.yaml` and run: 
```./test-deploy.sh```
3. Route 53 should have an updated DNS record for the service deployed above. However, **note** that only one of the regions will have an A record set on Route 53. It seems that ExternalDNS cannot set multiple records of the same type (multiple A records with different aliases).


## Notes:
* ExternalDNS is not currently capable of setting routing policies as per [this](https://github.com/kubernetes-incubator/external-dns/issues/571). Due to this, latency based routing will have to be manually set on AWS Console.

## References:
* [Here](https://github.com/kubernetes-incubator/external-dns/blob/master/docs/tutorials/aws.md) is a guide that walks through how to setup ExternalDNS with AWS. Specifically, use this guide to setup the correct IAM permissions on your account. 
* [Another](https://www.phillipsj.net/posts/aws-eks-and-kubernetes-external-dns) helpful guide to setup ExternalDNS with AWS EKS. 
