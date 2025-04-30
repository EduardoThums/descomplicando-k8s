# Descomplicando K8s

- [Day 1](./day-1/k8s/README.md)
- [Day 2](./day-2/README.md)
- [Day 3](./day-3/README.md)
- [Day 4](./day-4/README.md)
- [Day 5](./day-5/README.md)
- [Day 6](./day-6/README.md)
- [Day 7](./day-7/README.md)
- [Day 8](./day-8/README.md)

# Useful commands

```bash
# watch pods with a specific label
k get pods --watch -l app=nginx

# opens a shell to a utils pod
kubectl run -i --tty --image busybox:1.28 dns-test --restart=Never --rm
```