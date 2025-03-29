# IAM Roles for Service Accounts
For the pods to access AWS resources like S3 buckets, DynamoDB tables etc..

- Pods on private VPC must have a VPN Private link created for the services
- And IAM role with policies to allow access to AWS services. Where to manage the resource is TBD
- The AWS resource must already been created. Where to manage the resource is TBD
- IAM OIDC Identity Provider must be create. Done as part of cluster deployment
- IAM OIDC Identity Provider must be associated with the cluster
- A S3 bucket and IAM role with oidc provider as trusted principle is created manually for this test
- Create a service account and associatethe IAM role with annotations



