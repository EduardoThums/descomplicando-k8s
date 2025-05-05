# Cert-Manager

Issuer: ask the CA to generate the certificates per namespace
Cluster Issuer: like the Issuer, but enabled for the enteire cluster

When the issuer issue a certificate the cert-manager stores that certificate into the k8s secrets.

Flow:

ingress -> certificate -> certificate request -> order

# Ingress NGINX Controller

## Authentication

```bash
htpasswd -c password foo
k create secret generic --from-file auth=password nginx-ingress-auth
k apply -f nginx-http-ingress.yaml
```

# Commands

```bash
k create secret generic cloudflare-token1 --from-literal=token=<clouflare-api-token>
k apply -f cloudflare-issuer.yaml
k apply -f nginx-https-ingress.yaml
curl https://nginx.iowqoeywqoeysoadyoasdyoasdyasodiyasod.uk
```

# Documentation

- [Cert Manager](https://cert-manager.io/)
