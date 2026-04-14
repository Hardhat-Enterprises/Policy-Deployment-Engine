## 🛡️ Policy Deployment Engine: `composer_user_workloads_config_map`

This section provides a concise policy evaluation for the `composer_user_workloads_config_map` resource in GCP.

Reference: [Terraform Registry – composer_user_workloads_config_map](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/composer_user_workloads_config_map)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the Kubernetes ConfigMap. | true | false | None | None | None |
| `environment` | Environment where the Kubernetes ConfigMap will be stored and used. | true | false | None | None | None |
| `data` | The "data" field of Kubernetes ConfigMap, organized in key-value pairs. For details see: https://kubernetes.io/docs/concepts/configuration/configmap/ | false | false | None | None | None |
| `region` | The location or Compute Engine region for the environment. | false | true | Region selection impacts data sovereignty and regulatory compliance. Restricting deployment to approved regions ensures that sensitive data remains within authorized geographic boundaries and aligns with organizational governance policies. | ['australia-southeast1'] | any region not explicitly listed in the approved regions policy (e.g., asia-southeast1, southamerica-east1, etc.) |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
