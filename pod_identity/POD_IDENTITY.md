# Pod Identity 
- Advanced method for pods to access AWS recources. 
- Replaces IRSA.
- Pod identity agent add-on must be deployed on the cluster. It is daemonset
- Pod identity association my be created on the cluster
```
aws eks create-pod-identity-association --cluster-name ${EKS_CLUSTER_NAME} \
  --role-arn arn:aws:iam::${AWS_ACCOUNT_ID}:role/${EKS_CLUSTER_NAME}-carts-dynamo \
  --namespace carts --service-account carts
```
- Simplifies deployment as IAM roles can be used on multiple cluster on the same account. 
- Same steps as IRSA but oicd provider not required.
