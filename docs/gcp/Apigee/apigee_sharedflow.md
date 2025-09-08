## 🛡️ Policy Deployment Engine: `apigee_sharedflow`

This section provides a concise policy evaluation for the `apigee_sharedflow` resource in GCP.

Reference: [Terraform Registry – apigee_sharedflow](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_sharedflow)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The ID of the shared flow. | true | None | None |
| `org_id` | The Apigee Organization name associated with the Apigee instance. | true | None | None |
| `config_bundle` | Path to the config zip bundle. - - - | true | None | None |
