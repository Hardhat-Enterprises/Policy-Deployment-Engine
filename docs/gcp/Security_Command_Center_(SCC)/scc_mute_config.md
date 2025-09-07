## 🛡️ Policy Deployment Engine: `scc_mute_config`

This section provides a concise policy evaluation for the `scc_mute_config` resource in GCP.

Reference: [Terraform Registry – scc_mute_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_mute_config)

---

## 1. Argument Reference

### `filter`
- Description: (Required) An expression that defines the filter to apply across create/update events of findings. While creating a filter string, be mindful of the scope in which the mute configuration is being created. E.g., If a filter contains project = X but is created under the project = Y scope, it might not match any findings.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mute_config_id`
- Description: (Required) Unique identifier provided by the client within the parent scope.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) Resource name of the new mute configs's parent. Its format is "organizations/[organization_id]", "folders/[folder_id]", or "projects/[project_id]".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description of the mute config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) The type of the mute config, which determines what type of mute state the config affects. Default value is `DYNAMIC`. Possible values are: `MUTE_CONFIG_TYPE_UNSPECIFIED`, `STATIC`, `DYNAMIC`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expiry_time`
- Description: (Optional) Optional. The expiry of the mute config. Only applicable for dynamic configs. If the expiry is set, when the config expires, it is removed from all findings. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
