# RBAC

Restrict access to resources in the cluster based on roles. It applies to users and service accounts.

- Role: what it can access
- RoleBiding -> bind the role to a user/service account (like the pv claim)

Role: valid only in the created cluster
ClusterRole: valid in all the cluster

# Authencation types

- tokens -> applications
- certificates -> users

# Contexts and users

A context is generally references to a cluster and a user credentials.

A user can be in differentes contexts referencing different cluster.

# ServiceAccount

By default every pod that is created uses a default service account. **system:serviceaccount:default:default**

The recommended way today to create service a service account token is to use the `TokeRequest` see more at: https://kubernetes.io/docs/concepts/configuration/secret/#serviceaccount-token-secrets

# Commands
```bash
# 1. create a private key using openssl
openssl genrsa -out developer.key 2048

# 2. create a certificate signing request
openssl req -new -key developer.key -out developer.csr -subj "/CN=developer"

# 3. create a k8s object CertificateSigningRequest with the csr content file
cat developer.csr | base64 -w 0
k apply -f csr.yaml

# 4. list the csr
k get csr

# 5. approve the csr
k certificate approve developer-csr

# 6. extract the generated certificate from the csr object with jsonpath
k get csr developer-csr -o jsonpath='{.status.certificate}' | base64 -d > developer.crt

# 7. create the role and bindings

# 8. set the credentials of the user developer in the kubeconfig
 k config set-credentials developer --client-certificate developer.crt --client-key developer.key --embed-certs=true

# 9. change change kubectl context
k config set-context hello

# 10. check what the user can do
k auth can-i --list
```