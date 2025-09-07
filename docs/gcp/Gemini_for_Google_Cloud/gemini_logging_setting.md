## 🛡️ Policy Deployment Engine: `gemini_logging_setting`

This section provides a concise policy evaluation for the `gemini_logging_setting` resource in GCP.

Reference: [Terraform Registry – gemini_logging_setting](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_logging_setting)

---

## 1. Argument Reference

### `location`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logging_setting_id`
- Description: (Required) Id of the Logging Setting.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_prompts_and_responses`
- Description: (Optional) Whether to log prompts and responses.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_metadata`
- Description: (Optional) Whether to log metadata.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
