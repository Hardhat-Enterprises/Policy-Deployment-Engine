## 🛡️ Policy Deployment Engine: `secret_manager_regional_secret_version`

This section provides a concise policy evaluation for the `secret_manager_regional_secret_version` resource in GCP.

Reference: [Terraform Registry – secret_manager_regional_secret_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_regional_secret_version)

---

## 1. Argument Reference

### `secret_data`
- Description: (Required) The secret data. Must be no larger than 64KiB. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret`
- Description: (Required) Secret Manager regional secret resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) The current state of the regional secret version.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_policy`
- Description: to be abandoned rather than deleted. Setting `DISABLE` allows the resource to be disabled rather than deleted. Default is `DELETE`. Possible values are: * DELETE * DISABLE * ABANDON
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_secret_data_base64`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
