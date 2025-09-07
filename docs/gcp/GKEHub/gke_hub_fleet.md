## 🛡️ Policy Deployment Engine: `gke_hub_fleet`

This section provides a concise policy evaluation for the `gke_hub_fleet` resource in GCP.

Reference: [Terraform Registry – gke_hub_fleet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_hub_fleet)

---

## 1. Argument Reference

### `display_name`
- Description: (Optional) A user-assigned display name of the Fleet. When present, it must be between 4 to 30 characters. Allowed characters are: lowercase and uppercase letters, numbers, hyphen, single-quote, double-quote, space, and exclamation point.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_cluster_config`
- Description: (Optional) The default cluster configurations to apply across the fleet. Structure is [documented below](#nested_default_cluster_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_default_cluster_config"></a>The `default_cluster_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `binary_authorization_config`
- Description: (Optional) Enable/Disable binary authorization features for the cluster. Structure is [documented below](#nested_default_cluster_config_binary_authorization_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_posture_config`
- Description: (Optional) Enable/Disable Security Posture features for the cluster. Structure is [documented below](#nested_default_cluster_config_security_posture_config). <a name="nested_default_cluster_config_binary_authorization_config"></a>The `binary_authorization_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `evaluation_mode`
- Description: (Optional) Mode of operation for binauthz policy evaluation. Possible values are: `DISABLED`, `POLICY_BINDINGS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `policy_bindings`
- Description: (Optional) Binauthz policies that apply to this cluster. Structure is [documented below](#nested_default_cluster_config_binary_authorization_config_policy_bindings). <a name="nested_default_cluster_config_binary_authorization_config_policy_bindings"></a>The `policy_bindings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) The relative resource name of the binauthz platform policy to audit. GKE platform policies have the following format: `projects/{project_number}/platforms/gke/policies/{policy_id}`. <a name="nested_default_cluster_config_security_posture_config"></a>The `security_posture_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) Sets which mode to use for Security Posture features. Possible values are: `DISABLED`, `BASIC`, `ENTERPRISE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vulnerability_mode`
- Description: (Optional) Sets which mode to use for vulnerability scanning. Possible values are: `VULNERABILITY_DISABLED`, `VULNERABILITY_BASIC`, `VULNERABILITY_ENTERPRISE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
