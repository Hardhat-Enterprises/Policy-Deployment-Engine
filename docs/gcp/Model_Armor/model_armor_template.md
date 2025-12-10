## 🛡️ Policy Deployment Engine: `model_armor_template`

This section provides a concise policy evaluation for the `model_armor_template` resource in GCP.

Reference: [Terraform Registry – model_armor_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/model_armor_template)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `filter_config` | Filters configuration. Structure is [documented below](#nested_filter_config). | true | true | Controls which filters (malicious URI, Responsible AI, sensitive data, prompt-injection) are active. Misconfiguration could allow harmful or sensitive data to pass unchecked. | Properly configured filters covering all required categories. | Filters disabled or missing critical protections. |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | true | true | Region choice affects data residency and regulatory compliance. | Deployment region meets organization’s compliance requirements. | Deployment region violates data residency rules. |
| `template_id` | Id of the requesting object If auto-generating Id server-side, remove this field and template_id from the method_signature of Create RPC | true | false | None | None | None |
| `labels` | Labels as key value pairs **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `template_metadata` | Message describing TemplateMetadata Structure is [documented below](#nested_template_metadata). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
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
| `malicious_uri_filter_settings` | Malicious URI filter settings. Structure is [documented below](#nested_filter_config_malicious_uri_filter_settings). | false | true | Prevents injection of malicious URLs. Disabling increases phishing or malware risk. | filter_enforcement set to ENABLED. | filter_enforcement set to DISABLED. |
| `rai_settings` | Responsible AI Filter settings. Structure is [documented below](#nested_filter_config_rai_settings). | false | true | Helps block hate speech, harassment, or dangerous content from LLM responses. | All required RAI filters enabled. | RAI filters missing or disabled. |
| `sdp_settings` | Sensitive Data Protection settings. Structure is [documented below](#nested_filter_config_sdp_settings). | false | true | Detects and masks personal or sensitive data. Disabling risks data leakage and compliance violations. | Sensitive data filters enabled with correct templates. | Sensitive data filters disabled or incomplete. |
| `pi_and_jailbreak_filter_settings` | Prompt injection and Jailbreak Filter settings. Structure is [documented below](#nested_filter_config_pi_and_jailbreak_filter_settings). | false | true | Blocks attempts to override safeguards or exfiltrate data via prompt injection. | filter_enforcement set to ENABLED. | filter_enforcement set to DISABLED. |

### template_metadata Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `log_template_operations` | If true, log template crud operations. | false | false | None | None | None |
| `log_sanitize_operations` | If true, log sanitize operations. | false | false | None | None | None |
| `multi_language_detection` | Metadata to enable multi language detection via template. Structure is [documented below](#nested_template_metadata_multi_language_detection). | false | false | None | None | None |
| `ignore_partial_invocation_failures` | If true, partial detector failures should be ignored. | false | false | None | None | None |
| `custom_prompt_safety_error_code` | Indicates the custom error code set by the user to be returned to the end user by the service extension if the prompt trips Model Armor filters. | false | false | None | None | None |
| `custom_prompt_safety_error_message` | Indicates the custom error message set by the user to be returned to the end user if the prompt trips Model Armor filters. | false | false | None | None | None |
| `custom_llm_response_safety_error_code` | Indicates the custom error code set by the user to be returned to the end user if the LLM response trips Model Armor filters. | false | false | None | None | None |
| `custom_llm_response_safety_error_message` | Indicates the custom error message set by the user to be returned to the end user if the LLM response trips Model Armor filters. | false | false | None | None | None |
| `enforcement_type` | Possible values: INSPECT_ONLY INSPECT_AND_BLOCK | false | false | None | None | None |

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
| `filter_type` | Possible values: SEXUALLY_EXPLICIT HATE_SPEECH HARASSMENT DANGEROUS | true | true | Specifies which harmful content categories to filter. Omitting critical categories can allow unsafe output. | Includes all required categories (e.g., SEXUALLY_EXPLICIT, HATE_SPEECH, HARASSMENT, DANGEROUS). | Missing any mandated category or set incorrectly. |
| `confidence_level` | Possible values: LOW_AND_ABOVE MEDIUM_AND_ABOVE HIGH | false | true | Determines sensitivity of detection. Too low can allow harmful content through; too high can overblock legitimate content. | Configured to MEDIUM_AND_ABOVE or higher per policy. | LOW_ONLY |

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
| `filter_enforcement` | Tells whether Prompt injection and Jailbreak filter is enabled or disabled. Possible values: ENABLED DISABLED | false | false | None | None | None |
| `confidence_level` | Possible values: LOW_AND_ABOVE MEDIUM_AND_ABOVE HIGH | false | false | None | None | None |

### multi_language_detection Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enable_multi_language_detection` | If true, multi language detection will be enabled. | true | false | None | None | None |
