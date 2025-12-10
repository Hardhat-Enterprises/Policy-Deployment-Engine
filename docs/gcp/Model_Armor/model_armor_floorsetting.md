## 🛡️ Policy Deployment Engine: `model_armor_floorsetting`

This section provides a concise policy evaluation for the `model_armor_floorsetting` resource in GCP.

Reference: [Terraform Registry – model_armor_floorsetting](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/model_armor_floorsetting)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `filter_config` | Filters configuration. Structure is [documented below](#nested_filter_config). | true | true | Central configuration for malicious-URI, Responsible-AI, sensitive-data and prompt-injection filters. Misconfiguration may allow harmful or sensitive content to pass unchecked. | MEDIUM_AND_ABOVE |   |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | true | Determines the region where data is stored and processed, impacting compliance with data-residency and privacy regulations. | global | us-east1 |
| `parent` | Will be any one of these: * `projects/{project}` * `folders/{folder}` * `organizations/{organizationId}` | true | true | Ensures policies are attached to the correct project, folder, or organization for proper governance. | projects/my-secure-project | projects/wrong-project |
| `enable_floor_setting_enforcement` | Floor Settings enforcement status. | false | false | None | None | None |
| `integrated_services` | List of integrated services for which the floor setting is applicable. | false | false | None | None | None |
| `ai_platform_floor_setting` | AI Platform floor setting. Structure is [documented below](#nested_ai_platform_floor_setting). | false | false | None | None | None |
| `floor_setting_metadata` | Metadata to enable multi language detection via floor setting. Structure is [documented below](#nested_floor_setting_metadata). | false | false | None | None | None |
| `malicious_uri_filter_settings` |  | false | false | None | None | None |
| `rai_settings` |  | false | false | None | None | None |
| `rai_filters` |  | false | false | None | None | None |
| `sdp_settings` |  | false | false | None | None | None |
| `advanced_config` |  | false | false | None | None | None |
| `basic_config` |  | false | false | None | None | None |
| `pi_and_jailbreak_filter_settings` |  | false | false | None | None | None |
| `multi_language_detection` |  | false | false | None | None | None |

### filter_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `malicious_uri_filter_settings` | Malicious URI filter settings. Structure is [documented below](#nested_filter_config_malicious_uri_filter_settings). | false | true | Controls detection of malicious links to prevent data exfiltration and phishing. | filter_enforcement set to ENABLED | filter_enforcement set to DISABLED |
| `rai_settings` | Responsible AI Filter settings. Structure is [documented below](#nested_filter_config_rai_settings). | false | true | Helps ensure generated content adheres to Responsible AI guidelines. | rai_filters defined for all required categories. | No rai_filters configured. |
| `sdp_settings` | Sensitive Data Protection settings. Structure is [documented below](#nested_filter_config_sdp_settings). | false | true | Prevents exposure of sensitive or regulated information. | basic_config.filter_enforcement = ENABLED | All configs disabled. |
| `pi_and_jailbreak_filter_settings` | Prompt injection and Jailbreak Filter settings. Structure is [documented below](#nested_filter_config_pi_and_jailbreak_filter_settings). | false | true | Blocks malicious attempts to override system instructions or leak data. | filter_enforcement set to ENABLED | filter_enforcement set to DISABLED |

### ai_platform_floor_setting Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `inspect_only` | If true, Model Armor filters will be run in inspect only mode. No action will be taken on the request. | false | false | None | None | None |
| `inspect_and_block` | If true, Model Armor filters will be run in inspect and block mode. Requests that trip Model Armor filters will be blocked. | false | false | None | None | None |
| `enable_cloud_logging` | If true, log Model Armor filter results to Cloud Logging. | false | false | None | None | None |

### floor_setting_metadata Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `multi_language_detection` | Metadata for multi language detection. Structure is [documented below](#nested_floor_setting_metadata_multi_language_detection). | false | false | None | None | None |

### malicious_uri_filter_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `filter_enforcement` | Tells whether the Malicious URI filter is enabled or disabled. Possible values: ENABLED DISABLED | false | false | None | None | None |

### rai_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `rai_filters` | List of Responsible AI filters enabled for template. Structure is [documented below](#nested_filter_config_rai_settings_rai_filters). | true | false | None | None | None |

### rai_filters Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `filter_type` | Possible values: SEXUALLY_EXPLICIT HATE_SPEECH HARASSMENT DANGEROUS | true | true | Determines which harmful content is blocked. | SEXUAL | INVALID_TYPE |
| `confidence_level` | Possible values: LOW_AND_ABOVE MEDIUM_AND_ABOVE HIGH | false | true | Higher thresholds reduce false positives but may allow harmful content if too low. | MEDIUM_AND_ABOVE | LOW_ONLY |

### sdp_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `advanced_config` | Sensitive Data Protection Advanced configuration. Structure is [documented below](#nested_filter_config_sdp_settings_advanced_config). | false | false | None | None | None |
| `basic_config` | Sensitive Data Protection basic configuration. Structure is [documented below](#nested_filter_config_sdp_settings_basic_config). | false | false | None | None | None |

### advanced_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `inspect_template` | Sensitive Data Protection inspect template resource name If only inspect template is provided (de-identify template not provided), then Sensitive Data Protection InspectContent action is performed during Sanitization. All Sensitive Data Protection findings identified during inspection will be returned as SdpFinding in SdpInsepctionResult. e.g:- `projects/{project}/locations/{location}/inspectTemplates/{inspect_template}` | false | false | None | None | None |
| `deidentify_template` | Optional Sensitive Data Protection Deidentify template resource name. If provided then DeidentifyContent action is performed during Sanitization using this template and inspect template. The De-identified data will be returned in SdpDeidentifyResult. Note that all info-types present in the deidentify template must be present in inspect template. e.g. `projects/{project}/locations/{location}/deidentifyTemplates/{deidentify_template}` | false | false | None | None | None |

### basic_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `filter_enforcement` | Tells whether the Sensitive Data Protection basic config is enabled or disabled. Possible values: ENABLED DISABLED | false | false | None | None | None |

### pi_and_jailbreak_filter_settings Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `filter_enforcement` | Tells whether Prompt injection and Jailbreak filter is enabled or disabled. Possible values: ENABLED DISABLED | false | true | Disabling increases risk of prompt manipulation. | ENABLED | DISABLED |
| `confidence_level` | Possible values: LOW_AND_ABOVE MEDIUM_AND_ABOVE HIGH | false | true | Determines sensitivity to possible prompt injection attempts. | MEDIUM_AND_ABOVE | HIGH |

### multi_language_detection Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enable_multi_language_detection` | If true, multi language detection will be enabled. | true | false | None | None | None |
