## 🛡️ Policy Deployment Engine: `data_loss_prevention_job_trigger`

This section provides a concise policy evaluation for the `data_loss_prevention_job_trigger` resource in GCP.

Reference: [Terraform Registry – data_loss_prevention_job_trigger](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_loss_prevention_job_trigger)

---

## 1. Argument Reference

### `triggers`
- Description: (Required) What event needs to occur for a new job to be started. Structure is [documented below](#nested_triggers).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Required) The parent of the trigger, either in the format `projects/{{project}}` or `projects/{{project}}/locations/{{location}}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description of the job trigger.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User set display name of the job trigger.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trigger_id`
- Description: (Optional) The trigger id can contain uppercase and lowercase letters, numbers, and hyphens; that is, it must match the regular expression: [a-zA-Z\d-_]+. The maximum length is 100 characters. Can be empty to allow the system to generate one.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `status`
- Description: (Optional) Whether the trigger is currently active. Default value is `HEALTHY`. Possible values are: `PAUSED`, `HEALTHY`, `CANCELLED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inspect_job`
- Description: (Optional) Controls what and how to inspect for findings. Structure is [documented below](#nested_inspect_job). <a name="nested_triggers"></a>The `triggers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule`
- Description: (Optional) Schedule for triggered jobs Structure is [documented below](#nested_triggers_triggers_schedule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `manual`
- Description: (Optional) For use with hybrid jobs. Jobs must be manually created and finished. <a name="nested_triggers_triggers_schedule"></a>The `schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `recurrence_period_duration`
- Description: (Optional) With this option a job is started a regular periodic basis. For example: every day (86400 seconds). A scheduled start time will be skipped if the previous execution has not ended when its scheduled time occurs. This value must be set to a time duration greater than or equal to 1 day and can be no longer than 60 days. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". <a name="nested_inspect_job"></a>The `inspect_job` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inspect_template_name`
- Description: (Optional) The name of the template to run when this job is triggered.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `inspect_config`
- Description: (Optional) The core content of the template. Structure is [documented below](#nested_inspect_job_inspect_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_config`
- Description: (Required) Information on where to inspect Structure is [documented below](#nested_inspect_job_storage_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `actions`
- Description: (Optional) Configuration block for the actions to execute on the completion of a job. Can be specified multiple times, but only one for each type. Each action block supports fields documented below. This argument is processed in [attribute-as-blocks mode](https://www.terraform.io/docs/configuration/attr-as-blocks.html). Structure is [documented below](#nested_inspect_job_actions). <a name="nested_inspect_job_inspect_config"></a>The `inspect_config` block supports:
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
- Description: (Optional) Configuration to control the number of findings returned. Structure is [documented below](#nested_inspect_job_inspect_config_limits).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `info_types`
- Description: (Optional) Restricts what infoTypes to look for. The values must correspond to InfoType values returned by infoTypes.list or listed at https://cloud.google.com/dlp/docs/infotypes-reference. When no InfoTypes or CustomInfoTypes are specified in a request, the system may automatically choose what detectors to run. By default this may be all types, but may change over time as detectors are updated. Structure is [documented below](#nested_inspect_job_inspect_config_info_types).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rule_set`
- Description: (Optional) Set of rules to apply to the findings for this InspectConfig. Exclusion rules, contained in the set are executed in the end, other rules are executed in the order they are specified for each info type. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_info_types`
- Description: (Optional) Custom info types to be used. See https://cloud.google.com/dlp/docs/creating-custom-infotypes to learn more. Structure is [documented below](#nested_inspect_job_inspect_config_custom_info_types). <a name="nested_inspect_job_inspect_config_limits"></a>The `limits` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_findings_per_item`
- Description: (Optional) Max number of findings that will be returned for each item scanned. The maximum returned is 2000.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_findings_per_request`
- Description: (Optional) Max number of findings that will be returned per request/job. The maximum returned is 2000.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_findings_per_info_type`
- Description: (Optional) Configuration of findings limit given for specified infoTypes. Structure is [documented below](#nested_inspect_job_inspect_config_limits_max_findings_per_info_type). <a name="nested_inspect_job_inspect_config_limits_max_findings_per_info_type"></a>The `max_findings_per_info_type` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `info_type`
- Description: (Optional) Type of information the findings limit applies to. Only one limit per infoType should be provided. If InfoTypeLimit does not have an infoType, the DLP API applies the limit against all infoTypes that are found but not specified in another InfoTypeLimit. Structure is [documented below](#nested_inspect_job_inspect_config_limits_max_findings_per_info_type_max_findings_per_info_type_info_type).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_findings`
- Description: (Optional) Max findings limit for the given infoType. <a name="nested_inspect_job_inspect_config_limits_max_findings_per_info_type_max_findings_per_info_type_info_type"></a>The `info_type` block supports:
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
- Description: (Optional) Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_inspect_job_inspect_config_limits_max_findings_per_info_type_max_findings_per_info_type_info_type_sensitivity_score). <a name="nested_inspect_job_inspect_config_limits_max_findings_per_info_type_max_findings_per_info_type_info_type_sensitivity_score"></a>The `sensitivity_score` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `score`
- Description: (Required) The sensitivity score applied to the resource. Possible values are: `SENSITIVITY_LOW`, `SENSITIVITY_MODERATE`, `SENSITIVITY_HIGH`. <a name="nested_inspect_job_inspect_config_info_types"></a>The `info_types` block supports:
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
- Description: (Optional) Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_inspect_job_inspect_config_info_types_info_types_sensitivity_score). <a name="nested_inspect_job_inspect_config_info_types_info_types_sensitivity_score"></a>The `sensitivity_score` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `score`
- Description: (Required) The sensitivity score applied to the resource. Possible values are: `SENSITIVITY_LOW`, `SENSITIVITY_MODERATE`, `SENSITIVITY_HIGH`. <a name="nested_inspect_job_inspect_config_rule_set"></a>The `rule_set` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `info_types`
- Description: (Optional) List of infoTypes this rule set is applied to. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_info_types).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rules`
- Description: (Required) Set of rules to be applied to infoTypes. The rules are applied in order. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules). <a name="nested_inspect_job_inspect_config_rule_set_rule_set_info_types"></a>The `info_types` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) Version of the information type to use. By default, the version is set to stable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sensitivity_score`
- Description: (Optional) Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_info_types_info_types_sensitivity_score). <a name="nested_inspect_job_inspect_config_rule_set_rule_set_info_types_info_types_sensitivity_score"></a>The `sensitivity_score` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `score`
- Description: (Required) The sensitivity score applied to the resource. Possible values are: `SENSITIVITY_LOW`, `SENSITIVITY_MODERATE`, `SENSITIVITY_HIGH`. <a name="nested_inspect_job_inspect_config_rule_set_rule_set_rules"></a>The `rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hotword_rule`
- Description: (Optional) Hotword-based detection rule. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_hotword_rule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclusion_rule`
- Description: (Optional) The rule that specifies conditions when findings of infoTypes specified in InspectionRuleSet are removed from results. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule). <a name="nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_hotword_rule"></a>The `hotword_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hotword_regex`
- Description: (Optional) Regular expression pattern defining what qualifies as a hotword. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_hotword_rule_hotword_regex).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proximity`
- Description: (Optional) Proximity of the finding within which the entire hotword must reside. The total length of the window cannot exceed 1000 characters. Note that the finding itself will be included in the window, so that hotwords may be used to match substrings of the finding itself. For example, the certainty of a phone number regex `(\d{3}) \d{3}-\d{4}` could be adjusted upwards if the area code is known to be the local area code of a company office using the hotword regex `(xxx)`, where `xxx` is the area code in question. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_hotword_rule_proximity).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `likelihood_adjustment`
- Description: (Optional) Likelihood adjustment to apply to all matching findings. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_hotword_rule_likelihood_adjustment). <a name="nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_hotword_rule_hotword_regex"></a>The `hotword_regex` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pattern`
- Description: (Optional) Pattern defining the regular expression. Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group_indexes`
- Description: (Optional) The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included. <a name="nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_hotword_rule_proximity"></a>The `proximity` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `window_before`
- Description: (Optional) Number of characters before the finding to consider. Either this or window_after must be specified
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `window_after`
- Description: (Optional) Number of characters after the finding to consider. Either this or window_before must be specified <a name="nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_hotword_rule_likelihood_adjustment"></a>The `likelihood_adjustment` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fixed_likelihood`
- Description: (Optional) Set the likelihood of a finding to a fixed value. Either this or relative_likelihood can be set. Possible values are: `VERY_UNLIKELY`, `UNLIKELY`, `POSSIBLE`, `LIKELY`, `VERY_LIKELY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `relative_likelihood`
- Description: (Optional) Increase or decrease the likelihood by the specified number of levels. For example, if a finding would be POSSIBLE without the detection rule and relativeLikelihood is 1, then it is upgraded to LIKELY, while a value of -1 would downgrade it to UNLIKELY. Likelihood may never drop below VERY_UNLIKELY or exceed VERY_LIKELY, so applying an adjustment of 1 followed by an adjustment of -1 when base likelihood is VERY_LIKELY will result in a final likelihood of LIKELY. Either this or fixed_likelihood can be set. <a name="nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule"></a>The `exclusion_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `matching_type`
- Description: (Required) How the rule is applied. See the documentation for more information: https://cloud.google.com/dlp/docs/reference/rest/v2/InspectConfig#MatchingType Possible values are: `MATCHING_TYPE_FULL_MATCH`, `MATCHING_TYPE_PARTIAL_MATCH`, `MATCHING_TYPE_INVERSE_MATCH`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dictionary`
- Description: (Optional) Dictionary which defines the rule. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_dictionary).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regex`
- Description: (Optional) Regular expression which defines the rule. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_regex).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_info_types`
- Description: (Optional) Set of infoTypes for which findings would affect this rule. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_info_types).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_by_hotword`
- Description: (Optional) Drop if the hotword rule is contained in the proximate context. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_by_hotword). <a name="nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_dictionary"></a>The `dictionary` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `word_list`
- Description: (Optional) List of words or phrases to search for. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_dictionary_word_list).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_storage_path`
- Description: (Optional) Newline-delimited file of words in Cloud Storage. Only a single file is accepted. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_dictionary_cloud_storage_path). <a name="nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_dictionary_word_list"></a>The `word_list` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `words`
- Description: (Required) Words or phrases defining the dictionary. The dictionary must contain at least one phrase and every phrase must contain at least 2 characters that are letters or digits. <a name="nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_dictionary_cloud_storage_path"></a>The `cloud_storage_path` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) A url representing a file or path (no wildcards) in Cloud Storage. Example: `gs://[BUCKET_NAME]/dictionary.txt` <a name="nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_regex"></a>The `regex` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pattern`
- Description: (Required) Pattern defining the regular expression. Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group_indexes`
- Description: (Optional) The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included. <a name="nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_info_types"></a>The `exclude_info_types` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `info_types`
- Description: (Required) If a finding is matched by any of the infoType detectors listed here, the finding will be excluded from the scan results. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_info_types_info_types). <a name="nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_info_types_info_types"></a>The `info_types` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) Version of the information type to use. By default, the version is set to stable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sensitivity_score`
- Description: (Optional) Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_info_types_info_types_info_types_sensitivity_score). <a name="nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_info_types_info_types_info_types_sensitivity_score"></a>The `sensitivity_score` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `score`
- Description: (Required) The sensitivity score applied to the resource. Possible values are: `SENSITIVITY_LOW`, `SENSITIVITY_MODERATE`, `SENSITIVITY_HIGH`. <a name="nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_by_hotword"></a>The `exclude_by_hotword` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hotword_regex`
- Description: (Optional) Regular expression pattern defining what qualifies as a hotword. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_by_hotword_hotword_regex).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proximity`
- Description: (Optional) Proximity of the finding within which the entire hotword must reside. The total length of the window cannot exceed 1000 characters. Note that the finding itself will be included in the window, so that hotwords may be used to match substrings of the finding itself. For example, the certainty of a phone number regex `(\d{3}) \d{3}-\d{4}` could be adjusted upwards if the area code is known to be the local area code of a company office using the hotword regex `(xxx)`, where `xxx` is the area code in question. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_by_hotword_proximity). <a name="nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_by_hotword_hotword_regex"></a>The `hotword_regex` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pattern`
- Description: (Optional) Pattern defining the regular expression. Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group_indexes`
- Description: (Optional) The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included. <a name="nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_by_hotword_proximity"></a>The `proximity` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `window_before`
- Description: (Optional) Number of characters before the finding to consider. Either this or window_after must be specified
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `window_after`
- Description: (Optional) Number of characters after the finding to consider. Either this or window_before must be specified <a name="nested_inspect_job_inspect_config_custom_info_types"></a>The `custom_info_types` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `info_type`
- Description: (Required) CustomInfoType can either be a new infoType, or an extension of built-in infoType, when the name matches one of existing infoTypes and that infoType is specified in `info_types` field. Specifying the latter adds findings to the one detected by the system. If built-in info type is not specified in `info_types` list then the name is treated as a custom info type. Structure is [documented below](#nested_inspect_job_inspect_config_custom_info_types_custom_info_types_info_type).
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
- Description: (Optional) Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_inspect_job_inspect_config_custom_info_types_custom_info_types_sensitivity_score).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regex`
- Description: (Optional) Regular expression which defines the rule. Structure is [documented below](#nested_inspect_job_inspect_config_custom_info_types_custom_info_types_regex).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dictionary`
- Description: (Optional) Dictionary which defines the rule. Structure is [documented below](#nested_inspect_job_inspect_config_custom_info_types_custom_info_types_dictionary).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stored_type`
- Description: (Optional) A reference to a StoredInfoType to use with scanning. Structure is [documented below](#nested_inspect_job_inspect_config_custom_info_types_custom_info_types_stored_type).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `surrogate_type`
- Description: (Optional) Message for detecting output from deidentification transformations that support reversing. <a name="nested_inspect_job_inspect_config_custom_info_types_custom_info_types_info_type"></a>The `info_type` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `version`
- Description: (Optional) Version of the information type to use. By default, the version is set to stable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sensitivity_score`
- Description: (Optional) Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_inspect_job_inspect_config_custom_info_types_custom_info_types_info_type_sensitivity_score). <a name="nested_inspect_job_inspect_config_custom_info_types_custom_info_types_info_type_sensitivity_score"></a>The `sensitivity_score` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `score`
- Description: (Required) The sensitivity score applied to the resource. Possible values are: `SENSITIVITY_LOW`, `SENSITIVITY_MODERATE`, `SENSITIVITY_HIGH`. <a name="nested_inspect_job_inspect_config_custom_info_types_custom_info_types_sensitivity_score"></a>The `sensitivity_score` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `score`
- Description: (Required) The sensitivity score applied to the resource. Possible values are: `SENSITIVITY_LOW`, `SENSITIVITY_MODERATE`, `SENSITIVITY_HIGH`. <a name="nested_inspect_job_inspect_config_custom_info_types_custom_info_types_regex"></a>The `regex` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pattern`
- Description: (Required) Pattern defining the regular expression. Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group_indexes`
- Description: (Optional) The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included. <a name="nested_inspect_job_inspect_config_custom_info_types_custom_info_types_dictionary"></a>The `dictionary` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `word_list`
- Description: (Optional) List of words or phrases to search for. Structure is [documented below](#nested_inspect_job_inspect_config_custom_info_types_custom_info_types_dictionary_word_list).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_storage_path`
- Description: (Optional) Newline-delimited file of words in Cloud Storage. Only a single file is accepted. Structure is [documented below](#nested_inspect_job_inspect_config_custom_info_types_custom_info_types_dictionary_cloud_storage_path). <a name="nested_inspect_job_inspect_config_custom_info_types_custom_info_types_dictionary_word_list"></a>The `word_list` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `words`
- Description: (Required) Words or phrases defining the dictionary. The dictionary must contain at least one phrase and every phrase must contain at least 2 characters that are letters or digits. <a name="nested_inspect_job_inspect_config_custom_info_types_custom_info_types_dictionary_cloud_storage_path"></a>The `cloud_storage_path` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) A url representing a file or path (no wildcards) in Cloud Storage. Example: `gs://[BUCKET_NAME]/dictionary.txt` <a name="nested_inspect_job_inspect_config_custom_info_types_custom_info_types_stored_type"></a>The `stored_type` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Resource name of the requested StoredInfoType, for example `organizations/433245324/storedInfoTypes/432452342` or `projects/project-id/storedInfoTypes/432452342`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_time`
- Description: (Output) The creation timestamp of an inspectTemplate. Set by the server. <a name="nested_inspect_job_storage_config"></a>The `storage_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timespan_config`
- Description: (Optional) Configuration of the timespan of the items to include in scanning Structure is [documented below](#nested_inspect_job_storage_config_timespan_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `datastore_options`
- Description: (Optional) Options defining a data set within Google Cloud Datastore. Structure is [documented below](#nested_inspect_job_storage_config_datastore_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_storage_options`
- Description: (Optional) Options defining a file or a set of files within a Google Cloud Storage bucket. Structure is [documented below](#nested_inspect_job_storage_config_cloud_storage_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `big_query_options`
- Description: (Optional) Options defining BigQuery table and row identifiers. Structure is [documented below](#nested_inspect_job_storage_config_big_query_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hybrid_options`
- Description: (Optional) Configuration to control jobs where the content being inspected is outside of Google Cloud Platform. Structure is [documented below](#nested_inspect_job_storage_config_hybrid_options). <a name="nested_inspect_job_storage_config_timespan_config"></a>The `timespan_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Optional) Exclude files, tables, or rows older than this value. If not set, no lower time limit is applied.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_time`
- Description: (Optional) Exclude files, tables, or rows newer than this value. If not set, no upper time limit is applied.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_auto_population_of_timespan_config`
- Description: (Optional) When the job is started by a JobTrigger we will automatically figure out a valid startTime to avoid scanning files that have not been modified since the last time the JobTrigger executed. This will be based on the time of the execution of the last run of the JobTrigger or the timespan endTime used in the last run of the JobTrigger.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timestamp_field`
- Description: (Optional) Specification of the field containing the timestamp of scanned items. Structure is [documented below](#nested_inspect_job_storage_config_timespan_config_timestamp_field). <a name="nested_inspect_job_storage_config_timespan_config_timestamp_field"></a>The `timestamp_field` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Specification of the field containing the timestamp of scanned items. Used for data sources like Datastore and BigQuery. For BigQuery: Required to filter out rows based on the given start and end times. If not specified and the table was modified between the given start and end times, the entire table will be scanned. The valid data types of the timestamp field are: INTEGER, DATE, TIMESTAMP, or DATETIME BigQuery column. For Datastore. Valid data types of the timestamp field are: TIMESTAMP. Datastore entity will be scanned if the timestamp property does not exist or its value is empty or invalid. <a name="nested_inspect_job_storage_config_datastore_options"></a>The `datastore_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `partition_id`
- Description: (Required) Datastore partition ID. A partition ID identifies a grouping of entities. The grouping is always by project and namespace, however the namespace ID may be empty. Structure is [documented below](#nested_inspect_job_storage_config_datastore_options_partition_id).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kind`
- Description: (Required) A representation of a Datastore kind. Structure is [documented below](#nested_inspect_job_storage_config_datastore_options_kind). <a name="nested_inspect_job_storage_config_datastore_options_partition_id"></a>The `partition_id` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) The ID of the project to which the entities belong.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespace_id`
- Description: (Optional) If not empty, the ID of the namespace to which the entities belong. <a name="nested_inspect_job_storage_config_datastore_options_kind"></a>The `kind` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the Datastore kind. <a name="nested_inspect_job_storage_config_cloud_storage_options"></a>The `cloud_storage_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_set`
- Description: (Required) Set of files to scan. Structure is [documented below](#nested_inspect_job_storage_config_cloud_storage_options_file_set).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bytes_limit_per_file`
- Description: (Optional) Max number of bytes to scan from a file. If a scanned file's size is bigger than this value then the rest of the bytes are omitted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bytes_limit_per_file_percent`
- Description: (Optional) Max percentage of bytes to scan from a file. The rest are omitted. The number of bytes scanned is rounded down. Must be between 0 and 100, inclusively. Both 0 and 100 means no limit.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `files_limit_percent`
- Description: (Optional) Limits the number of files to scan to this percentage of the input FileSet. Number of files scanned is rounded down. Must be between 0 and 100, inclusively. Both 0 and 100 means no limit.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_types`
- Description: (Optional) List of file type groups to include in the scan. If empty, all files are scanned and available data format processors are applied. In addition, the binary content of the selected files is always scanned as well. Images are scanned only as binary if the specified region does not support image inspection and no fileTypes were specified. Each value may be one of: `BINARY_FILE`, `TEXT_FILE`, `IMAGE`, `WORD`, `PDF`, `AVRO`, `CSV`, `TSV`, `POWERPOINT`, `EXCEL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sample_method`
- Description: (Optional) How to sample bytes if not all bytes are scanned. Meaningful only when used in conjunction with bytesLimitPerFile. If not specified, scanning would start from the top. Possible values are: `TOP`, `RANDOM_START`. <a name="nested_inspect_job_storage_config_cloud_storage_options_file_set"></a>The `file_set` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `url`
- Description: (Optional) The Cloud Storage url of the file(s) to scan, in the format `gs://<bucket>/<path>`. Trailing wildcard in the path is allowed. If the url ends in a trailing slash, the bucket or directory represented by the url will be scanned non-recursively (content in sub-directories will not be scanned). This means that `gs://mybucket/` is equivalent to `gs://mybucket/*`, and `gs://mybucket/directory/` is equivalent to `gs://mybucket/directory/*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `regex_file_set`
- Description: (Optional) The regex-filtered set of files to scan. Structure is [documented below](#nested_inspect_job_storage_config_cloud_storage_options_file_set_regex_file_set). <a name="nested_inspect_job_storage_config_cloud_storage_options_file_set_regex_file_set"></a>The `regex_file_set` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bucket_name`
- Description: (Required) The name of a Cloud Storage bucket.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_regex`
- Description: (Optional) A list of regular expressions matching file paths to include. All files in the bucket that match at least one of these regular expressions will be included in the set of files, except for those that also match an item in excludeRegex. Leaving this field empty will match all files by default (this is equivalent to including .* in the list)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclude_regex`
- Description: (Optional) A list of regular expressions matching file paths to exclude. All files in the bucket that match at least one of these regular expressions will be excluded from the scan. <a name="nested_inspect_job_storage_config_big_query_options"></a>The `big_query_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_reference`
- Description: (Required) Set of files to scan. Structure is [documented below](#nested_inspect_job_storage_config_big_query_options_table_reference).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rows_limit`
- Description: (Optional) Max number of rows to scan. If the table has more rows than this value, the rest of the rows are omitted. If not set, or if set to 0, all rows will be scanned. Only one of rowsLimit and rowsLimitPercent can be specified. Cannot be used in conjunction with TimespanConfig.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rows_limit_percent`
- Description: (Optional) Max percentage of rows to scan. The rest are omitted. The number of rows scanned is rounded down. Must be between 0 and 100, inclusively. Both 0 and 100 means no limit. Defaults to 0. Only one of rowsLimit and rowsLimitPercent can be specified. Cannot be used in conjunction with TimespanConfig.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sample_method`
- Description: (Optional) How to sample rows if not all rows are scanned. Meaningful only when used in conjunction with either rowsLimit or rowsLimitPercent. If not specified, rows are scanned in the order BigQuery reads them. If TimespanConfig is set, set this to an empty string to avoid using the default value. Default value is `TOP`. Possible values are: `TOP`, `RANDOM_START`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `identifying_fields`
- Description: (Optional) Specifies the BigQuery fields that will be returned with findings. If not specified, no identifying fields will be returned for findings. Structure is [documented below](#nested_inspect_job_storage_config_big_query_options_identifying_fields).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `included_fields`
- Description: (Optional) Limit scanning only to these fields. Structure is [documented below](#nested_inspect_job_storage_config_big_query_options_included_fields).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `excluded_fields`
- Description: (Optional) References to fields excluded from scanning. This allows you to skip inspection of entire columns which you know have no findings. Structure is [documented below](#nested_inspect_job_storage_config_big_query_options_excluded_fields). <a name="nested_inspect_job_storage_config_big_query_options_table_reference"></a>The `table_reference` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) The Google Cloud Platform project ID of the project containing the table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Required) The dataset ID of the table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_id`
- Description: (Required) The name of the table. <a name="nested_inspect_job_storage_config_big_query_options_identifying_fields"></a>The `identifying_fields` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of a BigQuery field to be returned with the findings. <a name="nested_inspect_job_storage_config_big_query_options_included_fields"></a>The `included_fields` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name describing the field to which scanning is limited. <a name="nested_inspect_job_storage_config_big_query_options_excluded_fields"></a>The `excluded_fields` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name describing the field excluded from scanning. <a name="nested_inspect_job_storage_config_hybrid_options"></a>The `hybrid_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A short description of where the data is coming from. Will be stored once in the job. 256 max length.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `required_finding_label_keys`
- Description: (Optional) These are labels that each inspection request must include within their 'finding_labels' map. Request may contain others, but any missing one of these will be rejected. Label keys must be between 1 and 63 characters long and must conform to the following regular expression: `[a-z]([-a-z0-9]*[a-z0-9])?`. No more than 10 keys can be required.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_options`
- Description: (Optional) If the container is a table, additional information to make findings meaningful such as the columns that are primary keys. Structure is [documented below](#nested_inspect_job_storage_config_hybrid_options_table_options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) To organize findings, these labels will be added to each finding. Label keys must be between 1 and 63 characters long and must conform to the following regular expression: `[a-z]([-a-z0-9]*[a-z0-9])?`. Label values must be between 0 and 63 characters long and must conform to the regular expression `([a-z]([-a-z0-9]*[a-z0-9])?)?`. No more than 10 labels can be associated with a given finding. Examples:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `identifying_fields`
- Description: (Optional) The columns that are the primary keys for table objects included in ContentItem. A copy of this cell's value will stored alongside alongside each finding so that the finding can be traced to the specific row it came from. No more than 3 may be provided. Structure is [documented below](#nested_inspect_job_storage_config_hybrid_options_table_options_identifying_fields). <a name="nested_inspect_job_storage_config_hybrid_options_table_options_identifying_fields"></a>The `identifying_fields` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name describing the field. <a name="nested_inspect_job_actions"></a>The `actions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `save_findings`
- Description: (Optional) If set, the detailed findings will be persisted to the specified OutputStorageConfig. Only a single instance of this action can be specified. Compatible with: Inspect, Risk Structure is [documented below](#nested_inspect_job_actions_actions_save_findings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pub_sub`
- Description: (Optional) Publish a message into a given Pub/Sub topic when the job completes. Structure is [documented below](#nested_inspect_job_actions_actions_pub_sub).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `publish_summary_to_cscc`
- Description: (Optional) Publish the result summary of a DlpJob to the Cloud Security Command Center.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `publish_findings_to_cloud_data_catalog`
- Description: (Optional) Publish findings of a DlpJob to Data Catalog.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `job_notification_emails`
- Description: (Optional) Sends an email when the job completes. The email goes to IAM project owners and technical Essential Contacts.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deidentify`
- Description: (Optional) Create a de-identified copy of the requested table or files. Structure is [documented below](#nested_inspect_job_actions_actions_deidentify).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `publish_to_stackdriver`
- Description: (Optional) Enable Stackdriver metric dlp.googleapis.com/findingCount. <a name="nested_inspect_job_actions_actions_save_findings"></a>The `save_findings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `output_config`
- Description: (Required) Information on where to store output Structure is [documented below](#nested_inspect_job_actions_actions_save_findings_output_config). <a name="nested_inspect_job_actions_actions_save_findings_output_config"></a>The `output_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table`
- Description: (Required) Information on the location of the target BigQuery Table. Structure is [documented below](#nested_inspect_job_actions_actions_save_findings_output_config_table).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `output_schema`
- Description: (Optional) Schema used for writing the findings for Inspect jobs. This field is only used for Inspect and must be unspecified for Risk jobs. Columns are derived from the Finding object. If appending to an existing table, any columns from the predefined schema that are missing will be added. No columns in the existing table will be deleted. If unspecified, then all available columns will be used for a new table or an (existing) table with no schema, and no changes will be made to an existing table that has a schema. Only for use with external storage. Possible values are: `BASIC_COLUMNS`, `GCS_COLUMNS`, `DATASTORE_COLUMNS`, `BIG_QUERY_COLUMNS`, `ALL_COLUMNS`. <a name="nested_inspect_job_actions_actions_save_findings_output_config_table"></a>The `table` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) The Google Cloud Platform project ID of the project containing the table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Required) Dataset ID of the table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_id`
- Description: (Optional) Name of the table. If is not set a new one will be generated for you with the following format: `dlp_googleapis_yyyy_mm_dd_[dlp_job_id]`. Pacific timezone will be used for generating the date details. <a name="nested_inspect_job_actions_actions_pub_sub"></a>The `pub_sub` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `topic`
- Description: (Required) Cloud Pub/Sub topic to send notifications to. <a name="nested_inspect_job_actions_actions_deidentify"></a>The `deidentify` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cloud_storage_output`
- Description: (Required) User settable Cloud Storage bucket and folders to store de-identified files. This field must be set for cloud storage deidentification. The output Cloud Storage bucket must be different from the input bucket. De-identified files will overwrite files in the output path. Form of: gs://bucket/folder/ or gs://bucket
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_types_to_transform`
- Description: (Optional) List of user-specified file type groups to transform. If specified, only the files with these filetypes will be transformed. If empty, all supported files will be transformed. Supported types may be automatically added over time. If a file type is set in this field that isn't supported by the Deidentify action then the job will fail and will not be successfully created/started. Each value may be one of: `IMAGE`, `TEXT_FILE`, `CSV`, `TSV`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transformation_config`
- Description: (Optional) User specified deidentify templates and configs for structured, unstructured, and image files. Structure is [documented below](#nested_inspect_job_actions_actions_deidentify_transformation_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transformation_details_storage_config`
- Description: (Optional) Config for storing transformation details. Structure is [documented below](#nested_inspect_job_actions_actions_deidentify_transformation_details_storage_config). <a name="nested_inspect_job_actions_actions_deidentify_transformation_config"></a>The `transformation_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deidentify_template`
- Description: (Optional) If this template is specified, it will serve as the default de-identify template.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `structured_deidentify_template`
- Description: (Optional) If this template is specified, it will serve as the de-identify template for structured content such as delimited files and tables.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image_redact_template`
- Description: (Optional) If this template is specified, it will serve as the de-identify template for images. <a name="nested_inspect_job_actions_actions_deidentify_transformation_details_storage_config"></a>The `transformation_details_storage_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table`
- Description: (Required) The BigQuery table in which to store the output. Structure is [documented below](#nested_inspect_job_actions_actions_deidentify_transformation_details_storage_config_table). <a name="nested_inspect_job_actions_actions_deidentify_transformation_details_storage_config_table"></a>The `table` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset_id`
- Description: (Required) The ID of the dataset containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Required) The ID of the project containing this table.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_id`
- Description: (Optional) The ID of the table. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
