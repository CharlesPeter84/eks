# Horizantal Pod Autoscaler
- To scale pods horizantally
- Implemented as K8 API resource and a controller
- Gets metrics from metrics-server
- Dependent on mertic-server so we must first deploy it.
- Deploying hpa.yml cretes the definition for pod autoscaling for the deployment
- Deploy apache ab pod to test it and run the ab command to test the same.

