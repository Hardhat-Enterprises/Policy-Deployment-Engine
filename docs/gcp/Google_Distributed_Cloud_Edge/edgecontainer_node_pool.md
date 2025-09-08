## 🛡️ Policy Deployment Engine: `edgecontainer_node_pool`

This section provides a concise policy evaluation for the `edgecontainer_node_pool` resource in GCP.

Reference: [Terraform Registry – edgecontainer_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/edgecontainer_node_pool)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `node_location` | Name of the Google Distributed Cloud Edge zone where this node pool will be created. For example: `us-central1-edge-customer-a`. | true | None | None |
| `node_count` | The number of nodes in the pool. | true | None | None |
| `name` | The resource name of the node pool. | true | None | None |
| `location` | The location of the resource. | true | None | None |
| `cluster` | The name of the target Distributed Cloud Edge Cluster. | true | None | None |
| `labels` | Labels associated with this resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `machine_filter` | Only machines matching this filter will be allowed to join the node pool. The filtering language accepts strings like "name=<name>", and is documented in more detail in [AIP-160](https://google.aip.dev/160). | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### local_disk_encryption Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key` | The Cloud KMS CryptoKey e.g. projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey} to use for protecting node local disks. If not specified, a Google-managed key will be used instead. | false | None | None |
| `kms_key_active_version` | (Output) The Cloud KMS CryptoKeyVersion currently in use for protecting node local disks. Only applicable if kmsKey is set. | none | None | None |
| `kms_key_state` | (Output) Availability of the Cloud KMS CryptoKey. If not KEY_AVAILABLE, then nodes may go offline as they cannot access their local data. This can be caused by a lack of permissions to use the key, or if the key is disabled or deleted. | none | None | None |

### node_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `labels` | "The Kubernetes node labels" | false | None | None |
