## 🛡️ Policy Deployment Engine: `apigee_addons_config`

This section provides a concise policy evaluation for the `apigee_addons_config` resource in GCP.

Reference: [Terraform Registry – apigee_addons_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/apigee_addons_config)

---

## 1. Argument Reference

### `org`
- Description: (Required) Name of the Apigee organization.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `addons_config`
- Description: (Optional) Addon configurations of the Apigee organization. Structure is [documented below](#nested_addons_config). <a name="nested_addons_config"></a>The `addons_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advanced_api_ops_config`
- Description: (Optional) Configuration for the Advanced API Ops add-on. Structure is [documented below](#nested_addons_config_advanced_api_ops_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `integration_config`
- Description: (Optional) Configuration for the Integration add-on. Structure is [documented below](#nested_addons_config_integration_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `monetization_config`
- Description: (Optional) Configuration for the Monetization add-on. Structure is [documented below](#nested_addons_config_monetization_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_security_config`
- Description: (Optional) Configuration for the API Security add-on. Structure is [documented below](#nested_addons_config_api_security_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connectors_platform_config`
- Description: (Optional) Configuration for the Monetization add-on. Structure is [documented below](#nested_addons_config_connectors_platform_config). <a name="nested_addons_config_advanced_api_ops_config"></a>The `advanced_api_ops_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Flag that specifies whether the Advanced API Ops add-on is enabled. <a name="nested_addons_config_integration_config"></a>The `integration_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Flag that specifies whether the Integration add-on is enabled. <a name="nested_addons_config_monetization_config"></a>The `monetization_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Flag that specifies whether the Monetization add-on is enabled. <a name="nested_addons_config_api_security_config"></a>The `api_security_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Flag that specifies whether the API security add-on is enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expires_at`
- Description: (Output) Time at which the API Security add-on expires in in milliseconds since epoch. If unspecified, the add-on will never expire. <a name="nested_addons_config_connectors_platform_config"></a>The `connectors_platform_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Flag that specifies whether the Connectors Platform add-on is enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expires_at`
- Description: (Output) Time at which the Connectors Platform add-on expires in milliseconds since epoch. If unspecified, the add-on will never expire.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
