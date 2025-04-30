# Secrets

Stored in base64 into the cluster.

By default everyone who has access to the cluster can access the secrets.

Is recommended to implement security solutions like RBAC (Roled-Based Access Control) and Encryption at Rest of the secrets to hardening the cluster.

## External Secrets Operator

External operators that handles the secrets for k8s for example HashiVault, Azure Key Vault, AWS Secrets Manager.

# ConfigMaps

Stores configurations for the containers, perfect to pass to the container config files like nginx.conf.

# Commands

```bash
# create a generic secrets
k create secret generic --from-env-file secrets.txt my-secret

# foward a port running into a container/pod/service locally
k port-foward services/nginx-https 4443:443
```

# Documentation

- [Configure docker secrets](https://kubernetes.io/docs/concepts/configuration/secret/#docker-config-secrets)