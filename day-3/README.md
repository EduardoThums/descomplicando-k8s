# Deployment

1. Ensure that will be a number of replicas pods to achieve HA and resiliency
2. Creates a replicateSet
3. Keeps track of the health of the pods to alert the replicateSet to up more pods


## matchLabels

Tells the deployment to take care of the pods matching the specificed labels. It's important to set the same labels in the template.metadata defined in the manifest. 

## deploy strategies

1. RollingUpdate: updates the pods in a steady way, respecting the configure max surge and unavailable limits
2. Recreate: drops and recreates all the pods at the same time

# Commands

```bash
# describe a deployment
k describe nginx-deployment

# list all pods filtering by a label in the default namespace
k get pods -l foo=bar -n default

# create a deployment from dry-run
k create deployment my-dep --image nginx --replicas 3 -o yaml --dry-run=client > client-template.yaml

# list the status of the replicaset rollout
k -n giropops rollout status 

# list the events of the replicateset
k -n giropops events --for replicaset/my-dep-7fcd74cdb6 --watch


# check if the deploymet stats is paused DeploymentPaused
k describe deployment 

# resume a deployment (important for production environments)
k rollout resume deployment my-dep

# recreate the deployment rollout
k rollout restart deployment my-dep

# manually scale up or down
k scale deployment my-dep --replicas 3
```
