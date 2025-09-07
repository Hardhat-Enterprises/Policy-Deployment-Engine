## 🛡️ Policy Deployment Engine: `clouddeploy_deploy_policy`

This section provides a concise policy evaluation for the `clouddeploy_deploy_policy` resource in GCP.

Reference: [Terraform Registry – clouddeploy_deploy_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/clouddeploy_deploy_policy)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the `DeployPolicy`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `selectors`
- Description: (Required) Required. Selected resources to which the policy will be applied. At least one selector is required. If one selector matches the resource the policy applies. For example, if there are two selectors and the action being attempted matches one of them, the policy will apply to that action. Structure is [documented below](#nested_selectors).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rules`
- Description: (Required) Required. Rules to apply. At least one rule must be present. Structure is [documented below](#nested_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. Description of the `DeployPolicy`. Max length is 255 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Optional. User annotations. These attributes can only be set and used by the user, and not by Cloud Deploy. Annotations must meet the following constraints: * Annotations are key/value pairs. * Valid annotation keys have two segments: an optional prefix and name, separated by a slash (`/`). * The name segment is required and must be 63 characters or less, beginning and ending with an alphanumeric character (`[a-z0-9A-Z]`) with dashes (`-`), underscores (`_`), dots (`.`), and alphanumerics between. * The prefix is optional. If specified, the prefix must be a DNS subdomain: a series of DNS labels separated by dots(`.`), not longer than 253 characters in total, followed by a slash (`/`). See https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/#syntax-and-character-set for more details. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional. Labels are attributes that can be set and used by both the user and by Cloud Deploy. Labels must meet the following constraints: * Keys and values can contain only lowercase letters, numeric characters, underscores, and dashes. * All characters must use UTF-8 encoding, and international characters are allowed. * Keys must start with a lowercase letter or international character. * Each resource is limited to a maximum of 64 labels. Both keys and values are additionally constrained to be <= 63 characters. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `suspended`
- Description: (Optional) Optional. When suspended, the policy will not prevent actions from occurring, even if the action violates the policy.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_selectors"></a>The `selectors` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target`
- Description: (Optional) Contains attributes about a target. Structure is [documented below](#nested_selectors_selectors_target).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delivery_pipeline`
- Description: (Optional) Contains attributes about a delivery pipeline. Structure is [documented below](#nested_selectors_selectors_delivery_pipeline). <a name="nested_selectors_selectors_target"></a>The `target` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Optional) ID of the `Target`. The value of this field could be one of the following: * The last segment of a target name. It only needs the ID to determine which target is being referred to * "*", all targets in a location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Target labels. <a name="nested_selectors_selectors_delivery_pipeline"></a>The `delivery_pipeline` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Optional) Optional. ID of the DeliveryPipeline. The value of this field could be one of the following: - The last segment of a pipeline name - "*", all delivery pipelines in a location
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) DeliveryPipeline labels. <a name="nested_rules"></a>The `rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rollout_restriction`
- Description: (Optional) Optional. Rollout restrictions. Structure is [documented below](#nested_rules_rules_rollout_restriction). <a name="nested_rules_rules_rollout_restriction"></a>The `rollout_restriction` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) Required. ID of the rule. This id must be unique in the `DeployPolicy` resource to which this rule belongs. The format is `a-z{0,62}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `invokers`
- Description: (Optional) Optional. What invoked the action. If left empty, all invoker types will be restricted. Each value may be one of: `USER`, `DEPLOY_AUTOMATION`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `actions`
- Description: (Optional) Optional. Rollout actions to be restricted as part of the policy. If left empty, all actions will be restricted. Each value may be one of: `ADVANCE`, `APPROVE`, `CANCEL`, `CREATE`, `IGNORE_JOB`, `RETRY_JOB`, `ROLLBACK`, `TERMINATE_JOBRUN`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_windows`
- Description: (Optional) Required. Time window within which actions are restricted. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows). <a name="nested_rules_rules_rollout_restriction_time_windows"></a>The `time_windows` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_zone`
- Description: (Required) Required. The time zone in IANA format IANA Time Zone Database (e.g. America/New_York).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `one_time_windows`
- Description: (Optional) Optional. One-time windows within which actions are restricted. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_one_time_windows).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weekly_windows`
- Description: (Optional) Optional. Recurring weekly windows within which actions are restricted. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_weekly_windows). <a name="nested_rules_rules_rollout_restriction_time_windows_one_time_windows"></a>The `one_time_windows` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_date`
- Description: (Required) Required. Start date. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_one_time_windows_one_time_windows_start_date).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_date`
- Description: (Required) Required. End date. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_one_time_windows_one_time_windows_end_date).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Required) Required. Start time (inclusive). Use 00:00 for the beginning of the day. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_one_time_windows_one_time_windows_start_time).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_time`
- Description: (Required) Required. End time (exclusive). You may use 24:00 for the end of the day. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_one_time_windows_one_time_windows_end_time). <a name="nested_rules_rules_rollout_restriction_time_windows_one_time_windows_one_time_windows_start_date"></a>The `start_date` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `year`
- Description: (Optional) Year of the date. Must be from 1 to 9999, or 0 to specify a date without a year.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `month`
- Description: (Optional) Month of a year. Must be from 1 to 12, or 0 to specify a year without a month and day.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day`
- Description: (Optional) Day of a month. Must be from 1 to 31 and valid for the year and month, or 0 to specify a year by itself or a year and month where the day isn't significant. <a name="nested_rules_rules_rollout_restriction_time_windows_one_time_windows_one_time_windows_end_date"></a>The `end_date` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `year`
- Description: (Optional) Year of the date. Must be from 1 to 9999.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `month`
- Description: (Optional) Month of a year. Must be from 1 to 12.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day`
- Description: (Optional) Day of a month. Must be from 1 to 31 and valid for the year and month. <a name="nested_rules_rules_rollout_restriction_time_windows_one_time_windows_one_time_windows_start_time"></a>The `start_time` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hours`
- Description: (Optional) Hours of a day in 24 hour format. Must be greater than or equal to 0 and typically must be less than or equal to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minutes`
- Description: (Optional) Minutes of an hour. Must be greater than or equal to 0 and less than or equal to 59.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Seconds of a minute. Must be greater than or equal to 0 and typically must be less than or equal to 59. An API may allow the value 60 if it allows leap-seconds.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Fractions of seconds, in nanoseconds. Must be greater than or equal to 0 and less than or equal to 999,999,999. <a name="nested_rules_rules_rollout_restriction_time_windows_one_time_windows_one_time_windows_end_time"></a>The `end_time` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hours`
- Description: (Optional) Hours of a day in 24 hour format. Must be greater than or equal to 0 and typically must be less than or equal to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minutes`
- Description: (Optional) Minutes of an hour. Must be greater than or equal to 0 and less than or equal to 59.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Seconds of a minute. Must be greater than or equal to 0 and typically must be less than or equal to 59. An API may allow the value 60 if it allows leap-seconds.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Fractions of seconds, in nanoseconds. Must be greater than or equal to 0 and less than or equal to 999,999,999. <a name="nested_rules_rules_rollout_restriction_time_windows_weekly_windows"></a>The `weekly_windows` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `days_of_week`
- Description: (Optional) Optional. Days of week. If left empty, all days of the week will be included. Each value may be one of: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Optional) Optional. Start time (inclusive). Use 00:00 for the beginning of the day. If you specify startTime you must also specify endTime. If left empty, this will block for the entire day for the days specified in daysOfWeek. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_weekly_windows_weekly_windows_start_time).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_time`
- Description: (Optional) Optional. End time (exclusive). Use 24:00 to indicate midnight. If you specify endTime you must also specify startTime. If left empty, this will block for the entire day for the days specified in daysOfWeek. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_weekly_windows_weekly_windows_end_time). <a name="nested_rules_rules_rollout_restriction_time_windows_weekly_windows_weekly_windows_start_time"></a>The `start_time` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hours`
- Description: (Optional) Hours of a day in 24 hour format. Must be greater than or equal to 0 and typically must be less than or equal to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minutes`
- Description: (Optional) Minutes of an hour. Must be greater than or equal to 0 and less than or equal to 59.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Seconds of a minute. Must be greater than or equal to 0 and typically must be less than or equal to 59. An API may allow the value 60 if it allows leap-seconds.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Fractions of seconds, in nanoseconds. Must be greater than or equal to 0 and less than or equal to 999,999,999. <a name="nested_rules_rules_rollout_restriction_time_windows_weekly_windows_weekly_windows_end_time"></a>The `end_time` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hours`
- Description: (Optional) Hours of a day in 24 hour format. Must be greater than or equal to 0 and typically must be less than or equal to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minutes`
- Description: (Optional) Minutes of an hour. Must be greater than or equal to 0 and less than or equal to 59.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Seconds of a minute. Must be greater than or equal to 0 and typically must be less than or equal to 59. An API may allow the value 60 if it allows leap-seconds.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Fractions of seconds, in nanoseconds. Must be greater than or equal to 0 and less than or equal to 999,999,999.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
