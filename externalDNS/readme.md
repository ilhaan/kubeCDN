# kubeCDN: ExternalDNS Setup

Follow instructions below to setup and test ExternalDNS. Make sure to add IAM role as described in references section before following steps below.  

1. Update `--domain-filter` argument in `externaldns.yaml` and then run:
```./install-externaldns.sh```
2. Similarly, update `annotations` in `testservice.yaml` and run: 
```kubectl apply -f testservice.yaml```
```./test-deploy.sh```
3. Route 53 should have an updated DNS record for the service deployed above. However, **note** that only one of the regions will have an A record set on Route 53. It seems that ExternalDNS cannot set multiple records of the same type (multiple A records with different aliases).


## Notes:
* ExternalDNS is not currently capable of setting routing policies as per [this](https://github.com/kubernetes-incubator/external-dns/issues/571). Due to this, latency based routing will have to be manually set on AWS Console.

## References:
* https://github.com/kubernetes-incubator/external-dns/blob/master/docs/tutorials/aws.md
* https://www.phillipsj.net/posts/aws-eks-and-kubernetes-external-dns
