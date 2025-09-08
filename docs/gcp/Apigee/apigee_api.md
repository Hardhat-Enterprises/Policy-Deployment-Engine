## 🛡️ Policy Deployment Engine: `apigee_api`

This section provides a concise policy evaluation for the `apigee_api` resource in GCP.

Reference: [Terraform Registry – apigee_api](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_api)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The ID of the API proxy. | true | None | None |
| `org_id` | The Apigee Organization name associated with the Apigee instance. | true | None | None |
| `config_bundle` | Path to the config zip bundle. - - - | true | None | None |
