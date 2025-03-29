# Service Accounts
- Service accounts are just empty objects and no configurations are involved except IAM roles attached to it by means of annotations
- Roles are attached to Service Accounts using Role Bindinds and you need to use get rolebindins to find out what roles are attached to a service account.

**To get the roles attached to service accounts**
`kubectl get rolebindings -n kube-system -o json | jq '.items[] | select(.subjects[]?.kind=="ServiceAccount" and .subjects[]?.name=="sealed-secrets")'`

