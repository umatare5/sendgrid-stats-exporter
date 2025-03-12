# sendgrid_exporter

A Helm chart for [chatwork/sendgrid_exporter](https://github.com/chatwork/sendgrid_exporter).

## Installing the Chart

### Local

```
$ helm install --set 'secret.apiKey=secret' --set 'secret.username=username' sendgrid_exporter ./
or
$ helm install -f examples/override.yaml sendgrid_exporter ./
```

### Remote

[helm-git](https://github.com/aslafy-z/helm-git) plugin is required.

```
$ helm repo add sendgrid_exporter 'git+https://github.com/chatwork/sendgrid_exporter@charts?ref=0.0.8'
$ helm install -f examples/override.yaml sendgrid_exporter
```

### Test

```
$ kubectl get svc
NAME                      TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
sendgrid_exporter   ClusterIP   10.108.179.32   <none>        9154/TCP   2m54s

$ kubectl run -it --rm=true busybox --image=yauritux/busybox-curl --restart=Never
/home # curl 10.108.179.32:9154/-/healthy
OK
```

## Configuration

The following table lists the configurable parameters of the sendgrid_exporter chart and their default values.

| Parameter                                    | Description                                        | Default                                          |
| -------------------------------------------- | -------------------------------------------------- | ------------------------------------------------ |
| `replicaCount`                               | Number of replicas                                 | `1`                                              |
| `image.repository`                           | Image repository                                   | `"chatwork/sendgrid_exporter"`                   |
| `image.pullPolicy`                           | Image pull policy                                  | `"IfNotPresent"`                                 |
| `image.tag`                                  | Image tag                                          | `"0.0.3"`                                        |
| `imagePullSecrets`                           | Image pull secret                                  | `[]`                                             |
| `nameOverride`                               | Override the name of the chart                     | `""`                                             |
| `fullnameOverride`                           | Override the full-name of the chart                | `""`                                             |
| `serviceAccount.create`                      | If true, create a new service account              | `true`                                           |
| `serviceAccount.annotations`                 | Annotations for serviceAccount                     | `{}`                                             |
| `serviceAccount.name`                        | Name of the service account                        | `""`                                             |
| `podAnnotations`                             | Annotations for the pod                            | `{}`                                             |
| `podSecurityContext`                         | Security context for the pod                       | `{}`                                             |
| `securityContext`                            | Security context for container                     | `{}`                                             |
| `envFrom`                                    | Extra custom environment variables from ConfigMaps | `[]`                                             |
| `extraEnv`                                   | Pod extra environment value                        | `[]`                                             |
| `secret.apiKey`                              | SendGrid api token                                 | `{}`                                             |
| `secret.username`                            | SendGrid username                                  | `[]`                                             |
| `service.type`                               | Service Type                                       | `"ClusterIP"`                                    |
| `service.port`                               | Service port                                       | `9154`                                           |
| `ingress.enabled`                            | If true, enable Ingress                            | `false`                                          |
| `ingress.annotations`                        | Annotations for ingress                            | `{}`                                             |
| `ingress.hosts`                              | Ingress accepted hostnames                         | `[{"host": "chart-example.local", "paths": []}]` |
| `ingress.tls`                                | Ingress TLS configuration                          | `[]`                                             |
| `resources.limits.cpu`                       |                                                    | `"200m"`                                         |
| `resources.limits.memory`                    |                                                    | `"256Mi"`                                        |
| `resources.requests.cpu`                     |                                                    | `"100m"`                                         |
| `resources.requests.memory`                  |                                                    | `"128Mi"`                                        |
| `autoscaling.enabled`                        | If true, enable auto-scaling                       | `false`                                          |
| `autoscaling.minReplicas`                    |                                                    | `1`                                              |
| `autoscaling.maxReplicas`                    |                                                    | `5`                                              |
| `autoscaling.targetCPUUtilizationPercentage` |                                                    | `80`                                             |
| `nodeSelector`                               | Node labels for pod assignment                     | `{}`                                             |
| `tolerations`                                | Add tolerations                                    | `[]`                                             |
| `affinity`                                   | Node/Pod affinities                                | `{}`                                             |

---

_Documentation generated by [Frigate](https://frigate.readthedocs.io)._
