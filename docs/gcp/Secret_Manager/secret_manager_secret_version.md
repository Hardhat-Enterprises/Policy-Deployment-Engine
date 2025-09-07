## 🛡️ Policy Deployment Engine: `secret_manager_secret_version`

This section provides a concise policy evaluation for the `secret_manager_secret_version` resource in GCP.

Reference: [Terraform Registry – secret_manager_secret_version](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/secret_manager_secret_version)

---

## 1. Argument Reference

### `secret`
- Description: (Required) Secret Manager secret resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) The current state of the SecretVersion.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_data`
- Description: (Optional) The secret data. Must be no larger than 64KiB. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_data_wo_version`
- Description: (Optional) Triggers update of secret data write-only. For more info see [updating write-only attributes](/docs/providers/google/guides/using_write_only_attributes.html#updating-write-only-attributes)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_policy`
- Description: to be abandoned rather than deleted. Setting `DISABLE` allows the resource to be disabled rather than deleted. Default is `DELETE`. Possible values are: * DELETE * DISABLE * ABANDON
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_secret_data_base64`
- Description: ## Ephemeral Attributes Reference The following write-only attributes are supported:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_data_wo`
- Description: (Optional) The secret data. Must be no larger than 64KiB. For more info see [updating write-only attributes](/docs/providers/google/guides/using_write_only_attributes.html#updating-write-only-attributes) **Note**: This property is write-only and will not be read from the API. <a name="nested_payload"></a>The `payload` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_data_wo`
- Description: (Optional) The secret data. Must be no larger than 64KiB. For more info see [updating write-only attributes](/docs/providers/google/guides/using_write_only_attributes.html#updating-write-only-attributes) **Note**: This property is write-only and will not be read from the API.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
