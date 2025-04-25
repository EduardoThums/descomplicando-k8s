1. Understand the namespace architecture and how it works

https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/

2. Understand the part of the certificates in the admin.config file and how they interate with the Kube API.

3. What are the default pods that run in the control-plane and in the workers (coredns)

3. Create a kubernetes cluster with kubeadm using KVM sharing the same network. Put everything together with a Ansible script.

# Self-managed Kube cluster setupers

- kubeadm (k8s official way)
- kubespray (ansible based)
- kops (og)

# Locally

- minukube
- kind
- k3s