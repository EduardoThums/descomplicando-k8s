# Taints

Taints are like annotations that you apply into a node of the cluster to inform that the node is in maitanence and what should happen with the running pods or new ones that will be schedule to it. For example NoExecute tells k8s to move all the pods to other nodes, NoSchedule tells that from that moment foward no pod should be scheduled (currently running pods are not moved).

# Tolerations

"Tolerate" a taint when exceptional situations are needed. For example when a tain says that no pod should run at the node because its uses a expensive GPU, but then the developer have the permission of the devops team to run pods inside of that node because the application is CPU expensive.

In my opinion tolerations should be use carefully, otherwise every pod will just ignore are taints "just because".

# Affinity

Affinity is a way to specify where the pods are prefered to run based on matching expressions, for example labels in the node.

The affinity can be based in nodes and pods.

# Commands

```bash
# add taint
k taint node descomplicando-k8s-worker1 maitance=true:NoExecution
```