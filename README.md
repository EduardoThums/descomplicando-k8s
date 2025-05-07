# Descomplicando K8s

- [Day 1](./day-1/k8s/README.md)
- [Day 2](./day-2/README.md)
- [Day 3](./day-3/README.md)
- [Day 4](./day-4/README.md)
- [Day 5](./day-5/README.md)
- [Day 6](./day-6/README.md)
- [Day 7](./day-7/README.md)
- [Day 8](./day-8/README.md)
- [Day 9](./day-9/README.md)
- [Day 10](./day-10/README.md)
- [Day 11](./day-11/README.md)
- [Day 12](./day-12/README.md)
- [Day 13](./day-13/README.md)

# Useful commands

```bash
# watch pods with a specific label
k get pods --watch -l app=nginx

# opens a shell to a utils pod
kubectl run -i --tty --image busybox:1.28 dns-test --restart=Never --rm

# view the documentation of a object
k explain Ingress
```

# Useful tools

- [apko: Build OCI images from APK packages directly without Dockerfile ](https://github.com/chainguard-dev/apko)
- [eksctl: create a EKS cluster at AWS from cli](https://eksctl.io/)
- [Cosign: Utilizado para assinatura e verificação de imagens de contêiner.]()
- [Kyverno: Utilizado para políticas de segurança no Kubernetes.]()
- [APKO: Utilizado para construção de imagens de contêiner.]()
- [Melange: Utilizado para construção de pacotes.]()
- [Helm: Utilizado para gerenciamento de pacotes Kubernetes.]()
- [Hadolint: Utilizado para verificação de qualidade de Dockerfiles.]()
- [Docker Scout: Utilizado para verificação de vulnerabilidades em imagens de contêiner.]()
- [Snyk: Utilizado para verificação de vulnerabilidades em dependências de aplicativos.]()
- [Trivy: Utilizado para verificação de vulnerabilidades em imagens de contêiner.]()
- [CodeRabbit: Utilizado para revisão de código.]()
- [DependaBot: Utilizado para manter as dependências atualizadas.]()
- [Popeye: Utilizado para verificação de configurações de cluster Kubernetes.]()
