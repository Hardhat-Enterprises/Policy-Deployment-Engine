## 🛡️ Policy Deployment Engine: `apigee_env_keystore`

This section provides a concise policy evaluation for the `apigee_env_keystore` resource in GCP.

Reference: [Terraform Registry – apigee_env_keystore](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_env_keystore)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `env_id` | The Apigee environment group associated with the Apigee environment, in the format `organizations/{{org_name}}/environments/{{env_name}}`. | true | None | None |
| `name` | The name of the newly created keystore. | false | None | None |
