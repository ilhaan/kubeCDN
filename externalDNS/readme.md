# kubeCDN: ExternalDNS Setup

Follow instructions below to setup and test ExternalDNS. Make sure to add IAM role as described in the [References](#references) section before following steps below. Also, read the limitations of ExternalDNS [here](#limitations).

1. Update `--domain-filter` argument in `externaldns.yaml` and then run:
```
./install-externaldns.sh
```
2. If you would like to deploy an Nginx webserver as a test service, update `annotations` in `testservice.yaml` and run: 
```
./test-deploy.sh
```
3. Route 53 should have an updated DNS record for the service deployed above.

## Limitations:
Following are some limitations with ExternalDNS at the time of writing: 
* ExternalDNS is not currently capable of setting routing policies as per [this](https://github.com/kubernetes-incubator/external-dns/issues/571). Due to this limitation, latency based routing will have to be manually set on AWS Console.
* When deploying to multiple regions, note that only one region will have an A record set on Route53. It seems that ExternalDNS cannot set multiple records of the same type (multiple A records with different aliases). This limitation was overcome by manually setting A records using AWS console. This issue will need to be revisited in the future. Refer to [this](https://github.com/kubernetes-incubator/external-dns/issues/270) for more info. 

## References:
* [Here](https://github.com/kubernetes-incubator/external-dns/blob/master/docs/tutorials/aws.md) is a guide that walks through how to setup ExternalDNS with AWS. Specifically, use this guide to setup the correct IAM permissions on your account. 
* [Another](https://www.phillipsj.net/posts/aws-eks-and-kubernetes-external-dns) helpful guide to setup ExternalDNS with AWS EKS. 
