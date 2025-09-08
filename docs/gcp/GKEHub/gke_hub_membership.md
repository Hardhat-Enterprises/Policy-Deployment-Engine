## 🛡️ Policy Deployment Engine: `gke_hub_membership`

This section provides a concise policy evaluation for the `gke_hub_membership` resource in GCP.

Reference: [Terraform Registry – gke_hub_membership](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_hub_membership)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `membership_id` | The client-provided identifier of the membership. | true | None | None |
| `description` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html), Deprecated) The name of this entity type to be displayed on the console. This field is unavailable in v1 of the API. ~> **Warning:** `description` is deprecated and will be removed in a future major release. | false | None | None |
| `labels` | Labels to apply to this membership. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `location` | Location of the membership. The default value is `global`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### endpoint Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `gke_cluster` | If this Membership is a Kubernetes API server hosted on GKE, this is a self link to its GCP resource. Structure is [documented below](#nested_endpoint_gke_cluster). | false | None | None |

### authority Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `issuer` | A JSON Web Token (JWT) issuer URI. `issuer` must start with `https://` and // be a valid with length <2000 characters. For example: `https://container.googleapis.com/v1/projects/my-project/locations/us-west1/clusters/my-cluster`. If the cluster is provisioned with Terraform, this is `"https://container.googleapis.com/v1/${google_container_cluster.my-cluster.id}"`. | true | None | None |

### gke_cluster Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `resource_link` | Self-link of the GCP resource for the GKE cluster. For example: `//container.googleapis.com/projects/my-project/locations/us-west1-a/clusters/my-cluster`. It can be at the most 1000 characters in length. If the cluster is provisioned with Terraform, this can be `"//container.googleapis.com/${google_container_cluster.my-cluster.id}"` or `google_container_cluster.my-cluster.id`. | true | None | None |
