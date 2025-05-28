# Istio

O istio é um service mesh que age interceptando o trafego do cluster, aplicando regras de segurança, circuit breakers, retries, logs, monitoring, etc.

As microserivces grown then becomes more dificult to manage those features at each application level, Istio abstracts that and handles it at networking level, leaving the teams only to care about what really matters: the code itself.

There are 2 main components in Istio architecture: Control-Plane and Data Plane

1. Control-plane: received the  configurations of the service mesh and passes it down to the data plane, managed by the **istiod**

2. Data plane: responsible to apply those rules in the cluster.

A data plane can be deployed either in side-car mode (one container injected on each pod called Envoy Proxie) or in ambient mode, where a service called Ztunnel will be deployed at each node or namespace (its the newest way aiming to reduce the maintaince of having one container on each pod).


## Gateway

Controll the trafic ingress and egress of the cluster.

Exposes the cluster to listen do different hosts and ports.

## VirtualService

Define routing rules like blue-green deployment, canary releases, rolling updated, etc. and how the traffic will be routes to the internal services in the cluster.

Verifies from which gateway the traffic is coming from and bases on a set of rules, redirects that traffic to another service.

## DestinationRule

Define connection behaviours like retries, circuit breaks, timeouts, TLS.

