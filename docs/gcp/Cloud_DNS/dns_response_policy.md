## 🛡️ Policy Deployment Engine: `dns_response_policy`

This section provides a concise policy evaluation for the `dns_response_policy` resource in GCP.

Reference: [Terraform Registry – dns_response_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_response_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `response_policy_name` | The user assigned name for this Response Policy, such as `myresponsepolicy`. | true | None | None |
| `description` | The description of the response policy, such as `My new response policy`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### networks Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network_url` | The fully qualified URL of the VPC network to bind to. This should be formatted like `https://www.googleapis.com/compute/v1/projects/{project}/global/networks/{network}` | true | None | None |

### gke_clusters Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `gke_cluster_name` | The resource name of the cluster to bind this ManagedZone to. This should be specified in the format like `projects/*/locations/*/clusters/*` | true | None | None |
