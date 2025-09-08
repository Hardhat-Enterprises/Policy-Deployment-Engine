## 🛡️ Policy Deployment Engine: `clouddeploy_deploy_policy`

This section provides a concise policy evaluation for the `clouddeploy_deploy_policy` resource in GCP.

Reference: [Terraform Registry – clouddeploy_deploy_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/clouddeploy_deploy_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the `DeployPolicy`. | true | None | None |
| `location` | The location for the resource | true | None | None |
| `description` | Optional. Description of the `DeployPolicy`. Max length is 255 characters. | false | None | None |
| `annotations` | Optional. User annotations. These attributes can only be set and used by the user, and not by Cloud Deploy. Annotations must meet the following constraints: * Annotations are key/value pairs. * Valid annotation keys have two segments: an optional prefix and name, separated by a slash (`/`). * The name segment is required and must be 63 characters or less, beginning and ending with an alphanumeric character (`[a-z0-9A-Z]`) with dashes (`-`), underscores (`_`), dots (`.`), and alphanumerics between. * The prefix is optional. If specified, the prefix must be a DNS subdomain: a series of DNS labels separated by dots(`.`), not longer than 253 characters in total, followed by a slash (`/`). See https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/#syntax-and-character-set for more details. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `labels` | Optional. Labels are attributes that can be set and used by both the user and by Cloud Deploy. Labels must meet the following constraints: * Keys and values can contain only lowercase letters, numeric characters, underscores, and dashes. * All characters must use UTF-8 encoding, and international characters are allowed. * Keys must start with a lowercase letter or international character. * Each resource is limited to a maximum of 64 labels. Both keys and values are additionally constrained to be <= 63 characters. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `suspended` | Optional. When suspended, the policy will not prevent actions from occurring, even if the action violates the policy. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### selectors Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `target` | Contains attributes about a target. Structure is [documented below](#nested_selectors_selectors_target). | false | None | None |
| `delivery_pipeline` | Contains attributes about a delivery pipeline. Structure is [documented below](#nested_selectors_selectors_delivery_pipeline). | false | None | None |

### rules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `rollout_restriction` | Optional. Rollout restrictions. Structure is [documented below](#nested_rules_rules_rollout_restriction). | false | None | None |

### target Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | ID of the `Target`. The value of this field could be one of the following: * The last segment of a target name. It only needs the ID to determine which target is being referred to * "*", all targets in a location. | false | None | None |
| `labels` | Target labels. | false | None | None |

### delivery_pipeline Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | Optional. ID of the DeliveryPipeline. The value of this field could be one of the following: - The last segment of a pipeline name - "*", all delivery pipelines in a location | false | None | None |
| `labels` | DeliveryPipeline labels. | false | None | None |

### rollout_restriction Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | Required. ID of the rule. This id must be unique in the `DeployPolicy` resource to which this rule belongs. The format is `a-z{0,62}`. | true | None | None |
| `invokers` | Optional. What invoked the action. If left empty, all invoker types will be restricted. Each value may be one of: `USER`, `DEPLOY_AUTOMATION`. | false | None | None |
| `actions` | Optional. Rollout actions to be restricted as part of the policy. If left empty, all actions will be restricted. Each value may be one of: `ADVANCE`, `APPROVE`, `CANCEL`, `CREATE`, `IGNORE_JOB`, `RETRY_JOB`, `ROLLBACK`, `TERMINATE_JOBRUN`. | false | None | None |
| `time_windows` | Required. Time window within which actions are restricted. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows). | false | None | None |

### time_windows Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `time_zone` | Required. The time zone in IANA format IANA Time Zone Database (e.g. America/New_York). | true | None | None |
| `one_time_windows` | Optional. One-time windows within which actions are restricted. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_one_time_windows). | false | None | None |
| `weekly_windows` | Optional. Recurring weekly windows within which actions are restricted. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_weekly_windows). | false | None | None |

### one_time_windows Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `start_date` | Required. Start date. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_one_time_windows_one_time_windows_start_date). | true | None | None |
| `end_date` | Required. End date. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_one_time_windows_one_time_windows_end_date). | true | None | None |
| `start_time` | Required. Start time (inclusive). Use 00:00 for the beginning of the day. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_one_time_windows_one_time_windows_start_time). | true | None | None |
| `end_time` | Required. End time (exclusive). You may use 24:00 for the end of the day. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_one_time_windows_one_time_windows_end_time). | true | None | None |

### start_date Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `year` | Year of the date. Must be from 1 to 9999, or 0 to specify a date without a year. | false | None | None |
| `month` | Month of a year. Must be from 1 to 12, or 0 to specify a year without a month and day. | false | None | None |
| `day` | Day of a month. Must be from 1 to 31 and valid for the year and month, or 0 to specify a year by itself or a year and month where the day isn't significant. | false | None | None |

### end_date Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `year` | Year of the date. Must be from 1 to 9999. | false | None | None |
| `month` | Month of a year. Must be from 1 to 12. | false | None | None |
| `day` | Day of a month. Must be from 1 to 31 and valid for the year and month. | false | None | None |

### start_time Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hours` | Hours of a day in 24 hour format. Must be greater than or equal to 0 and typically must be less than or equal to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time. | false | None | None |
| `minutes` | Minutes of an hour. Must be greater than or equal to 0 and less than or equal to 59. | false | None | None |
| `seconds` | Seconds of a minute. Must be greater than or equal to 0 and typically must be less than or equal to 59. An API may allow the value 60 if it allows leap-seconds. | false | None | None |
| `nanos` | Fractions of seconds, in nanoseconds. Must be greater than or equal to 0 and less than or equal to 999,999,999. | false | None | None |

### end_time Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hours` | Hours of a day in 24 hour format. Must be greater than or equal to 0 and typically must be less than or equal to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time. | false | None | None |
| `minutes` | Minutes of an hour. Must be greater than or equal to 0 and less than or equal to 59. | false | None | None |
| `seconds` | Seconds of a minute. Must be greater than or equal to 0 and typically must be less than or equal to 59. An API may allow the value 60 if it allows leap-seconds. | false | None | None |
| `nanos` | Fractions of seconds, in nanoseconds. Must be greater than or equal to 0 and less than or equal to 999,999,999. | false | None | None |

### weekly_windows Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `days_of_week` | Optional. Days of week. If left empty, all days of the week will be included. Each value may be one of: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | false | None | None |
| `start_time` | Optional. Start time (inclusive). Use 00:00 for the beginning of the day. If you specify startTime you must also specify endTime. If left empty, this will block for the entire day for the days specified in daysOfWeek. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_weekly_windows_weekly_windows_start_time). | false | None | None |
| `end_time` | Optional. End time (exclusive). Use 24:00 to indicate midnight. If you specify endTime you must also specify startTime. If left empty, this will block for the entire day for the days specified in daysOfWeek. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_weekly_windows_weekly_windows_end_time). | false | None | None |
