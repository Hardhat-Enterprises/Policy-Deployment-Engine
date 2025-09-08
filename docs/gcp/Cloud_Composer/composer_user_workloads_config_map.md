## 🛡️ Policy Deployment Engine: `composer_user_workloads_config_map`

This section provides a concise policy evaluation for the `composer_user_workloads_config_map` resource in GCP.

Reference: [Terraform Registry – composer_user_workloads_config_map](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/composer_user_workloads_config_map)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the Kubernetes ConfigMap. | true | None | None |
| `environment` | Environment where the Kubernetes ConfigMap will be stored and used. | true | None | None |
| `data` | The "data" field of Kubernetes ConfigMap, organized in key-value pairs. For details see: https://kubernetes.io/docs/concepts/configuration/configmap/ | false | None | None |
| `region` | The location or Compute Engine region for the environment. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
