## 🛡️ Policy Deployment Engine: `iam_workload_identity_pool_managed_identity`

This section provides a concise policy evaluation for the `iam_workload_identity_pool_managed_identity` resource in GCP.

Reference: [Terraform Registry – iam_workload_identity_pool_managed_identity](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_managed_identity)

---

## 1. Argument Reference

### `workload_identity_pool_id`
- Description: (Required) The ID to use for the pool, which becomes the final component of the resource name. This value should be 4-32 characters, and may contain the characters [a-z0-9-]. The prefix `gcp-` is reserved for use by Google, and may not be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workload_identity_pool_namespace_id`
- Description: (Required) The ID to use for the namespace. This value must: * contain at most 63 characters * contain only lowercase alphanumeric characters or `-` * start with an alphanumeric character * end with an alphanumeric character The prefix `gcp-` will be reserved for future uses.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workload_identity_pool_managed_identity_id`
- Description: (Required) The ID to use for the managed identity. This value must: * contain at most 63 characters * contain only lowercase alphanumeric characters or `-` * start with an alphanumeric character * end with an alphanumeric character The prefix `gcp-` will be reserved for future uses.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description of the managed identity. Cannot exceed 256 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Whether the managed identity is disabled. If disabled, credentials may no longer be issued for the identity, however existing credentials will still be accepted until they expire.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attestation_rules`
- Description: (Optional) Defines which workloads can receive an identity within a pool. When an AttestationRule is defined under a managed identity, matching workloads may receive that identity. A maximum of 50 AttestationRules can be set. Structure is [documented below](#nested_attestation_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_attestation_rules"></a>The `attestation_rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `google_cloud_resource`
- Description: (Required) A single workload operating on Google Cloud. For example: `//compute.googleapis.com/projects/123/uid/zones/us-central1-a/instances/12345678`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
