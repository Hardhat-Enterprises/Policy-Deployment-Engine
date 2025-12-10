## 🛡️ Policy Deployment Engine: `edgecontainer_node_pool`

This section provides a concise policy evaluation for the `edgecontainer_node_pool` resource in GCP.

Reference: [Terraform Registry – edgecontainer_node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/edgecontainer_node_pool)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `node_location` | Name of the Google Distributed Cloud Edge zone where this node pool will be created. For example: `us-central1-edge-customer-a`. | true | true | Node location determines the physical and geographical placement of nodes, impacting data residency, latency, and compliance with regional regulations. | us-central1-edge-customer-a (approved zone) | Unapproved or restricted edge zones |
| `node_count` | The number of nodes in the pool. | true | true | Proper node count ensures adequate capacity for workloads while avoiding resource overprovisioning that could increase attack surface. | 3 (appropriate for workload requirements) | 1 (single point of failure) or excessive nodes beyond requirements |
| `name` | The resource name of the node pool. | true | false | Node pool name is an identifier and doesn't directly impact security. | None | None |
| `location` | The location of the resource. | true | true | Location selection impacts data residency, compliance with regional regulations, and disaster recovery capabilities. | australia-southeast1 | Unapproved or restricted regions |
| `cluster` | The name of the target Distributed Cloud Edge Cluster. | true | true | Cluster association ensures nodes are deployed to the correct, authorized cluster with proper security controls. | proper-cluster-name | Unauthorized or incorrect cluster reference |
| `labels` | Labels associated with this resource. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | true | Proper labeling ensures node pools can be properly identified, tracked, and managed according to organizational policies and security requirements. | Contains required labels: environment, team, cost-center | Missing required labels or using non-standard label names |
| `machine_filter` | Only machines matching this filter will be allowed to join the node pool. The filtering language accepts strings like "name=<name>", and is documented in more detail in [AIP-160](https://google.aip.dev/160). | false | true | Machine filters ensure nodes run only on approved, properly configured hardware with adequate security controls and compliance certifications. | name=approved-machine-pattern* | Overly permissive filters or missing filters allowing unapproved hardware |
| `local_disk_encryption` | Local disk encryption options. This field is only used when enabling CMEK support. | false | true | Local disk encryption protects sensitive data at rest on node storage and should use customer-managed keys for enhanced security control. | Properly configured customer-managed encryption | Missing encryption or using default Google-managed keys when CMEK is required |
| `node_config` | Configuration for each node in the NodePool. | false | true | Node configuration impacts security posture, resource allocation, and isolation between workloads. | Properly configured node settings with security labels | Misconfigured or insecure node settings |
| `project` | If it is not provided, the provider project is used. | false | true | Project selection impacts resource isolation, billing accountability, and access control boundaries. | Proper project reference | Incorrect or unauthorized project |

### local_disk_encryption Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kms_key` | The Cloud KMS CryptoKey e.g. projects/{project}/locations/{location}/keyRings/{keyRing}/cryptoKeys/{cryptoKey} to use for protecting node local disks. If not specified, a Google-managed key will be used instead. | false | true | Customer-managed keys provide better control over encryption policies, access controls, and key rotation procedures. | projects/my-project/locations/us-central1/keyRings/my-keyring/cryptoKeys/my-key | Missing or improperly formatted KMS key reference |
| `kms_key_active_version` | (Output) The Cloud KMS CryptoKeyVersion currently in use for protecting node local disks. Only applicable if kmsKey is set. | false | false | Output-only field indicating current key version, no security impact. | None | None |
| `kms_key_state` | (Output) Availability of the Cloud KMS CryptoKey. If not KEY_AVAILABLE, then nodes may go offline as they cannot access their local data. This can be caused by a lack of permissions to use the key, or if the key is disabled or deleted. | false | false | Output-only field indicating key status, no security impact. | None | None |

### node_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `labels` | The Kubernetes node labels. | false | true | Node labels enable proper workload placement, security zoning, and resource management based on security requirements. | security-zone=restricted, environment=production | Missing security labels or incorrect labeling that could lead to improper workload placement |
