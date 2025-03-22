# eks

## Secrets Management
### With secrets object
- Exposing secrets as environment variables
- Exposing secrets as volumes

###Sealed Secrets
- Deployed using help chart and runs as deployment
- A private key is generated and stored in a secret named sealed-secret-key which is very important to be backed up

**To create a sealed secret which can be stored in repositories** 
- Create a secret object yaml file  
- Using kubeseal convert it into sealed-secret and then apply it. kubeseal fetch the public key from controller and encrypt the secrets  

`kubeseal --format=yaml < secrets_local.yaml > sealed_secret.yaml --controller-name=sealed-secrets`  
`kubectl applyf -f sealed_secret.yaml`  

- To update secret value getch the secret, update the value convert it and deploy it. Remove the secret file.  

`kubectl get secrets -n cptest secret1 -o yaml > update_secret.yaml`  
`kubeseal --format=yaml < update_secret.yaml > sealed_secret.yaml --controller-name=sealed-secrets`  
`kubect apply -f sealed_secret.yaml`  
`rm -f update_secret.yaml`  




## Service Accounts
- Service accounts are just empty objects and no configurations are involved except IAM roles attached to it by means of annotations
- Roles are attached to Service Accounts using Role Bindinds and you need to use get rolebindins to find out what roles are attached to a service account.

**To get the roles attached to service accounts**   
`kubectl get rolebindings -n kube-system -o json | jq '.items[] | select(.subjects[]?.kind=="ServiceAccount" and .subjects[]?.name=="sealed-secrets")'`

## Roles
K8 roles defined with the details of permissions allowed. 
