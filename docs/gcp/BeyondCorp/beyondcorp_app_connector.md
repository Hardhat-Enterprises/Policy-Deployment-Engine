## 🛡️ Policy Deployment Engine: `beyondcorp_app_connector`

This section provides a concise policy evaluation for the `beyondcorp_app_connector` resource in GCP.

Reference: [Terraform Registry – beyondcorp_app_connector](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/beyondcorp_app_connector)

---

## 1. Argument Reference

### `name`
- Description: (Required) ID of the AppConnector.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `principal_info`
- Description: (Required) Principal information about the Identity of the AppConnector. Structure is [documented below](#nested_principal_info).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of the AppConnector.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) An arbitrary user-provided name for the AppConnector.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_principal_info"></a>The `principal_info` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Required) ServiceAccount represents a GCP service account. Structure is [documented below](#nested_principal_info_service_account). <a name="nested_principal_info_service_account"></a>The `service_account` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email`
- Description: (Required) Email address of the service account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
