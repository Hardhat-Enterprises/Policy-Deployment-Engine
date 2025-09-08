## 🛡️ Policy Deployment Engine: `data_loss_prevention_job_trigger`

This section provides a concise policy evaluation for the `data_loss_prevention_job_trigger` resource in GCP.

Reference: [Terraform Registry – data_loss_prevention_job_trigger](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_loss_prevention_job_trigger)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `parent` | The parent of the trigger, either in the format `projects/{{project}}` or `projects/{{project}}/locations/{{location}}` | true | None | None |
| `description` | A description of the job trigger. | false | None | None |
| `display_name` | User set display name of the job trigger. | false | None | None |
| `trigger_id` | The trigger id can contain uppercase and lowercase letters, numbers, and hyphens; that is, it must match the regular expression: [a-zA-Z\d-_]+. The maximum length is 100 characters. Can be empty to allow the system to generate one. | false | None | None |
| `status` | Whether the trigger is currently active. Default value is `HEALTHY`. Possible values are: `PAUSED`, `HEALTHY`, `CANCELLED`. | false | None | None |

### triggers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `schedule` | Schedule for triggered jobs Structure is [documented below](#nested_triggers_triggers_schedule). | false | None | None |
| `manual` | For use with hybrid jobs. Jobs must be manually created and finished. | false | None | None |

### inspect_job Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `inspect_template_name` | The name of the template to run when this job is triggered. | false | None | None |
| `inspect_config` | The core content of the template. Structure is [documented below](#nested_inspect_job_inspect_config). | false | None | None |
| `storage_config` | Information on where to inspect Structure is [documented below](#nested_inspect_job_storage_config). | true | None | None |
| `actions` | Configuration block for the actions to execute on the completion of a job. Can be specified multiple times, but only one for each type. Each action block supports fields documented below. This argument is processed in [attribute-as-blocks mode](https://www.terraform.io/docs/configuration/attr-as-blocks.html). Structure is [documented below](#nested_inspect_job_actions). | false | None | None |

### schedule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `recurrence_period_duration` | With this option a job is started a regular periodic basis. For example: every day (86400 seconds). A scheduled start time will be skipped if the previous execution has not ended when its scheduled time occurs. This value must be set to a time duration greater than or equal to 1 day and can be no longer than 60 days. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | None | None |

### inspect_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `exclude_info_types` | When true, excludes type information of the findings. | false | None | None |
| `include_quote` | When true, a contextual quote from the data that triggered a finding is included in the response. | false | None | None |
| `min_likelihood` | Only returns findings equal or above this threshold. See https://cloud.google.com/dlp/docs/likelihood for more info Default value is `POSSIBLE`. Possible values are: `VERY_UNLIKELY`, `UNLIKELY`, `POSSIBLE`, `LIKELY`, `VERY_LIKELY`. | false | None | None |
| `limits` | Configuration to control the number of findings returned. Structure is [documented below](#nested_inspect_job_inspect_config_limits). | false | None | None |
| `info_types` | Restricts what infoTypes to look for. The values must correspond to InfoType values returned by infoTypes.list or listed at https://cloud.google.com/dlp/docs/infotypes-reference. When no InfoTypes or CustomInfoTypes are specified in a request, the system may automatically choose what detectors to run. By default this may be all types, but may change over time as detectors are updated. Structure is [documented below](#nested_inspect_job_inspect_config_info_types). | false | None | None |
| `rule_set` | Set of rules to apply to the findings for this InspectConfig. Exclusion rules, contained in the set are executed in the end, other rules are executed in the order they are specified for each info type. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set). | false | None | None |
| `custom_info_types` | Custom info types to be used. See https://cloud.google.com/dlp/docs/creating-custom-infotypes to learn more. Structure is [documented below](#nested_inspect_job_inspect_config_custom_info_types). | false | None | None |

### limits Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_findings_per_item` | Max number of findings that will be returned for each item scanned. The maximum returned is 2000. | false | None | None |
| `max_findings_per_request` | Max number of findings that will be returned per request/job. The maximum returned is 2000. | false | None | None |
| `max_findings_per_info_type` | Configuration of findings limit given for specified infoTypes. Structure is [documented below](#nested_inspect_job_inspect_config_limits_max_findings_per_info_type). | false | None | None |

### max_findings_per_info_type Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `info_type` | Type of information the findings limit applies to. Only one limit per infoType should be provided. If InfoTypeLimit does not have an infoType, the DLP API applies the limit against all infoTypes that are found but not specified in another InfoTypeLimit. Structure is [documented below](#nested_inspect_job_inspect_config_limits_max_findings_per_info_type_max_findings_per_info_type_info_type). | false | None | None |
| `max_findings` | Max findings limit for the given infoType. | false | None | None |

### info_type Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type. | true | None | None |
| `version` | Version of the information type to use. By default, the version is set to stable. | false | None | None |
| `sensitivity_score` | Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_inspect_job_inspect_config_custom_info_types_custom_info_types_info_type_sensitivity_score). | false | None | None |

### sensitivity_score Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `score` | The sensitivity score applied to the resource. Possible values are: `SENSITIVITY_LOW`, `SENSITIVITY_MODERATE`, `SENSITIVITY_HIGH`. | true | None | None |

### info_types Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the information type. Either a name of your choosing when creating a CustomInfoType, or one of the names listed at https://cloud.google.com/dlp/docs/infotypes-reference when specifying a built-in type. | true | None | None |
| `version` | Version of the information type to use. By default, the version is set to stable. | false | None | None |
| `sensitivity_score` | Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_info_types_info_types_info_types_sensitivity_score). | false | None | None |

### rule_set Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `info_types` | List of infoTypes this rule set is applied to. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_info_types). | false | None | None |
| `rules` | Set of rules to be applied to infoTypes. The rules are applied in order. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules). | true | None | None |

### rules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hotword_rule` | Hotword-based detection rule. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_hotword_rule). | false | None | None |
| `exclusion_rule` | The rule that specifies conditions when findings of infoTypes specified in InspectionRuleSet are removed from results. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule). | false | None | None |

### hotword_rule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hotword_regex` | Regular expression pattern defining what qualifies as a hotword. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_hotword_rule_hotword_regex). | false | None | None |
| `proximity` | Proximity of the finding within which the entire hotword must reside. The total length of the window cannot exceed 1000 characters. Note that the finding itself will be included in the window, so that hotwords may be used to match substrings of the finding itself. For example, the certainty of a phone number regex `(\d{3}) \d{3}-\d{4}` could be adjusted upwards if the area code is known to be the local area code of a company office using the hotword regex `(xxx)`, where `xxx` is the area code in question. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_hotword_rule_proximity). | false | None | None |
| `likelihood_adjustment` | Likelihood adjustment to apply to all matching findings. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_hotword_rule_likelihood_adjustment). | false | None | None |

### hotword_regex Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `pattern` | Pattern defining the regular expression. Its syntax (https://github.com/google/re2/wiki/Syntax) can be found under the google/re2 repository on GitHub. | false | None | None |
| `group_indexes` | The index of the submatch to extract as findings. When not specified, the entire match is returned. No more than 3 may be included. | false | None | None |

### proximity Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `window_before` | Number of characters before the finding to consider. Either this or window_after must be specified | false | None | None |
| `window_after` | Number of characters after the finding to consider. Either this or window_before must be specified | false | None | None |

### likelihood_adjustment Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `fixed_likelihood` | Set the likelihood of a finding to a fixed value. Either this or relative_likelihood can be set. Possible values are: `VERY_UNLIKELY`, `UNLIKELY`, `POSSIBLE`, `LIKELY`, `VERY_LIKELY`. | false | None | None |
| `relative_likelihood` | Increase or decrease the likelihood by the specified number of levels. For example, if a finding would be POSSIBLE without the detection rule and relativeLikelihood is 1, then it is upgraded to LIKELY, while a value of -1 would downgrade it to UNLIKELY. Likelihood may never drop below VERY_UNLIKELY or exceed VERY_LIKELY, so applying an adjustment of 1 followed by an adjustment of -1 when base likelihood is VERY_LIKELY will result in a final likelihood of LIKELY. Either this or fixed_likelihood can be set. | false | None | None |

### exclusion_rule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `matching_type` | How the rule is applied. See the documentation for more information: https://cloud.google.com/dlp/docs/reference/rest/v2/InspectConfig#MatchingType Possible values are: `MATCHING_TYPE_FULL_MATCH`, `MATCHING_TYPE_PARTIAL_MATCH`, `MATCHING_TYPE_INVERSE_MATCH`. | true | None | None |
| `dictionary` | Dictionary which defines the rule. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_dictionary). | false | None | None |
| `regex` | Regular expression which defines the rule. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_regex). | false | None | None |
| `exclude_info_types` | Set of infoTypes for which findings would affect this rule. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_info_types). | false | None | None |
| `exclude_by_hotword` | Drop if the hotword rule is contained in the proximate context. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_by_hotword). | false | None | None |

### dictionary Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `word_list` | List of words or phrases to search for. Structure is [documented below](#nested_inspect_job_inspect_config_custom_info_types_custom_info_types_dictionary_word_list). | false | None | None |
| `cloud_storage_path` | Newline-delimited file of words in Cloud Storage. Only a single file is accepted. Structure is [documented below](#nested_inspect_job_inspect_config_custom_info_types_custom_info_types_dictionary_cloud_storage_path). | false | None | None |

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
| `info_types` | If a finding is matched by any of the infoType detectors listed here, the finding will be excluded from the scan results. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_info_types_info_types). | true | None | None |

### exclude_by_hotword Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hotword_regex` | Regular expression pattern defining what qualifies as a hotword. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_by_hotword_hotword_regex). | false | None | None |
| `proximity` | Proximity of the finding within which the entire hotword must reside. The total length of the window cannot exceed 1000 characters. Note that the finding itself will be included in the window, so that hotwords may be used to match substrings of the finding itself. For example, the certainty of a phone number regex `(\d{3}) \d{3}-\d{4}` could be adjusted upwards if the area code is known to be the local area code of a company office using the hotword regex `(xxx)`, where `xxx` is the area code in question. Structure is [documented below](#nested_inspect_job_inspect_config_rule_set_rule_set_rules_rules_exclusion_rule_exclude_by_hotword_proximity). | false | None | None |

### custom_info_types Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `info_type` | CustomInfoType can either be a new infoType, or an extension of built-in infoType, when the name matches one of existing infoTypes and that infoType is specified in `info_types` field. Specifying the latter adds findings to the one detected by the system. If built-in info type is not specified in `info_types` list then the name is treated as a custom info type. Structure is [documented below](#nested_inspect_job_inspect_config_custom_info_types_custom_info_types_info_type). | true | None | None |
| `likelihood` | Likelihood to return for this CustomInfoType. This base value can be altered by a detection rule if the finding meets the criteria specified by the rule. Default value is `VERY_LIKELY`. Possible values are: `VERY_UNLIKELY`, `UNLIKELY`, `POSSIBLE`, `LIKELY`, `VERY_LIKELY`. | false | None | None |
| `exclusion_type` | If set to EXCLUSION_TYPE_EXCLUDE this infoType will not cause a finding to be returned. It still can be used for rules matching. Possible values are: `EXCLUSION_TYPE_EXCLUDE`. | false | None | None |
| `sensitivity_score` | Optional custom sensitivity for this InfoType. This only applies to data profiling. Structure is [documented below](#nested_inspect_job_inspect_config_custom_info_types_custom_info_types_sensitivity_score). | false | None | None |
| `regex` | Regular expression which defines the rule. Structure is [documented below](#nested_inspect_job_inspect_config_custom_info_types_custom_info_types_regex). | false | None | None |
| `dictionary` | Dictionary which defines the rule. Structure is [documented below](#nested_inspect_job_inspect_config_custom_info_types_custom_info_types_dictionary). | false | None | None |
| `stored_type` | A reference to a StoredInfoType to use with scanning. Structure is [documented below](#nested_inspect_job_inspect_config_custom_info_types_custom_info_types_stored_type). | false | None | None |
| `surrogate_type` | Message for detecting output from deidentification transformations that support reversing. | false | None | None |

### stored_type Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Resource name of the requested StoredInfoType, for example `organizations/433245324/storedInfoTypes/432452342` or `projects/project-id/storedInfoTypes/432452342`. | true | None | None |
| `create_time` | (Output) The creation timestamp of an inspectTemplate. Set by the server. | none | None | None |

### storage_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `timespan_config` | Configuration of the timespan of the items to include in scanning Structure is [documented below](#nested_inspect_job_storage_config_timespan_config). | false | None | None |
| `datastore_options` | Options defining a data set within Google Cloud Datastore. Structure is [documented below](#nested_inspect_job_storage_config_datastore_options). | false | None | None |
| `cloud_storage_options` | Options defining a file or a set of files within a Google Cloud Storage bucket. Structure is [documented below](#nested_inspect_job_storage_config_cloud_storage_options). | false | None | None |
| `big_query_options` | Options defining BigQuery table and row identifiers. Structure is [documented below](#nested_inspect_job_storage_config_big_query_options). | false | None | None |
| `hybrid_options` | Configuration to control jobs where the content being inspected is outside of Google Cloud Platform. Structure is [documented below](#nested_inspect_job_storage_config_hybrid_options). | false | None | None |

### timespan_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `start_time` | Exclude files, tables, or rows older than this value. If not set, no lower time limit is applied. | false | None | None |
| `end_time` | Exclude files, tables, or rows newer than this value. If not set, no upper time limit is applied. | false | None | None |
| `enable_auto_population_of_timespan_config` | When the job is started by a JobTrigger we will automatically figure out a valid startTime to avoid scanning files that have not been modified since the last time the JobTrigger executed. This will be based on the time of the execution of the last run of the JobTrigger or the timespan endTime used in the last run of the JobTrigger. | false | None | None |
| `timestamp_field` | Specification of the field containing the timestamp of scanned items. Structure is [documented below](#nested_inspect_job_storage_config_timespan_config_timestamp_field). | false | None | None |

### timestamp_field Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Specification of the field containing the timestamp of scanned items. Used for data sources like Datastore and BigQuery. For BigQuery: Required to filter out rows based on the given start and end times. If not specified and the table was modified between the given start and end times, the entire table will be scanned. The valid data types of the timestamp field are: INTEGER, DATE, TIMESTAMP, or DATETIME BigQuery column. For Datastore. Valid data types of the timestamp field are: TIMESTAMP. Datastore entity will be scanned if the timestamp property does not exist or its value is empty or invalid. | true | None | None |

### datastore_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `partition_id` | Datastore partition ID. A partition ID identifies a grouping of entities. The grouping is always by project and namespace, however the namespace ID may be empty. Structure is [documented below](#nested_inspect_job_storage_config_datastore_options_partition_id). | true | None | None |
| `kind` | A representation of a Datastore kind. Structure is [documented below](#nested_inspect_job_storage_config_datastore_options_kind). | true | None | None |

### partition_id Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id` | The ID of the project to which the entities belong. | true | None | None |
| `namespace_id` | If not empty, the ID of the namespace to which the entities belong. | false | None | None |

### kind Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the Datastore kind. | true | None | None |

### cloud_storage_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `file_set` | Set of files to scan. Structure is [documented below](#nested_inspect_job_storage_config_cloud_storage_options_file_set). | true | None | None |
| `bytes_limit_per_file` | Max number of bytes to scan from a file. If a scanned file's size is bigger than this value then the rest of the bytes are omitted. | false | None | None |
| `bytes_limit_per_file_percent` | Max percentage of bytes to scan from a file. The rest are omitted. The number of bytes scanned is rounded down. Must be between 0 and 100, inclusively. Both 0 and 100 means no limit. | false | None | None |
| `files_limit_percent` | Limits the number of files to scan to this percentage of the input FileSet. Number of files scanned is rounded down. Must be between 0 and 100, inclusively. Both 0 and 100 means no limit. | false | None | None |
| `file_types` | List of file type groups to include in the scan. If empty, all files are scanned and available data format processors are applied. In addition, the binary content of the selected files is always scanned as well. Images are scanned only as binary if the specified region does not support image inspection and no fileTypes were specified. Each value may be one of: `BINARY_FILE`, `TEXT_FILE`, `IMAGE`, `WORD`, `PDF`, `AVRO`, `CSV`, `TSV`, `POWERPOINT`, `EXCEL`. | false | None | None |
| `sample_method` | How to sample bytes if not all bytes are scanned. Meaningful only when used in conjunction with bytesLimitPerFile. If not specified, scanning would start from the top. Possible values are: `TOP`, `RANDOM_START`. | false | None | None |

### file_set Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `url` | The Cloud Storage url of the file(s) to scan, in the format `gs://<bucket>/<path>`. Trailing wildcard in the path is allowed. If the url ends in a trailing slash, the bucket or directory represented by the url will be scanned non-recursively (content in sub-directories will not be scanned). This means that `gs://mybucket/` is equivalent to `gs://mybucket/*`, and `gs://mybucket/directory/` is equivalent to `gs://mybucket/directory/*`. | false | None | None |
| `regex_file_set` | The regex-filtered set of files to scan. Structure is [documented below](#nested_inspect_job_storage_config_cloud_storage_options_file_set_regex_file_set). | false | None | None |

### regex_file_set Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `bucket_name` | The name of a Cloud Storage bucket. | true | None | None |
| `include_regex` | A list of regular expressions matching file paths to include. All files in the bucket that match at least one of these regular expressions will be included in the set of files, except for those that also match an item in excludeRegex. Leaving this field empty will match all files by default (this is equivalent to including .* in the list) | false | None | None |
| `exclude_regex` | A list of regular expressions matching file paths to exclude. All files in the bucket that match at least one of these regular expressions will be excluded from the scan. | false | None | None |

### big_query_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `table_reference` | Set of files to scan. Structure is [documented below](#nested_inspect_job_storage_config_big_query_options_table_reference). | true | None | None |
| `rows_limit` | Max number of rows to scan. If the table has more rows than this value, the rest of the rows are omitted. If not set, or if set to 0, all rows will be scanned. Only one of rowsLimit and rowsLimitPercent can be specified. Cannot be used in conjunction with TimespanConfig. | false | None | None |
| `rows_limit_percent` | Max percentage of rows to scan. The rest are omitted. The number of rows scanned is rounded down. Must be between 0 and 100, inclusively. Both 0 and 100 means no limit. Defaults to 0. Only one of rowsLimit and rowsLimitPercent can be specified. Cannot be used in conjunction with TimespanConfig. | false | None | None |
| `sample_method` | How to sample rows if not all rows are scanned. Meaningful only when used in conjunction with either rowsLimit or rowsLimitPercent. If not specified, rows are scanned in the order BigQuery reads them. If TimespanConfig is set, set this to an empty string to avoid using the default value. Default value is `TOP`. Possible values are: `TOP`, `RANDOM_START`. | false | None | None |
| `identifying_fields` | Specifies the BigQuery fields that will be returned with findings. If not specified, no identifying fields will be returned for findings. Structure is [documented below](#nested_inspect_job_storage_config_big_query_options_identifying_fields). | false | None | None |
| `included_fields` | Limit scanning only to these fields. Structure is [documented below](#nested_inspect_job_storage_config_big_query_options_included_fields). | false | None | None |
| `excluded_fields` | References to fields excluded from scanning. This allows you to skip inspection of entire columns which you know have no findings. Structure is [documented below](#nested_inspect_job_storage_config_big_query_options_excluded_fields). | false | None | None |

### table_reference Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id` | The Google Cloud Platform project ID of the project containing the table. | true | None | None |
| `dataset_id` | The dataset ID of the table. | true | None | None |
| `table_id` | The name of the table. | true | None | None |

### identifying_fields Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name describing the field. | true | None | None |

### included_fields Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name describing the field to which scanning is limited. | true | None | None |

### excluded_fields Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name describing the field excluded from scanning. | true | None | None |

### hybrid_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `description` | A short description of where the data is coming from. Will be stored once in the job. 256 max length. | false | None | None |
| `required_finding_label_keys` | These are labels that each inspection request must include within their 'finding_labels' map. Request may contain others, but any missing one of these will be rejected. Label keys must be between 1 and 63 characters long and must conform to the following regular expression: `[a-z]([-a-z0-9]*[a-z0-9])?`. No more than 10 keys can be required. | false | None | None |
| `table_options` | If the container is a table, additional information to make findings meaningful such as the columns that are primary keys. Structure is [documented below](#nested_inspect_job_storage_config_hybrid_options_table_options). | false | None | None |
| `labels` | To organize findings, these labels will be added to each finding. Label keys must be between 1 and 63 characters long and must conform to the following regular expression: `[a-z]([-a-z0-9]*[a-z0-9])?`. Label values must be between 0 and 63 characters long and must conform to the regular expression `([a-z]([-a-z0-9]*[a-z0-9])?)?`. No more than 10 labels can be associated with a given finding. Examples: * `"environment" : "production"` * `"pipeline" : "etl"` | false | None | None |

### table_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `identifying_fields` | The columns that are the primary keys for table objects included in ContentItem. A copy of this cell's value will stored alongside alongside each finding so that the finding can be traced to the specific row it came from. No more than 3 may be provided. Structure is [documented below](#nested_inspect_job_storage_config_hybrid_options_table_options_identifying_fields). | false | None | None |

### actions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `save_findings` | If set, the detailed findings will be persisted to the specified OutputStorageConfig. Only a single instance of this action can be specified. Compatible with: Inspect, Risk Structure is [documented below](#nested_inspect_job_actions_actions_save_findings). | false | None | None |
| `pub_sub` | Publish a message into a given Pub/Sub topic when the job completes. Structure is [documented below](#nested_inspect_job_actions_actions_pub_sub). | false | None | None |
| `publish_summary_to_cscc` | Publish the result summary of a DlpJob to the Cloud Security Command Center. | false | None | None |
| `publish_findings_to_cloud_data_catalog` | Publish findings of a DlpJob to Data Catalog. | false | None | None |
| `job_notification_emails` | Sends an email when the job completes. The email goes to IAM project owners and technical Essential Contacts. | false | None | None |
| `deidentify` | Create a de-identified copy of the requested table or files. Structure is [documented below](#nested_inspect_job_actions_actions_deidentify). | false | None | None |
| `publish_to_stackdriver` | Enable Stackdriver metric dlp.googleapis.com/findingCount. | false | None | None |

### save_findings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `output_config` | Information on where to store output Structure is [documented below](#nested_inspect_job_actions_actions_save_findings_output_config). | true | None | None |

### output_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `table` | Information on the location of the target BigQuery Table. Structure is [documented below](#nested_inspect_job_actions_actions_save_findings_output_config_table). | true | None | None |
| `output_schema` | Schema used for writing the findings for Inspect jobs. This field is only used for Inspect and must be unspecified for Risk jobs. Columns are derived from the Finding object. If appending to an existing table, any columns from the predefined schema that are missing will be added. No columns in the existing table will be deleted. If unspecified, then all available columns will be used for a new table or an (existing) table with no schema, and no changes will be made to an existing table that has a schema. Only for use with external storage. Possible values are: `BASIC_COLUMNS`, `GCS_COLUMNS`, `DATASTORE_COLUMNS`, `BIG_QUERY_COLUMNS`, `ALL_COLUMNS`. | false | None | None |

### table Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `project_id` | The ID of the project containing this table. | true | None | None |
| `dataset_id` | The ID of the dataset containing this table. | true | None | None |
| `table_id` | The ID of the table. The ID must contain only letters (a-z, A-Z), numbers (0-9), or underscores (_). The maximum length is 1,024 characters. | false | None | None |

### pub_sub Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `topic` | Cloud Pub/Sub topic to send notifications to. | true | None | None |

### deidentify Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cloud_storage_output` | User settable Cloud Storage bucket and folders to store de-identified files. This field must be set for cloud storage deidentification. The output Cloud Storage bucket must be different from the input bucket. De-identified files will overwrite files in the output path. Form of: gs://bucket/folder/ or gs://bucket | true | None | None |
| `file_types_to_transform` | List of user-specified file type groups to transform. If specified, only the files with these filetypes will be transformed. If empty, all supported files will be transformed. Supported types may be automatically added over time. If a file type is set in this field that isn't supported by the Deidentify action then the job will fail and will not be successfully created/started. Each value may be one of: `IMAGE`, `TEXT_FILE`, `CSV`, `TSV`. | false | None | None |
| `transformation_config` | User specified deidentify templates and configs for structured, unstructured, and image files. Structure is [documented below](#nested_inspect_job_actions_actions_deidentify_transformation_config). | false | None | None |
| `transformation_details_storage_config` | Config for storing transformation details. Structure is [documented below](#nested_inspect_job_actions_actions_deidentify_transformation_details_storage_config). | false | None | None |

### transformation_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `deidentify_template` | If this template is specified, it will serve as the default de-identify template. | false | None | None |
| `structured_deidentify_template` | If this template is specified, it will serve as the de-identify template for structured content such as delimited files and tables. | false | None | None |
| `image_redact_template` | If this template is specified, it will serve as the de-identify template for images. | false | None | None |

### transformation_details_storage_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `table` | The BigQuery table in which to store the output. Structure is [documented below](#nested_inspect_job_actions_actions_deidentify_transformation_details_storage_config_table). | true | None | None |
