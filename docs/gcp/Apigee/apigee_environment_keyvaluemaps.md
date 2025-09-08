## 🛡️ Policy Deployment Engine: `apigee_environment_keyvaluemaps`

This section provides a concise policy evaluation for the `apigee_environment_keyvaluemaps` resource in GCP.

Reference: [Terraform Registry – apigee_environment_keyvaluemaps](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_environment_keyvaluemaps)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Required. ID of the key value map. | true | None | None |
| `env_id` | The Apigee environment group associated with the Apigee environment, in the format `organizations/{{org_name}}/environments/{{env_name}}`. | true | None | None |
