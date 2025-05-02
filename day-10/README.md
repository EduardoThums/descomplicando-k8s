# Pod Monitor

Monitor pods when the Service Monitor doesn't fit because the application does not need a service to exposed, for example instead of a api or webserver running in the pod we have a rabbitmq or kafka. For more details see [PodMonitor vs ServiceMonitor what is the difference? #3119](https://github.com/prometheus-operator/prometheus-operator/issues/3119)

# Prometheus Rules

Creates rules in the Prometheus Alerts that fires to the AlertManager service.
