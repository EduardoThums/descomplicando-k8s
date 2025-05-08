# Kyverno

Kyverno is a policy k8s operator that ensures a set of policies are followed in the cluster. For exemplo no container running as a root user, images must be from the private registry, every pod must have resources limits, every namespace must have a specific label.

Enfore: wont tolerate a policy break
Audit: will warn you that you are breaking a policy, but will allow it

## Anchors

Condition processing when validating rules, for example: only validates if is running as root if the securityContext tag is specified:

```yaml
- =(securityContext):
    runAsNonRoot: false
```

See more at https://release-1-11-0.kyverno.io/docs/writing-policies/validate/#patterns


# Commands

```bash
# check if the rules are being applied
k describe ClusterPolicy yourpolicy
```
