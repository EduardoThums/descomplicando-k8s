# Horizontal Pod Autoscaler (AKA HPA)

Responsible to scale up or down pods horizontally automatically based on the metrics of the working nodes.

Those metrics are available by the the Metrics Server, which must be installed in the k8s cluster through manifests.

To install the metrics-server follow their documentation at https://github.com/kubernetes-sigs/metrics-server.

If you are running inside Kind then you will need to download their manifest and add the flag `--kubelet-insecure-tls` to the containers args to disable the certificate validation. 

# Documentation

- [Horizontal Pod Autoscaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)
- [Configurable scale up/down velocity for HPA](https://github.com/kubernetes/enhancements/blob/master/keps/sig-autoscaling/853-configurable-hpa-scale-velocity/README.md)