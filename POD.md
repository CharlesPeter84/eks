# Pods

## Limits and Requests
- to set minimum and maximum cpu and memory. Scheluer use this to choose a node to schedule pods.

## NodeSelector and NodeAffinity
- NodeSelector helps to chooose a node using node lables with exact match. With NodeAffinity we can choose nodes with experssions.

## Taints on nodes
- Reserve a node for specific workloads 

## Tolerations on pods
- A toleration allows a pod to be scheduled on a node that has a matching taint.

## Topology Spread Constraints
- Helps to spready the pods across nodes

## Pod Affinity and AntiAffinity
- Pod Affinity allows you to schedule a pod close to other pods (on the same node, same zone, etc.), based on labels.
- Pod AntiAffinity prevents pods from being scheduled near each other.
