## 🛡️ Policy Deployment Engine: `composer_user_workloads_secret`

This section provides a concise policy evaluation for the `composer_user_workloads_secret` resource in GCP.

Reference: [Terraform Registry – composer_user_workloads_secret](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/composer_user_workloads_secret)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the Kubernetes Secret. | true | None | None |
| `region` | The location or Compute Engine region for the environment. | false | None | None |
| `project` | The ID of the project in which the resource belongs. If it is not provided, the provider project is used. | false | None | None |
| `environment` | Environment where the Kubernetes Secret will be stored and used. | none | None | None |
| `data` | The "data" field of Kubernetes Secret, organized in key-value pairs, which can contain sensitive values such as a password, a token, or a key. Content of this field will not be displayed in CLI output, but it will be stored in terraform state file. To protect sensitive data, follow the best practices outlined in the HashiCorp documentation: https://developer.hashicorp.com/terraform/language/state/sensitive-data. The values for all keys have to be base64-encoded strings. For details see: https://kubernetes.io/docs/concepts/configuration/secret/ | false | None | None |
