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

```
kubeseal --format=yaml < secrets_local.yaml > sealed_secret.yaml --controller-name=sealed-secrets  
kubectl applyf -f sealed_secret.yaml  
```

- To update secret value getch the secret, update the value convert it and deploy it. Remove the secret file.  
```
kubectl get secrets -n cptest secret1 -o yaml > update_secret.yaml  
kubeseal --format=yaml < update_secret.yaml > sealed_secret.yaml --controller-name=sealed-secrets`  
kubect apply -f sealed_secret.yaml  
rm -f update_secret.yaml  
```

- Backup, Restore secret sealed master key
  - Master key is generated when the controller first started and stored in a secret named sealed-secrets-key
  - The key seem to be loaded into memory on the controller
  - When we apply sealed-secret it seem to create the secret object and whenever secret is deleted it gets created again immediately 
  - To test the scenario of deleting master key, first delete the master key secret, redeploy the controller pod, delete the secret object and deploy app pod to make sure it is failing.
  - To restore simply apply the master key secret object that we backed up.

```
kubectl get secret -n kube-system sealed-secrets-keyt6wpb -o yaml > /tmp/master_sealing_key.yaml
kubectl delete secret -n kube-system -l sealedsecrets.bitnami.com/sealed-secrets-key
kubectl rollout restart deployment sealed-secrets -n kube-system
kubectl logs deployment/sealed-secrets -n kube-system
kubectl delete secret -n cptest secret1
kubectl describe pods -n cptest pod3
kubectl apply -f /tmp/master_sealing_key.yaml

```

