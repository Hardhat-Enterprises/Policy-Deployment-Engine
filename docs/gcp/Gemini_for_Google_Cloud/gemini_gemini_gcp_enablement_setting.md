## 🛡️ Policy Deployment Engine: `gemini_gemini_gcp_enablement_setting`

This section provides a concise policy evaluation for the `gemini_gemini_gcp_enablement_setting` resource in GCP.

Reference: [Terraform Registry – gemini_gemini_gcp_enablement_setting](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_gemini_gcp_enablement_setting)

---

## 1. Argument Reference

### `location`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gemini_gcp_enablement_setting_id`
- Description: (Required) Id of the Gemini Gcp Enablement setting.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_customer_data_sharing`
- Description: (Optional) Whether customer data sharing should be enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_web_grounding`
- Description: (Optional, Deprecated) Whether web grounding should be disabled. ~> **Warning:** `disable_web_grounding` is deprecated. Use `web_grounding_type` instead.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `web_grounding_type`
- Description: (Optional) Web grounding type. Possible values: GROUNDING_WITH_GOOGLE_SEARCH WEB_GROUNDING_FOR_ENTERPRISE
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
