# Networking Policies

By defualt the CNI allows all the pods to communicate with each other, but sometimes we don't want that, for that purpose we can use **Networking Policies** to create rules that tells the CNI which pods can communicate with each other by specifying ingress and egress rules;

Networking policies are still not implemented by all of the CNIs, to check if your cluster has networking policies available by the CNI use this command: `k api-versions| grep -i networking`, if it returns `networking.k8s.io/v1` then you have networking policies enabled.

To check which CNI is installed in the node look at the folder `/etc/cni/net.d/`, for weave-net it will look something like this:

```json
// 10-weave.conflist
{
    "cniVersion": "0.3.0",
    "name": "weave",
    "plugins": [
        {
            "name": "weave",
            "type": "weave-net",
            "hairpinMode": true
        },
        {
            "type": "portmap",
            "capabilities": {"portMappings": true},
            "snat": true
        }
    ]
}
```

In the ingress mode the netpol only block access to the selected pods when the client accessing the pods are outside the same namespace.

# eksctl

Create a cluster configuration file from the cli

```bash
eksctl create cluster --dry-run --managed --region us-east-1 --node-type t3.medium --name pick --version 1.32 --nodes 2 --nodes-min 1 --nodes-max 3 --nodegroup-name pick-group > eksctl.yaml

eksctl create cluster -f eksctl.yaml
```

Add the CNI from AWS in the cluster, the version of the cluster must correspond the the AWS documentation at https://docs.aws.amazon.com/eks/latest/userguide/managing-vpc-cni.html#vpc-cni-latest-available-version

```bash
eksctl create addon --name vpc-cni --version v1.19.2-eksbuild.5 --cluster eks-cluster --force
```
