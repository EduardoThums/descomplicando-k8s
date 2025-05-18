# Helm

Package manager in k8s for complex applications, like cilium, ingress nignx, istio. etc

## Components

- chart: unify a set of templates to deploy a application
- release
- template

# Commands

```bash
helm package ./charts/you-chart
helm repo index ./ --url https://foo.bar
helm repo add you-repo https://foo.bar
# list charts in the repo
helm search repo you-repo
```