1. Understand the namespace architecture and how it works

https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/

2. Understand the part of the certificates in the admin.config file and how they interate with the Kube API.

3. What are the default pods that run in the control-plane and in the workers (coredns)

3. Create a kubernetes cluster with kubeadm using KVM sharing the same network. Put everything together with a Ansible script.

4. Configure Secrets with the best pratices recommended by the k8s documentation

5. Take a look at Weave Scope and Flux projects by WeaveWorks

6. Research a way to make deployment dependent of each other, like when a API uses as database (docker compose uses depends_on)

    1. initContainers
    2. readinessProbe
    3. retry-logic at application levle

7. Create a cluster with eksctl at AWS and configure a Ingress Nginx Controller

8. Research about Karpenter to scale nodes in AWS

# Self-managed Kube cluster setupers

- kubeadm (k8s official way)
- kubespray (ansible based)
- kops (og)

# Locally

- minukube
- kind
- k3s

# Tools

- MetalLB

# AddOns

Extend the functionality of k8s in different parts, like CNI, service discovery, infra. See more at https://kubernetes.io/docs/concepts/cluster-administration/addons/