#
# Script to create a k8s cluster using KinD (Kubernetes in Docker), Cilium as the CNI addon and Ingress Nginx.
#
# usage: ./create.sh
set -xe

./delete.sh

echo "Creating kind cluster"
kind create cluster --config cluster.yaml

echo "Installing cilium in the cluster"
helm repo add cilium https://helm.cilium.io/
helm upgrade --install cilium cilium/cilium --version 1.16.4 --namespace kube-system --values cilium-helm-values.yaml

echo "Waiting cilium be ready"
kubectl wait pod --all --for=condition=Ready --namespace=kube-system -l app.kubernetes.io/part-of=cilium --timeout 300s

echo "Installing ingress nginx in the cluster"
kubectl apply -f deploy-ingress-nginx.yaml

echo "Waiting ingress nginx to be ready"
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s
