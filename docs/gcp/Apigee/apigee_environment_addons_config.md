## 🛡️ Policy Deployment Engine: `apigee_environment_addons_config`

This section provides a concise policy evaluation for the `apigee_environment_addons_config` resource in GCP.

Reference: [Terraform Registry – apigee_environment_addons_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_environment_addons_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `env_id` | The Apigee environment group associated with the Apigee environment, in the format `organizations/{{org_name}}/environments/{{env_name}}`. | true | None | None |
| `analytics_enabled` | Flag to enable/disable Analytics. | false | None | None |
