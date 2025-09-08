## 🛡️ Policy Deployment Engine: `iam_workload_identity_pool_managed_identity`

This section provides a concise policy evaluation for the `iam_workload_identity_pool_managed_identity` resource in GCP.

Reference: [Terraform Registry – iam_workload_identity_pool_managed_identity](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_managed_identity)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `workload_identity_pool_id` | The ID to use for the pool, which becomes the final component of the resource name. This value should be 4-32 characters, and may contain the characters [a-z0-9-]. The prefix `gcp-` is reserved for use by Google, and may not be specified. | true | None | None |
| `workload_identity_pool_namespace_id` | The ID to use for the namespace. This value must: * contain at most 63 characters * contain only lowercase alphanumeric characters or `-` * start with an alphanumeric character * end with an alphanumeric character The prefix `gcp-` will be reserved for future uses. | true | None | None |
| `workload_identity_pool_managed_identity_id` | The ID to use for the managed identity. This value must: * contain at most 63 characters * contain only lowercase alphanumeric characters or `-` * start with an alphanumeric character * end with an alphanumeric character The prefix `gcp-` will be reserved for future uses. | true | None | None |
| `description` | A description of the managed identity. Cannot exceed 256 characters. | false | None | None |
| `disabled` | Whether the managed identity is disabled. If disabled, credentials may no longer be issued for the identity, however existing credentials will still be accepted until they expire. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### attestation_rules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `google_cloud_resource` | A single workload operating on Google Cloud. For example: `//compute.googleapis.com/projects/123/uid/zones/us-central1-a/instances/12345678`. | true | None | None |
