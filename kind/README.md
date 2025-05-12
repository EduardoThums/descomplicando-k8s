# O que é o kind?

Kind ou Kubernetes IN Docker é uma ferramenta que permite criar clusters de Kubernetes localmente.

# Instalando o kind

Siga o tutorial da documentação oficial: https://kind.sigs.k8s.io/docs/user/quick-start/#installation

# Criando um cluster

```bash
kind create cluster --config cluster.yaml
```

# Listando os clusters

```bash
kind get clusters
```

# Deletando um cluster

```bash
kind delete cluster --name kind-cluster
```