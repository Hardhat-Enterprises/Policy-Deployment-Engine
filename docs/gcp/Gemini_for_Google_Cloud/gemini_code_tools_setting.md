## 🛡️ Policy Deployment Engine: `gemini_code_tools_setting`

This section provides a concise policy evaluation for the `gemini_code_tools_setting` resource in GCP.

Reference: [Terraform Registry – gemini_code_tools_setting](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_code_tools_setting)

---

## 1. Argument Reference

### `enabled_tool`
- Description: (Required) Represents the full set of enabled tools. Structure is [documented below](#nested_enabled_tool).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `code_tools_setting_id`
- Description: (Required) Id of the Code Tools Setting.
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
- Description: If it is not provided, the provider project is used. <a name="nested_enabled_tool"></a>The `enabled_tool` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `account_connector`
- Description: (Optional) Link to the Dev Connect Account Connector that holds the user credentials. projects/{project}/locations/{location}/accountConnectors/{account_connector_id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `handle`
- Description: (Required) Handle used to invoke the tool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tool`
- Description: (Required) Link to the Tool
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config`
- Description: (Optional) Configuration parameters for the tool. Structure is [documented below](#nested_enabled_tool_enabled_tool_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri_override`
- Description: (Optional) Overridden URI, if allowed by Tool. <a name="nested_enabled_tool_enabled_tool_config"></a>The `config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Required) Key of the configuration item.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Required) Value of the configuration item.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
