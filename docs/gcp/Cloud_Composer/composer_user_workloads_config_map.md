## 🛡️ Policy Deployment Engine: `composer_user_workloads_config_map`

This section provides a concise policy evaluation for the `composer_user_workloads_config_map` resource in GCP.

Reference: [Terraform Registry – composer_user_workloads_config_map](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/composer_user_workloads_config_map)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the Kubernetes ConfigMap.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `environment`
- Description: (Required) Environment where the Kubernetes ConfigMap will be stored and used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data`
- Description: (Optional) The "data" field of Kubernetes ConfigMap, organized in key-value pairs. For details see: https://kubernetes.io/docs/concepts/configuration/configmap/
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The location or Compute Engine region for the environment.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
