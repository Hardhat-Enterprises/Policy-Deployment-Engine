## 🛡️ Policy Deployment Engine: `bigtable_instance`

This section provides a concise policy evaluation for the `bigtable_instance` resource in GCP.

Reference: [Terraform Registry – bigtable_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_instance)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the Cloud Bigtable instance. | true | false | Human-chosen resource name for Terraform/API; it is not a cryptographic material and does not enumerate who may access data. | None | None |
| `cluster` | A cluster for the instance. At least one cluster must exist when the instance is created; you can add up to 8 clusters within 8 regions. Removing this block makes the provider default to backend values. | true | false | A structural block in HCL, not a secret. Security-sensitive values (for example `kms_key_name` or `zone`) live on nested attributes and are assessed there, not on the fact that a `cluster` block exists. | None | None |
| `project` | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | false | false | Public, non-secret project identifier used for API routing; it does not prove caller identity. | None | None |
| `instance_type` | DEVELOPMENT or PRODUCTION (Google is unifying these; prefer PRODUCTION for new instances). | false | false | Changes sizing/quota characteristics only; it neither publishes data nor adds IAM grants. | None | None |
| `display_name` | Human-readable display name for the instance in consoles. | false | false | Console label only; does not alter IAM, keys, or network ACLs. | None | None |
| `force_destroy` | When true, Terraform can destroy the instance even when that would normally be blocked. | false | false | IaC-only destroy behavior; not a data-exposure toggle, though enabling careless destroys can harm availability—still distinct from granting anonymous reads. | None | None |
| `deletion_protection` | When true (or unset in state per provider behavior), Terraform apply/destroy that would delete the instance fails. | false | true | Blocks accidental destructive changes to the instance and its data plane availability. | true | false |
| `labels` | Non-authoritative labels applied via Terraform; see `effective_labels` for the full set in GCP. | false | false | Key/value tags for governance and billing; label pairs are not secrets and labeling alone does not authenticate requests. | None | None |
| `tags` | Resource tags (key/value) per GCP tag requirements. | false | false | Organizational tags for policy/cost tracking; not credential material. | None | None |
| `terraform_labels` | Labels from Terraform configuration merged with provider default labels. | false | false | Derived labels for state/plan output; read-only convenience field, not an access grant. | None | None |
| `effective_labels` | All labels present on the resource in GCP, including Terraform, API, and service-managed labels. | false | false | Aggregated label snapshot from GCP; informational only and does not replace IAM decisions. | None | None |

### cluster Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cluster_id` | The unique identifier for the cluster within the instance. | true | false | Distinguishes one cluster from another in config; the string is not a principal identifier and does not open network access by itself. | None | None |
| `zone` | The zone to serve this cluster in. If unspecified, the provider zone is used. Each cluster must use a different zone in the same region. | false | true | Zone determines physical location and data residency; policies may whitelist approved regions/zones (`cluster.zone`). | australia-southeast1-a | us-central1-b |
| `num_nodes` | The number of nodes in the cluster. If unset and autoscaling is not configured, Bigtable sizes nodes from data footprint. | false | false | Performance/capacity tuning only; node count does not list IAM members or contain keys. | None | None |
| `autoscaling_config` | Optional autoscaling configuration for the cluster. Only one of `autoscaling_config` or `num_nodes` should be set. | false | false | Container for autoscaling parameters; the block label is not sensitive—only the nested min/max and targets affect operations, not identity or encryption root of trust. | None | None |
| `storage_type` | The storage type for the cluster: `SSD` (default) or `HDD`. | false | false | Chooses media class for performance/cost; both options still rely on platform-managed encryption at rest and do not control IAM. | None | None |
| `kms_key_name` | Fully qualified name of the Cloud KMS key for CMEK (customer-managed encryption) for this cluster. | false | true | CMEK ties encryption at rest to your KMS key; policies often require a non-empty key in an approved project/region (`cluster.kms_key_name`). | projects/PDE/locations/australia-southeast1/keyRings/bt-kr/cryptoKeys/bt-cmek | unset |
| `node_scaling_factor` | Optional scaling factor for node granularity for this cluster. | false | false | Provider-internal sizing hint; unrelated to secrets, principals, or encryption keys. | None | None |

###   autoscaling_config Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `min_nodes` | Minimum number of nodes for autoscaling. | true | false | Sets a capacity floor for autoscaling; it does not define who can read or write Bigtable data. | None | None |
  | `max_nodes` | Maximum number of nodes for autoscaling. | true | false | Sets a capacity ceiling; unrelated to IAM bindings and not a secret. | None | None |
  | `cpu_target` | CPU utilization target for autoscaling (percent). | true | false | Operational tuning target for scaling behavior only; does not authenticate clients. | None | None |
  | `storage_target` | Storage utilization target for autoscaling (percent). | false | false | Another scaling signal for capacity planning; not an authorization mechanism. | None | None |
