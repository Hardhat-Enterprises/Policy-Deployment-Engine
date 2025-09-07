## 🛡️ Policy Deployment Engine: `model_armor_template`

This section provides a concise policy evaluation for the `model_armor_template` resource in GCP.

Reference: [Terraform Registry – model_armor_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/model_armor_template)

---

## 1. Argument Reference

### `filter_config`
- Description: (Required) Filters configuration. Structure is [documented below](#nested_filter_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `template_id`
- Description: (Required) Id of the requesting object If auto-generating Id server-side, remove this field and template_id from the method_signature of Create RPC
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels as key value pairs **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `template_metadata`
- Description: (Optional) Message describing TemplateMetadata Structure is [documented below](#nested_template_metadata).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_filter_config"></a>The `filter_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `malicious_uri_filter_settings`
- Description: (Optional) Malicious URI filter settings. Structure is [documented below](#nested_filter_config_malicious_uri_filter_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rai_settings`
- Description: (Optional) Responsible AI Filter settings. Structure is [documented below](#nested_filter_config_rai_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sdp_settings`
- Description: (Optional) Sensitive Data Protection settings. Structure is [documented below](#nested_filter_config_sdp_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pi_and_jailbreak_filter_settings`
- Description: (Optional) Prompt injection and Jailbreak Filter settings. Structure is [documented below](#nested_filter_config_pi_and_jailbreak_filter_settings). <a name="nested_filter_config_malicious_uri_filter_settings"></a>The `malicious_uri_filter_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter_enforcement`
- Description: (Optional) Tells whether the Malicious URI filter is enabled or disabled. Possible values: ENABLED DISABLED <a name="nested_filter_config_rai_settings"></a>The `rai_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rai_filters`
- Description: (Required) List of Responsible AI filters enabled for template. Structure is [documented below](#nested_filter_config_rai_settings_rai_filters). <a name="nested_filter_config_rai_settings_rai_filters"></a>The `rai_filters` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter_type`
- Description: (Required) Possible values: SEXUALLY_EXPLICIT HATE_SPEECH HARASSMENT DANGEROUS
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `confidence_level`
- Description: (Optional) Possible values: LOW_AND_ABOVE MEDIUM_AND_ABOVE HIGH <a name="nested_filter_config_sdp_settings"></a>The `sdp_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advanced_config`
- Description: (Optional) Sensitive Data Protection Advanced configuration. Structure is [documented below](#nested_filter_config_sdp_settings_advanced_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `basic_config`
- Description: (Optional) Sensitive Data Protection basic configuration. Structure is [documented below](#nested_filter_config_sdp_settings_basic_config). <a name="nested_filter_config_sdp_settings_advanced_config"></a>The `advanced_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inspect_template`
- Description: (Optional) Sensitive Data Protection inspect template resource name If only inspect template is provided (de-identify template not provided), then Sensitive Data Protection InspectContent action is performed during Sanitization. All Sensitive Data Protection findings identified during inspection will be returned as SdpFinding in SdpInsepctionResult. e.g:- `projects/{project}/locations/{location}/inspectTemplates/{inspect_template}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deidentify_template`
- Description: (Optional) Optional Sensitive Data Protection Deidentify template resource name. If provided then DeidentifyContent action is performed during Sanitization using this template and inspect template. The De-identified data will be returned in SdpDeidentifyResult. Note that all info-types present in the deidentify template must be present in inspect template. e.g. `projects/{project}/locations/{location}/deidentifyTemplates/{deidentify_template}` <a name="nested_filter_config_sdp_settings_basic_config"></a>The `basic_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter_enforcement`
- Description: (Optional) Tells whether the Sensitive Data Protection basic config is enabled or disabled. Possible values: ENABLED DISABLED <a name="nested_filter_config_pi_and_jailbreak_filter_settings"></a>The `pi_and_jailbreak_filter_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter_enforcement`
- Description: (Optional) Tells whether Prompt injection and Jailbreak filter is enabled or disabled. Possible values: ENABLED DISABLED
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `confidence_level`
- Description: (Optional) Possible values: LOW_AND_ABOVE MEDIUM_AND_ABOVE HIGH <a name="nested_template_metadata"></a>The `template_metadata` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_template_operations`
- Description: (Optional) If true, log template crud operations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_sanitize_operations`
- Description: (Optional) If true, log sanitize operations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `multi_language_detection`
- Description: (Optional) Metadata to enable multi language detection via template. Structure is [documented below](#nested_template_metadata_multi_language_detection).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignore_partial_invocation_failures`
- Description: (Optional) If true, partial detector failures should be ignored.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_prompt_safety_error_code`
- Description: (Optional) Indicates the custom error code set by the user to be returned to the end user by the service extension if the prompt trips Model Armor filters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_prompt_safety_error_message`
- Description: (Optional) Indicates the custom error message set by the user to be returned to the end user if the prompt trips Model Armor filters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_llm_response_safety_error_code`
- Description: (Optional) Indicates the custom error code set by the user to be returned to the end user if the LLM response trips Model Armor filters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_llm_response_safety_error_message`
- Description: (Optional) Indicates the custom error message set by the user to be returned to the end user if the LLM response trips Model Armor filters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enforcement_type`
- Description: (Optional) Possible values: INSPECT_ONLY INSPECT_AND_BLOCK <a name="nested_template_metadata_multi_language_detection"></a>The `multi_language_detection` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_multi_language_detection`
- Description: (Required) If true, multi language detection will be enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
