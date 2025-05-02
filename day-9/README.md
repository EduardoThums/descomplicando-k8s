# Kube-Prometheus

Collection of manifests and scripts to provide a fully managed Promotheus stack with alertmanager, prometheus, grafana dashboard, node-exporter, blackbox exporter, kube-state-metrics.

Basically configures a stack to monitor the entiere cluster.

```bash
# Create the namespace and CRDs, and then wait for them to be available before creating the remaining resources
# Note that due to some CRD size we are using kubectl server-side apply feature which is generally available since kubernetes 1.22.
# If you are using previous kubernetes versions this feature may not be available and you would need to use kubectl create instead.
kubectl apply --server-side -f manifests/setup
kubectl wait \
	--for condition=Established \
	--all CustomResourceDefinition \
	--namespace=monitoring
  kubectl apply -f manifests/
```

# Service Monitor

Kind that the Prometheus-stack offers to tell the promotheus to monitor services running in the cluster, given the match labels and the endpoints to looking for. For example given the following ServiceMonitor manifest:

```yaml
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  labels:
    app.kubernetes.io/component: exporter
    app.kubernetes.io/name: node-exporter
    app.kubernetes.io/part-of: kube-prometheus
    app.kubernetes.io/version: 1.9.1
  name: node-exporter
  namespace: monitoring
spec:
  endpoints:
  - bearerTokenFile: /var/run/secrets/kubernetes.io/serviceaccount/token
    interval: 15s
    port: https
    relabelings:
    - action: replace
      regex: (.*)
      replacement: $1
      sourceLabels:
      - __meta_kubernetes_pod_node_name
      targetLabel: instance
    scheme: https
    tlsConfig:
      insecureSkipVerify: true
  jobLabel: app.kubernetes.io/name
  selector:
    matchLabels:
      app.kubernetes.io/component: exporter
      app.kubernetes.io/name: node-exporter
      app.kubernetes.io/part-of: kube-prometheus
```

It tells prometheus to look at the port "https" (configured in the containers.port spec, probably 443) every 15s and scrape the metris from there.

# Documentations

- [prometheus operator](https://prometheus-operator.dev/)
- [kube-prometheus](https://github.com/prometheus-operator/kube-prometheus)
