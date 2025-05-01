# Stateful Sets

Ensures that the state of the pods are maintained when a rollout occours for example DNS names, networking settings, persisntent volumes etc.

Also when updates, scalling and rolling happens the order which the pods were created as respected.

Everypod pod created by a stateful set is given a persistent volume.

# Services

A way to expose the IP addresses of the POD internally on the cluster or outiside of it.

The service create EndpointSlices (IP address + Port) that points to the pods IP addresses based on the service selector (label-based matching).

## Cluster IP

Exposes a IP internally in cluster for the other pods to use it. Useful when dealing with frontend, backend applications, where you can define a IP address for a set of pods and declaring as the backend pods.

## NodePort

Bindings a host port (with a specific IP range) to the a port running inside the pod.

## Load Balancer

Used with ServiceProvider specifically for Cloud Providers.

Exposes a port in the load balancer service of the Cloud Provider and points to a set of worker nodes using the NodePort service to bind to a exposed port (lets say 32000). Also obviously behaves like a common load balancer, distributing the traffic between the worker nodes pods.

## Headless

Use a name strategy to connect to the pods in the cluster, instead of the IP address. Used with statefulsets.

curl <pod-host>.<service-name>.<namespace>.svc.cluster.local

## ExternalName

Exposes a external server internally in the cluster, for example my-api.com.br -> my-api.k8s.com (only accessible inside the cluster by the pods).

# Documentation

- [K8s statefulsets](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)
- [Headless Service](https://kubernetes.io/docs/concepts/services-networking/service/#headless-services)
- [StackOverflow question about Headless Service](https://stackoverflow.com/questions/71533293/my-understanding-of-headless-service-in-k8s-and-two-questions-to-verify)
- [ClusterIP vs NodePort vs LoadBalancer](https://kodekloud.com/blog/clusterip-nodeport-loadbalancer/)
- [Defining a service](https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service)

# Commands

```bash
# expose a service, the --target-port are the ports in the endpoints of the exposed service
k expose service nginx --name nginx-np --type NodePort --port 80 --target-port 80
```

# Troubleshooting

## curl: (6) Could not resolve host: web-0.nginx.default.svc.cluster.local


```bash
# 1. Check the hostname of the pod
k exec -it web-0 -- hostname

# 2. Check if the dns lookup works
kubectl run -i --tty --image busybox:1.28 dns-test --restart=Never --rm -- nslookup web-0.nginx
```
