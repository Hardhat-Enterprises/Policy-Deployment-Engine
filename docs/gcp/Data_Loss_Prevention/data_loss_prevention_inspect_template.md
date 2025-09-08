## 🛡️ Policy Deployment Engine: `data_loss_prevention_inspect_template`

This section provides a concise policy evaluation for the `data_loss_prevention_inspect_template` resource in GCP.

Reference: [Terraform Registry – data_loss_prevention_inspect_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_loss_prevention_inspect_template)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parent` | The parent of the inspect template in any of the following formats: * `projects/{{project}}` * `projects/{{project}}/locations/{{location}}` * `organizations/{{organization_id}}` * `organizations/{{organization_id}}/locations/{{location}}` | true | None | None |
| `description` | A description of the inspect template. | false | None | None |
| `display_name` | User set display name of the inspect template. | false | None | None |
| `template_id` | The template id can contain uppercase and lowercase letters, numbers, and hyphens; that is, it must match the regular expression: [a-zA-Z\d-_]+. The maximum length is 100 characters. Can be empty to allow the system to generate one. | false | None | None |

### inspect_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `exclude_info_types` | When true, excludes type information of the findings. | false | None | None |
| `include_quote` | When true, a contextual quote from the data that triggered a finding is included in the response. | false | None | None |
| `min_likelihood` | Only returns findings equal or above this threshold. See https://cloud.google.com/dlp/docs/likelihood for more info Default value is `POSSIBLE`. Possible values are: `VERY_UNLIKELY`, `UNLIKELY`, `POSSIBLE`, `LIKELY`, `VERY_LIKELY`. | false | None | None |
| `limits` | Configuration to control the number of findings returned. Structure is [documented below](#nested_inspect_config_limits). | false | None | None |
| `info_types` | Restricts what infoTypes to look for. The values must correspond to InfoType values returned by infoTypes.list or listed at https://cloud.google.com/dlp/docs/infotypes-reference. When no InfoTypes or CustomInfoTypes are specified in a request, the system may automatically choose what detectors to run. By default this may be all types, but may change over time as detectors are updated. Structure is [documented below](#nested_inspect_config_info_types). | false | None | None |
| `content_options` | List of options defining data content to scan. If empty, text, images, and other content will be included. Each value may be one of: `CONTENT_TEXT`, `CONTENT_IMAGE`. | false | None | None |
| `rule_set` | Set of rules to apply to the findings for this InspectConfig. Exclusion rules, contained in the set are executed in the end, other rules are executed in the order they are specified for each info type. Structure is [documented below](#nested_inspect_config_rule_set). | false | None | None |
| `custom_info_types` | Custom info types to be used. See https://cloud.google.com/dlp/docs/creating-custom-infotypes to learn more. Structure is [documented below](#nested_inspect_config_custom_info_types). | false | None | None |

### limits Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_findings_per_item` | Max number of findings that will be returned for each item scanned. The maximum returned is 2000. | true | None | None |
| `max_findings_per_request` | Max number of findings that will be returned per request/job. The maximum returned is 2000. | true | None | None |
| `max_findings_per_info_type` | Configuration of findings limit given for specified infoTypes. Structure is [documented below](#nested_inspect_config_limits_max_findings_per_info_type). | false | None | None |

### max_findings_per_info_type Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `info_type` | Type of information the findings limit applies to. Only one limit per infoType should be provided. If InfoTypeLimit does not have an infoType, the DLP API applies the limit against all infoTypes that are found but not specified in another InfoTypeLimit. Structure is [documented below](#nested_inspect_config_limits_max_findings_per_info_type_max_findings_per_info_type_info_type). | false | None | None |
| `max_findings` | Max findings limit for the given infoType. | true | None | None |

### info_type Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type. | true | None | None |
| `version` | Version name for this InfoType. | false | None | None |
| `sensitivity_score` | Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_inspect_config_custom_info_types_custom_info_types_info_type_sensitivity_score). | false | None | None |

### sensitivity_score Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `score` | The sensitivity score applied to the resource. Possible values are: `SENSITIVITY_LOW`, `SENSITIVITY_MODERATE`, `SENSITIVITY_HIGH`. | true | None | None |

### info_types Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type. | true | None | None |
| `version` | Version name for this InfoType. | false | None | None |
| `sensitivity_score` | Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_info_types_info_types_info_types_sensitivity_score). | false | None | None |

### rule_set Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `info_types` | List of infoTypes this rule set is applied to. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_info_types). | true | None | None |
| `rules` | Set of rules to be applied to infoTypes. The rules are applied in order. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules). | true | None | None |

### rules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hotword_rule` | Hotword-based detection rule. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_hotword_rule). | false | None | None |
| `exclusion_rule` | The rule that specifies conditions when findings of infoTypes specified in InspectionRuleSet are removed from results. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule). | false | None | None |

### hotword_rule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hotword_regex` | Regular expression pattern defining what qualifies as a hotword. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_hotword_rule_hotword_regex). | true | None | None |
| `proximity` | Proximity of the finding within which the entire hotword must reside. The total length of the window cannot exceed 1000 characters. Note that the finding itself will be included in the window, so that hotwords may be used to match substrings of the finding itself. For example, the certainty of a phone number regex `(\d{3}) \d{3}-\d{4}` could be adjusted upwards if the area code is known to be the local area code of a company office using the hotword regex `(xxx)`, where `xxx` is the area code in question. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_hotword_rule_proximity). | true | None | None |
| `likelihood_adjustment` | Likelihood adjustment to apply to all matching findings. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_hotword_rule_likelihood_adjustment). | true | None | None |

### hotword_regex Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pattern` | Pattern defining the regular expression. Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub. | true | None | None |
| `group_indexes` | The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included. | false | None | None |

### proximity Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `window_before` | Number of characters before the finding to consider. | false | None | None |
| `window_after` | Number of characters after the finding to consider. | false | None | None |

### likelihood_adjustment Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `fixed_likelihood` | Set the likelihood of a finding to a fixed value. Either this or relative_likelihood can be set. Possible values are: `VERY_UNLIKELY`, `UNLIKELY`, `POSSIBLE`, `LIKELY`, `VERY_LIKELY`. | false | None | None |
| `relative_likelihood` | Increase or decrease the likelihood by the specified number of levels. For example, if a finding would be POSSIBLE without the detection rule and relativeLikelihood is 1, then it is upgraded to LIKELY, while a value of -1 would downgrade it to UNLIKELY. Likelihood may never drop below VERY_UNLIKELY or exceed VERY_LIKELY, so applying an adjustment of 1 followed by an adjustment of -1 when base likelihood is VERY_LIKELY will result in a final likelihood of LIKELY. Either this or fixed_likelihood can be set. | false | None | None |

### exclusion_rule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `matching_type` | How the rule is applied. See the documentation for more information: https://cloud.google.com/dlp/docs/reference/rest/v2/InspectConfig#MatchingType Possible values are: `MATCHING_TYPE_FULL_MATCH`, `MATCHING_TYPE_PARTIAL_MATCH`, `MATCHING_TYPE_INVERSE_MATCH`. | true | None | None |
| `dictionary` | Dictionary which defines the rule. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_dictionary). | false | None | None |
| `regex` | Regular expression which defines the rule. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_regex). | false | None | None |
| `exclude_info_types` | Set of infoTypes for which findings would affect this rule. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_info_types). | false | None | None |
| `exclude_by_hotword` | Drop if the hotword rule is contained in the proximate context. For tabular data, the context includes the column name. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_by_hotword). | false | None | None |

### dictionary Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `word_list` | List of words or phrases to search for. Structure is [documented below](#nested_inspect_config_custom_info_types_custom_info_types_dictionary_word_list). | false | None | None |
| `cloud_storage_path` | Newline-delimited file of words in Cloud Storage. Only a single file is accepted. Structure is [documented below](#nested_inspect_config_custom_info_types_custom_info_types_dictionary_cloud_storage_path). | false | None | None |

### word_list Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `words` | Words or phrases defining the dictionary. The dictionary must contain at least one phrase and every phrase must contain at least 2 characters that are letters or digits. | true | None | None |

### cloud_storage_path Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `path` | A url representing a file or path (no wildcards) in Cloud Storage. Example: `gs://[BUCKET_NAME]/dictionary.txt` | true | None | None |

### regex Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pattern` | Pattern defining the regular expression. Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub. | true | None | None |
| `group_indexes` | The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included. | false | None | None |

### exclude_info_types Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `info_types` | If a finding is matched by any of the infoType detectors listed here, the finding will be excluded from the scan results. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_info_types_info_types). | true | None | None |

### exclude_by_hotword Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hotword_regex` | Regular expression pattern defining what qualifies as a hotword. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_by_hotword_hotword_regex). | true | None | None |
| `proximity` | Proximity of the finding within which the entire hotword must reside. The total length of the window cannot exceed 1000 characters. Note that the finding itself will be included in the window, so that hotwords may be used to match substrings of the finding itself. For example, the certainty of a phone number regex `(\d{3}) \d{3}-\d{4}` could be adjusted upwards if the area code is known to be the local area code of a company office using the hotword regex `(xxx)`, where `xxx` is the area code in question. Structure is [documented below](#nested_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_by_hotword_proximity). | true | None | None |

### custom_info_types Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `info_type` | CustomInfoType can either be a new infoType, or an extension of built-in infoType, when the name matches one of existing infoTypes and that infoType is specified in `info_types` field. Specifying the latter adds findings to the one detected by the system. If built-in info type is not specified in `info_types` list then the name is treated as a custom info type. Structure is [documented below](#nested_inspect_config_custom_info_types_custom_info_types_info_type). | true | None | None |
| `likelihood` | Likelihood to return for this CustomInfoType. This base value can be altered by a detection rule if the finding meets the criteria specified by the rule. Default value is `VERY_LIKELY`. Possible values are: `VERY_UNLIKELY`, `UNLIKELY`, `POSSIBLE`, `LIKELY`, `VERY_LIKELY`. | false | None | None |
| `exclusion_type` | If set to EXCLUSION_TYPE_EXCLUDE this infoType will not cause a finding to be returned. It still can be used for rules matching. Possible values are: `EXCLUSION_TYPE_EXCLUDE`. | false | None | None |
| `sensitivity_score` | Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_inspect_config_custom_info_types_custom_info_types_sensitivity_score). | false | None | None |
| `regex` | Regular expression which defines the rule. Structure is [documented below](#nested_inspect_config_custom_info_types_custom_info_types_regex). | false | None | None |
| `dictionary` | Dictionary which defines the rule. Structure is [documented below](#nested_inspect_config_custom_info_types_custom_info_types_dictionary). | false | None | None |
| `surrogate_type` | Message for detecting output from deidentification transformations that support reversing. | false | None | None |
| `stored_type` | A reference to a StoredInfoType to use with scanning. Structure is [documented below](#nested_inspect_config_custom_info_types_custom_info_types_stored_type). | false | None | None |

### stored_type Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Resource name of the requested StoredInfoType, for example `organizations/433245324/storedInfoTypes/432452342` or `projects/project-id/storedInfoTypes/432452342`. | true | None | None |
