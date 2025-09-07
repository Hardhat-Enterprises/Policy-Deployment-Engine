## 🛡️ Policy Deployment Engine: `model_armor_floorsetting`

This section provides a concise policy evaluation for the `model_armor_floorsetting` resource in GCP.

Reference: [Terraform Registry – model_armor_floorsetting](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/model_armor_floorsetting)

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

### `parent`
- Description: (Required) Will be any one of these:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_floor_setting_enforcement`
- Description: (Optional) Floor Settings enforcement status.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `integrated_services`
- Description: (Optional) List of integrated services for which the floor setting is applicable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ai_platform_floor_setting`
- Description: (Optional) AI Platform floor setting. Structure is [documented below](#nested_ai_platform_floor_setting).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `floor_setting_metadata`
- Description: (Optional) Metadata to enable multi language detection via floor setting. Structure is [documented below](#nested_floor_setting_metadata). <a name="nested_filter_config"></a>The `filter_config` block supports:
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
- Description: (Optional) Possible values: LOW_AND_ABOVE MEDIUM_AND_ABOVE HIGH <a name="nested_ai_platform_floor_setting"></a>The `ai_platform_floor_setting` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inspect_only`
- Description: (Optional) If true, Model Armor filters will be run in inspect only mode. No action will be taken on the request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inspect_and_block`
- Description: (Optional) If true, Model Armor filters will be run in inspect and block mode. Requests that trip Model Armor filters will be blocked.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_cloud_logging`
- Description: (Optional) If true, log Model Armor filter results to Cloud Logging. <a name="nested_floor_setting_metadata"></a>The `floor_setting_metadata` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `multi_language_detection`
- Description: (Optional) Metadata for multi language detection. Structure is [documented below](#nested_floor_setting_metadata_multi_language_detection). <a name="nested_floor_setting_metadata_multi_language_detection"></a>The `multi_language_detection` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_multi_language_detection`
- Description: (Required) If true, multi language detection will be enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
