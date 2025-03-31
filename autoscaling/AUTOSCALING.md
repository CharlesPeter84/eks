# Autoscaling
- noes autoscaling and pods autoscaling

## Cluster Autoscaler tool
- The tool is installed using terraform with helm
- An IAM role is created trusting oidc with necessary permission ot ASG
- A service account is created annotating the IAM role. This is used by the tool.
- It uses ASG's Max and Min limits and only scales with in the range
- When cpu/memory is not requested in pod specification, it deploys any no of containers but they contest for the cpu
- When cpu load is high, autoscaler scales in new nodes when Best-Effort pods are in pending state
- When cpu/memory is requested, host's cpu/memory is reserved for pod and it will scale in new nodes for all pods to be scheduled though they are not in use. 
- This also evicts Best-Efforts but scales in new nodes so when new nodes are ready the Best-Effort pods are scheduled again

### Cluster Over Provisioning
- Deploy global default and pause container priority classes
- Deploy a pause container with max memory allocatable on instances. This always keeps an instance ready for app deployment
- Deploy app containers and monitor pods. This first evicts pause cotainers and then deploy app containers. Then the pending pause container triggers scale in operation.

## Karpender 
