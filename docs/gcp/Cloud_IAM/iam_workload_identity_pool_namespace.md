## 🛡️ Policy Deployment Engine: `iam_workload_identity_pool_namespace`

This section provides a concise policy evaluation for the `iam_workload_identity_pool_namespace` resource in GCP.

Reference: [Terraform Registry – iam_workload_identity_pool_namespace](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_namespace)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `workload_identity_pool_id` | The ID to use for the pool, which becomes the final component of the resource name. This value should be 4-32 characters, and may contain the characters [a-z0-9-]. The prefix `gcp-` is reserved for use by Google, and may not be specified. | true | false | None | None | None |
| `workload_identity_pool_namespace_id` | The ID to use for the namespace. This value must: * contain at most 63 characters * contain only lowercase alphanumeric characters or `-` * start with an alphanumeric character * end with an alphanumeric character The prefix `gcp-` will be reserved for future uses. | true | false | None | None | None |
| `description` | A description of the namespace. Cannot exceed 256 characters. | false | false | None | None | None |
| `disabled` | Whether the namespace is disabled. If disabled, credentials may no longer be issued for identities within this namespace, however existing credentials will still be accepted until they expire. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
