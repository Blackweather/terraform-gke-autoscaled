# terraform-gke-autoscaled
This repository contains a Terraform module for a basic GKE cluster with Cluster Autoscaling and a single node pool.

## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| initial\_node\_count | Initial number of nodes in the cluster/node pool | `number` | `1` | no |
| machine\_type | Specifies the machine type used for underlying GCE instances | `string` | `e2-medium` | no |
| max\_node\_count | Specifies the maximum number of nodes in the cluster node pool | `number` | `2` | no |
| min\_node\_count | Specifies the minimum number of nodes in the cluster node pool | `number` | `1` | no |
| project | Specifies GCP project ID | `string` | `""` | yes |
| zone | Specifies GCP zone | `string` | `"us-central1-c"` | no |


