```bash
# listar os deplosments do namespace kube-system
kubectl get deployments --namespace kube-system

# detalhar o deployment coredns
kubectl describe deployments coredns --namespace kube-system

# detalhar o replicaset coredns
kubectl describe rs coredns-668d6bf9bc --namespace kube-system

# list nodes
kubectl get nodes

# criar pode
k run --image nginx meu-pod-nginx

# expor pod
k expose pode/meu-pod-nginx --type=NodePort --port 80

# listar services
k get services -o wide

# acessar o service rodando no pod atrave do IP do node
k get pods -o wide --field-selector spec.nodeName=meu-cluster-worker2
k get nodes -o wide

curl -vs http://<node-ip>:<exposed-port>

# utilizar iac para criar a infra
k run --image nginx --port 80 --dry-run=client -o pod.yaml
k apply -f pod.yaml
```
