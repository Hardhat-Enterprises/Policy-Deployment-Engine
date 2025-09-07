## 🛡️ Policy Deployment Engine: `scc_v2_organization_mute_config`

This section provides a concise policy evaluation for the `scc_v2_organization_mute_config` resource in GCP.

Reference: [Terraform Registry – scc_v2_organization_mute_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/scc_v2_organization_mute_config)

---

## 1. Argument Reference

### `filter`
- Description: (Required) An expression that defines the filter to apply across create/update events of findings. While creating a filter string, be mindful of the scope in which the mute configuration is being created. E.g., If a filter contains project = X but is created under the project = Y scope, it might not match any findings.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) The type of the mute config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `organization`
- Description: (Required) The organization whose Cloud Security Command Center the Mute Config lives in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mute_config_id`
- Description: (Required) Unique identifier provided by the client within the parent scope.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description of the mute config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) location Id is provided by organization. If not provided, Use global as default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
