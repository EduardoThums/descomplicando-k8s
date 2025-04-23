# ReplicaSet

Responsible for ensuring that the number of replicas are equal to the specified in the manifest. A replicaset is always created when creating a deployment.

If changes are made related to the version of the pod (image, limits, name), a new replicaset is created and the pods are migrated from the previous replicaset to the new one.

The number of replicasets still maintained from previous revisions is controlled by the specs.revisionHistoryLimit variable.

If only the number of replicas are changed in the manifest then the current rs is only update.

# DaemonSet

Responsible for create a pod that will running exactly on each node of the cluster, for example a prometheus exporter, datahog, kube-proxy.

**specs.hostNetwork**: if `true` removes the k8s network layer of the pod, exposing for example the interfaces of the hosting machine. It will use the newtwork layer of the hosting machine.

# Probes

Configure "healthchecks" to check if the pods are running as expected, if they are live, if the tests are passing.

## LivenessProbe

Check if the container inside the pod is running as expected, listening at a specific port, responding to a HTTP method or executing a command inside the container and checking the exit status

```yaml
    # check HTTP method
    livenessProbe:
        httpGet:
            path: /foo
            port: 8080
        initialDelaySeconds: 10
        periodSeconds: 5
        timeoutSeconds: 2
        failureThreshold: 3
    
    # check listening port
    livenessProbe:
        tcpSocket:
            port: 8080
        initialDelaySeconds: 10
        periodSeconds: 5
        timeoutSeconds: 2
        failureThreshold: 3

    # run a command
    livenessProbe:
        exec:
            command:
                - cat
                - /tmp/healthy
        initialDelaySeconds: 10
        periodSeconds: 5
        timeoutSeconds: 2
        failureThreshold: 3
```

## ReadinessProbe

Check if the container is ready to accept connections, and if not it removes the container from the endpoint load balancer (service) of the pod.

The difference from the livenessProbe its that the liveness check if the container in alive and healthy, and the readiness only checks if the container is responding.

## StartupProbe

Checks at the start of the container life if everything has loaded up and the configurations are ok. It runs only once, so the `periodSeconds` is not valid here.

```yaml
    startupProbe:
        exec:
            command:
                - service
                - nginx
                - status
        initialDelaySeconds: 5
        timeoutSeconds: 5
        failureThreshold: 3
```

**CrashLoopBackOff**: something bad happened at the launching of the container pod that only restarting the container didn't solve.

# Commands

```bash
# list all pods and the images used in the container
kubectl get pods -o=jsonpath='{range .items[*]}{"\n"}{.metadata.name}{"\t"}{range .spec.containers[*]}{.image}{"\t"}{end}{end}'

# list where the pods are running in the cluster
k get pods -o jsonpath='{range .items[*]}{"\n"}{.spec.nodeName}'

# list all daemonsets
k get ds
k describe ds nginx-exporter-daemonset
```