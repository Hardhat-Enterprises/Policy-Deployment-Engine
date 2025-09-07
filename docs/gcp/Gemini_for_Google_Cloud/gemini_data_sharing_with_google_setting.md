## 🛡️ Policy Deployment Engine: `gemini_data_sharing_with_google_setting`

This section provides a concise policy evaluation for the `gemini_data_sharing_with_google_setting` resource in GCP.

Reference: [Terraform Registry – gemini_data_sharing_with_google_setting](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_data_sharing_with_google_setting)

---

## 1. Argument Reference

### `data_sharing_with_google_setting_id`
- Description: (Required) Id of the Data Sharing With Google Setting.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_preview_data_sharing`
- Description: (Optional) Whether data sharing should be enabled in Preview products.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_data_sharing`
- Description: (Optional) Whether data sharing should be enabled in GA products.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
