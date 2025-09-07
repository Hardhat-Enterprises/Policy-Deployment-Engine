## 🛡️ Policy Deployment Engine: `gemini_code_tools_setting_binding`

This section provides a concise policy evaluation for the `gemini_code_tools_setting_binding` resource in GCP.

Reference: [Terraform Registry – gemini_code_tools_setting_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_code_tools_setting_binding)

---

## 1. Argument Reference

### `target`
- Description: (Required) Target of the binding.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `code_tools_setting_id`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `setting_binding_id`
- Description: (Required) Id of the setting binding.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `product`
- Description: (Optional) Product type of the setting binding. Possible values are: `GEMINI_CODE_ASSIST`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
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
