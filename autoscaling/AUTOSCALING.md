# Autoscaling
- noes autoscaling and pods autoscaling

## Cluster Autoscaler tool
- The tools is installed using terraform with helm
- An IAM role is created trusting oidc with necessary permission ot ASG
- A service account is created annotating the IAM role. This is used by the tool.
- It uses ASG's Max and Min limits and only scales with in the range 

## Karpender 
