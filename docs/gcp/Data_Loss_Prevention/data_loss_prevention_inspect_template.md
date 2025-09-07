## 🛡️ Policy Deployment Engine: `data_loss_prevention_inspect_template`

This section provides a concise policy evaluation for the `data_loss_prevention_inspect_template` resource in GCP.

Reference: [Terraform Registry – data_loss_prevention_inspect_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_loss_prevention_inspect_template)

---

## 1. Argument Reference

### `parent`
- Description: (Required) The parent of the inspect template in any of the following formats:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description of the inspect template.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User set display name of the inspect template.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `template_id`
- Description: (Optional) The template id can contain uppercase and lowercase letters, numbers, and hyphens; that is, it must match the regular expression: [a-zA-Z\d-_]+. The maximum length is 100 characters. Can be empty to allow the system to generate one.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inspect_config`
- Description: (Optional) The core content of the template. Structure is [documented below](#nested_inspect_config). <a name="nested_inspect_config"></a>The `inspect_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_info_types`
- Description: (Optional) When true, excludes type information of the findings.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_quote`
- Description: (Optional) When true, a contextual quote from the data that triggered a finding is included in the response.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_likelihood`
- Description: (Optional) Only returns findings equal or above this threshold. See https://cloud.google.com/dlp/docs/likelihood for more info Default value is `POSSIBLE`. Possible values are: `VERY_UNLIKELY`, `UNLIKELY`, `POSSIBLE`, `LIKELY`, `VERY_LIKELY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `limits`
- Description: (Optional) Configuration to control the number of findings returned. Structure is [documented below](#nested_inspect_config_limits).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `info_types`
- Description: (Optional) Restricts what infoTypes to look for. The values must correspond to InfoType values returned by infoTypes.list or listed at https://cloud.google.com/dlp/docs/infotypes-reference. When no InfoTypes or CustomInfoTypes are specified in a request, the system may automatically choose what detectors to run. By default this may be all types, but may change over time as detectors are updated. Structure is [documented below](#nested_inspect_config_info_types).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `content_options`
- Description: (Optional) List of options defining data content to scan. If empty, text, images, and other content will be included. Each value may be one of: `CONTENT_TEXT`, `CONTENT_IMAGE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rule_set`
- Description: (Optional) Set of rules to apply to the findings for this InspectConfig. Exclusion rules, contained in the set are executed in the end, other rules are executed in the order they are specified for each info type. Structure is [documented below](#nested_inspect_config_rule_set).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_info_types`
- Description: (Optional) Custom info types to be used. See https://cloud.google.com/dlp/docs/creating-custom-infotypes to learn more. Structure is [documented below](#nested_inspect_config_custom_info_types). <a name="nested_inspect_config_limits"></a>The `limits` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_findings_per_item`
- Description: (Required) Max number of findings that will be returned for each item scanned. The maximum returned is 2000.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_findings_per_request`
- Description: (Required) Max number of findings that will be returned per request/job. The maximum returned is 2000.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_findings_per_info_type`
- Description: (Optional) Configuration of findings limit given for specified infoTypes. Structure is [documented below](#nested_inspect_config_limits_max_findings_per_info_type). <a name="nested_inspect_config_limits_max_findings_per_info_type"></a>The `max_findings_per_info_type` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `info_type`
- Description: (Optional) Type of information the findings limit applies to. Only one limit per infoType should be provided. If InfoTypeLimit does not have an infoType, the DLP API applies the limit against all infoTypes that are found but not specified in another InfoTypeLimit. Structure is [documented below](#nested_inspect_config_limits_max_findings_per_info_type_max_findings_per_info_type_info_type).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_findings`
- Description: (Required) Max findings limit for the given infoType. <a name="nested_inspect_config_limits_max_findings_per_info_type_max_findings_per_info_type_info_type"></a>The `info_type` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) Version name for this InfoType.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sensitivity_score`
- Description: (Optional) Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_inspect_config_limits_max_findings_per_info_type_max_findings_per_info_type_info_type_sensitivity_score). <a name="nested_inspect_config_limits_max_findings_per_info_type_max_findings_per_info_type_info_type_sensitivity_score"></a>The `sensitivity_score` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `score`
- Description: (Required) The sensitivity score applied to the resource. Possible values are: `SENSITIVITY_LOW`, `SENSITIVITY_MODERATE`, `SENSITIVITY_HIGH`. <a name="nested_inspect_config_info_types"></a>The `info_types` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) Version of the information type to use. By default, the version is set to stable
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sensitivity_score`
- Description: (Optional) Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_inspect_config_info_types_info_types_sensitivity_score). <a name="nested_inspect_config_info_types_info_types_sensitivity_score"></a>The `sensitivity_score` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `score`
- Description: (Required) The sensitivity score applied to the resource. Possible values are: `SENSITIVITY_LOW`, `SENSITIVITY_MODERATE`, `SENSITIVITY_HIGH`. <a name="nested_inspect_config_rule_set"></a>The `rule_set` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `info_types`
- Description: (Required) List of infoTypes this rule set is applied to. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_info_types).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rules`
- Description: (Required) Set of rules to be applied to infoTypes. The rules are applied in order. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules). <a name="nested_inspect_config_rule_set_rule_set_info_types"></a>The `info_types` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) Version name for this InfoType.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sensitivity_score`
- Description: (Optional) Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_info_types_info_types_sensitivity_score). <a name="nested_inspect_config_rule_set_rule_set_info_types_info_types_sensitivity_score"></a>The `sensitivity_score` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `score`
- Description: (Required) The sensitivity score applied to the resource. Possible values are: `SENSITIVITY_LOW`, `SENSITIVITY_MODERATE`, `SENSITIVITY_HIGH`. <a name="nested_inspect_config_rule_set_rule_set_rules"></a>The `rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hotword_rule`
- Description: (Optional) Hotword-based detection rule. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_hotword_rule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclusion_rule`
- Description: (Optional) The rule that specifies conditions when findings of infoTypes specified in InspectionRuleSet are removed from results. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule). <a name="nested_inspect_config_rule_set_rule_set_rules_rules_hotword_rule"></a>The `hotword_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hotword_regex`
- Description: (Required) Regular expression pattern defining what qualifies as a hotword. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_hotword_rule_hotword_regex).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proximity`
- Description: (Required) Proximity of the finding within which the entire hotword must reside. The total length of the window cannot exceed 1000 characters. Note that the finding itself will be included in the window, so that hotwords may be used to match substrings of the finding itself. For example, the certainty of a phone number regex `(\d{3}) \d{3}-\d{4}` could be adjusted upwards if the area code is known to be the local area code of a company office using the hotword regex `(xxx)`, where `xxx` is the area code in question. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_hotword_rule_proximity).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `likelihood_adjustment`
- Description: (Required) Likelihood adjustment to apply to all matching findings. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_hotword_rule_likelihood_adjustment). <a name="nested_inspect_config_rule_set_rule_set_rules_rules_hotword_rule_hotword_regex"></a>The `hotword_regex` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pattern`
- Description: (Required) Pattern defining the regular expression. Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group_indexes`
- Description: (Optional) The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included. <a name="nested_inspect_config_rule_set_rule_set_rules_rules_hotword_rule_proximity"></a>The `proximity` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `window_before`
- Description: (Optional) Number of characters before the finding to consider. Either this or window_after must be specified
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `window_after`
- Description: (Optional) Number of characters after the finding to consider. Either this or window_before must be specified <a name="nested_inspect_config_rule_set_rule_set_rules_rules_hotword_rule_likelihood_adjustment"></a>The `likelihood_adjustment` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fixed_likelihood`
- Description: (Optional) Set the likelihood of a finding to a fixed value. Either this or relative_likelihood can be set. Possible values are: `VERY_UNLIKELY`, `UNLIKELY`, `POSSIBLE`, `LIKELY`, `VERY_LIKELY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `relative_likelihood`
- Description: (Optional) Increase or decrease the likelihood by the specified number of levels. For example, if a finding would be POSSIBLE without the detection rule and relativeLikelihood is 1, then it is upgraded to LIKELY, while a value of -1 would downgrade it to UNLIKELY. Likelihood may never drop below VERY_UNLIKELY or exceed VERY_LIKELY, so applying an adjustment of 1 followed by an adjustment of -1 when base likelihood is VERY_LIKELY will result in a final likelihood of LIKELY. Either this or fixed_likelihood can be set. <a name="nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule"></a>The `exclusion_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `matching_type`
- Description: (Required) How the rule is applied. See the documentation for more information: https://cloud.google.com/dlp/docs/reference/rest/v2/InspectConfig#MatchingType Possible values are: `MATCHING_TYPE_FULL_MATCH`, `MATCHING_TYPE_PARTIAL_MATCH`, `MATCHING_TYPE_INVERSE_MATCH`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dictionary`
- Description: (Optional) Dictionary which defines the rule. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_dictionary).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regex`
- Description: (Optional) Regular expression which defines the rule. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_regex).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_info_types`
- Description: (Optional) Set of infoTypes for which findings would affect this rule. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_info_types).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_by_hotword`
- Description: (Optional) Drop if the hotword rule is contained in the proximate context. For tabular data, the context includes the column name. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_by_hotword). <a name="nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_dictionary"></a>The `dictionary` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `word_list`
- Description: (Optional) List of words or phrases to search for. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_dictionary_word_list).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_storage_path`
- Description: (Optional) Newline-delimited file of words in Cloud Storage. Only a single file is accepted. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_dictionary_cloud_storage_path). <a name="nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_dictionary_word_list"></a>The `word_list` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `words`
- Description: (Required) Words or phrases defining the dictionary. The dictionary must contain at least one phrase and every phrase must contain at least 2 characters that are letters or digits. <a name="nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_dictionary_cloud_storage_path"></a>The `cloud_storage_path` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) A url representing a file or path (no wildcards) in Cloud Storage. Example: `gs://[BUCKET_NAME]/dictionary.txt` <a name="nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_regex"></a>The `regex` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pattern`
- Description: (Required) Pattern defining the regular expression. Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group_indexes`
- Description: (Optional) The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included. <a name="nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_info_types"></a>The `exclude_info_types` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `info_types`
- Description: (Required) If a finding is matched by any of the infoType detectors listed here, the finding will be excluded from the scan results. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_info_types_info_types). <a name="nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_info_types_info_types"></a>The `info_types` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) Version name for this InfoType.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sensitivity_score`
- Description: (Optional) Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_info_types_info_types_info_types_sensitivity_score). <a name="nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_info_types_info_types_info_types_sensitivity_score"></a>The `sensitivity_score` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `score`
- Description: (Required) The sensitivity score applied to the resource. Possible values are: `SENSITIVITY_LOW`, `SENSITIVITY_MODERATE`, `SENSITIVITY_HIGH`. <a name="nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_by_hotword"></a>The `exclude_by_hotword` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hotword_regex`
- Description: (Required) Regular expression pattern defining what qualifies as a hotword. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_by_hotword_hotword_regex).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proximity`
- Description: (Required) Proximity of the finding within which the entire hotword must reside. The total length of the window cannot exceed 1000 characters. Note that the finding itself will be included in the window, so that hotwords may be used to match substrings of the finding itself. For example, the certainty of a phone number regex `(\d{3}) \d{3}-\d{4}` could be adjusted upwards if the area code is known to be the local area code of a company office using the hotword regex `(xxx)`, where `xxx` is the area code in question. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_by_hotword_proximity). <a name="nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_by_hotword_hotword_regex"></a>The `hotword_regex` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pattern`
- Description: (Required) Pattern defining the regular expression. Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group_indexes`
- Description: (Optional) The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included. <a name="nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_by_hotword_proximity"></a>The `proximity` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `window_before`
- Description: (Optional) Number of characters before the finding to consider.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `window_after`
- Description: (Optional) Number of characters after the finding to consider. <a name="nested_inspect_config_custom_info_types"></a>The `custom_info_types` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `info_type`
- Description: (Required) CustomInfoType can either be a new infoType, or an extension of built-in infoType, when the name matches one of existing infoTypes and that infoType is specified in `info_types` field. Specifying the latter adds findings to the one detected by the system. If built-in info type is not specified in `info_types` list then the name is treated as a custom info type. Structure is [documented below](#nested_inspect_config_custom_info_types_custom_info_types_info_type).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `likelihood`
- Description: (Optional) Likelihood to return for this CustomInfoType. This base value can be altered by a detection rule if the finding meets the criteria specified by the rule. Default value is `VERY_LIKELY`. Possible values are: `VERY_UNLIKELY`, `UNLIKELY`, `POSSIBLE`, `LIKELY`, `VERY_LIKELY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclusion_type`
- Description: (Optional) If set to EXCLUSION_TYPE_EXCLUDE this infoType will not cause a finding to be returned. It still can be used for rules matching. Possible values are: `EXCLUSION_TYPE_EXCLUDE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sensitivity_score`
- Description: (Optional) Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_inspect_config_custom_info_types_custom_info_types_sensitivity_score).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regex`
- Description: (Optional) Regular expression which defines the rule. Structure is [documented below](#nested_inspect_config_custom_info_types_custom_info_types_regex).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dictionary`
- Description: (Optional) Dictionary which defines the rule. Structure is [documented below](#nested_inspect_config_custom_info_types_custom_info_types_dictionary).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `surrogate_type`
- Description: (Optional) Message for detecting output from deidentification transformations that support reversing.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stored_type`
- Description: (Optional) A reference to a StoredInfoType to use with scanning. Structure is [documented below](#nested_inspect_config_custom_info_types_custom_info_types_stored_type). <a name="nested_inspect_config_custom_info_types_custom_info_types_info_type"></a>The `info_type` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) Version name for this InfoType.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sensitivity_score`
- Description: (Optional) Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_inspect_config_custom_info_types_custom_info_types_info_type_sensitivity_score). <a name="nested_inspect_config_custom_info_types_custom_info_types_info_type_sensitivity_score"></a>The `sensitivity_score` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `score`
- Description: (Required) The sensitivity score applied to the resource. Possible values are: `SENSITIVITY_LOW`, `SENSITIVITY_MODERATE`, `SENSITIVITY_HIGH`. <a name="nested_inspect_config_custom_info_types_custom_info_types_sensitivity_score"></a>The `sensitivity_score` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `score`
- Description: (Required) The sensitivity score applied to the resource. Possible values are: `SENSITIVITY_LOW`, `SENSITIVITY_MODERATE`, `SENSITIVITY_HIGH`. <a name="nested_inspect_config_custom_info_types_custom_info_types_regex"></a>The `regex` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pattern`
- Description: (Required) Pattern defining the regular expression. Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group_indexes`
- Description: (Optional) The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included. <a name="nested_inspect_config_custom_info_types_custom_info_types_dictionary"></a>The `dictionary` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `word_list`
- Description: (Optional) List of words or phrases to search for. Structure is [documented below](#nested_inspect_config_custom_info_types_custom_info_types_dictionary_word_list).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_storage_path`
- Description: (Optional) Newline-delimited file of words in Cloud Storage. Only a single file is accepted. Structure is [documented below](#nested_inspect_config_custom_info_types_custom_info_types_dictionary_cloud_storage_path). <a name="nested_inspect_config_custom_info_types_custom_info_types_dictionary_word_list"></a>The `word_list` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `words`
- Description: (Required) Words or phrases defining the dictionary. The dictionary must contain at least one phrase and every phrase must contain at least 2 characters that are letters or digits. <a name="nested_inspect_config_custom_info_types_custom_info_types_dictionary_cloud_storage_path"></a>The `cloud_storage_path` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) A url representing a file or path (no wildcards) in Cloud Storage. Example: `gs://[BUCKET_NAME]/dictionary.txt` <a name="nested_inspect_config_custom_info_types_custom_info_types_stored_type"></a>The `stored_type` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Resource name of the requested StoredInfoType, for example `organizations/433245324/storedInfoTypes/432452342` or `projects/project-id/storedInfoTypes/432452342`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
