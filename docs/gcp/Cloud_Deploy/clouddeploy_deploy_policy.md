## 🛡️ Policy Deployment Engine: `clouddeploy_deploy_policy`

This section provides a concise policy evaluation for the `clouddeploy_deploy_policy` resource in GCP.

Reference: [Terraform Registry – clouddeploy_deploy_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/clouddeploy_deploy_policy)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the `DeployPolicy`. | true | false | Just a resource identifier. No security implications. | None | None |
| `selectors` | Required. Selected resources to which the policy will be applied. At least one selector is required. If one selector matches the resource the policy applies. For example, if there are two selectors and the action being attempted matches one of them, the policy will apply to that action. Structure is [documented below](#nested_selectors). | true | false | Defines the scope of targets the deployment applies to (e.g., specific targets or all targets). The security of actions on those targets is governed by the service_account's permissions, not the selection itself. | None | None |
| `rules` | Required. Rules to apply. At least one rule must be present. Structure is [documented below](#nested_rules). | true | false | Terraform schema validation requires this block and throws error if missing: At least 1 block(s) are expected for 'rules'. The main security risk (missing rules) is already prevented by Terraform itself. | None | None |
| `location` | The location for the resource | true | false | Geographic placement preference. No security impact. | None | None |
| `description` | Optional. Description of the `DeployPolicy`. Max length is 255 characters. | false | false | Human-readable documentation field only. No security implications. | None | None |
| `annotations` | Optional. User annotations. These attributes can only be set and used by the user, and not by Cloud Deploy. Annotations must meet the following constraints: * Annotations are key/value pairs. * Valid annotation keys have two segments: an optional prefix and name, separated by a slash (`/`). * The name segment is required and must be 63 characters or less, beginning and ending with an alphanumeric character (`[a-z0-9A-Z]`) with dashes (`-`), underscores (`_`), dots (`.`), and alphanumerics between. * The prefix is optional. If specified, the prefix must be a DNS subdomain: a series of DNS labels separated by dots(`.`), not longer than 253 characters in total, followed by a slash (`/`). See https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/#syntax-and-character-set for more details. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Just metadata for resource organization. Doesn't affect policy enforcement behaviour. | None | None |
| `labels` | Optional. Labels are attributes that can be set and used by both the user and by Cloud Deploy. Labels must meet the following constraints: * Keys and values can contain only lowercase letters, numeric characters, underscores, and dashes. * All characters must use UTF-8 encoding, and international characters are allowed. * Keys must start with a lowercase letter or international character. * Each resource is limited to a maximum of 64 labels. Both keys and values are additionally constrained to be <= 63 characters. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Used for billing and resource organization only. Doesn't control security enforcement. | None | None |
| `suspended` | Optional. When suspended, the policy will not prevent actions from occurring, even if the action violates the policy. | false | true | Controls whether the deploy policy actively enforces security controls. When suspended = true, ALL deployment rules are bypassed, creating a complete security control bypass. Unauthorized suspension allows deployments without any security enforcement. | False | True |
| `project` | If it is not provided, the provider project is used. | false | false | Specifies which GCP project. Controlled by provider configuration and IAM. No security implications. | None | None |
| `target` |  | false | false | None | None | None |
| `delivery_pipeline` |  | false | false | None | None | None |
| `rollout_restriction` | Optional. What invoked the action. If left empty, all invoker types will be restricted. | false | true | Defines whether the policy applies to human users (`USER`), automation systems (`DEPLOY_AUTOMATION`), or both. Leaving this empty (default) restricts all invokers, which is the most secure but potentially overly broad setting. Misconfiguration could allow unauthorized automation or bypass human approval requirements. | None | None |
| `time_windows` |  | false | false | None | None | None |
| `one_time_windows` |  | false | false | None | None | None |
| `start_date` |  | false | false | None | None | None |
| `end_date` |  | false | false | None | None | None |
| `start_time` |  | false | false | None | None | None |
| `end_time` |  | false | false | None | None | None |
| `weekly_windows` |  | false | false | None | None | None |

### selectors Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target` | Contains attributes about a target. Structure is [documented below](#nested_selectors_selectors_target). | false | false | None | None | None |
| `delivery_pipeline` | Contains attributes about a delivery pipeline. Structure is [documented below](#nested_selectors_selectors_delivery_pipeline). | false | false | None | None | None |

### rules Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `rollout_restriction` | Optional. Rollout restrictions. Structure is [documented below](#nested_rules_rules_rollout_restriction). | false | false | None | None | None |

### target Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` | ID of the `Target`. The value of this field could be one of the following: * The last segment of a target name. It only needs the ID to determine which target is being referred to * "*", all targets in a location. | false | false | None | None | None |
| `labels` | Target labels. | false | false | None | None | None |

### delivery_pipeline Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` | Optional. ID of the DeliveryPipeline. The value of this field could be one of the following: - The last segment of a pipeline name - "*", all delivery pipelines in a location | false | false | None | None | None |
| `labels` | DeliveryPipeline labels. | false | false | None | None | None |

### rollout_restriction Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` | Required. ID of the rule. This id must be unique in the `DeployPolicy` resource to which this rule belongs. The format is `a-z{0,62}`. | true | false | None | None | None |
| `invokers` | Optional. What invoked the action. If left empty, all invoker types will be restricted. Each value may be one of: `USER`, `DEPLOY_AUTOMATION`. | false | false | None | None | None |
| `actions` | Optional. Rollout actions to be restricted as part of the policy. If left empty, all actions will be restricted. Each value may be one of: `ADVANCE`, `APPROVE`, `CANCEL`, `CREATE`, `IGNORE_JOB`, `RETRY_JOB`, `ROLLBACK`, `TERMINATE_JOBRUN`. | false | false | None | None | None |
| `time_windows` | Required. Time window within which actions are restricted. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows). | false | false | None | None | None |

### time_windows Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `time_zone` | Required. The time zone in IANA format IANA Time Zone Database (e.g. America/New_York). | true | false | None | None | None |
| `one_time_windows` | Optional. One-time windows within which actions are restricted. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_one_time_windows). | false | false | None | None | None |
| `weekly_windows` | Optional. Recurring weekly windows within which actions are restricted. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_weekly_windows). | false | false | None | None | None |

### one_time_windows Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `start_date` | Required. Start date. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_one_time_windows_one_time_windows_start_date). | true | false | None | None | None |
| `end_date` | Required. End date. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_one_time_windows_one_time_windows_end_date). | true | false | None | None | None |
| `start_time` | Required. Start time (inclusive). Use 00:00 for the beginning of the day. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_one_time_windows_one_time_windows_start_time). | true | false | None | None | None |
| `end_time` | Required. End time (exclusive). You may use 24:00 for the end of the day. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_one_time_windows_one_time_windows_end_time). | true | false | None | None | None |

### start_date Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `year` | Year of the date. Must be from 1 to 9999, or 0 to specify a date without a year. | false | false | None | None | None |
| `month` | Month of a year. Must be from 1 to 12, or 0 to specify a year without a month and day. | false | false | None | None | None |
| `day` | Day of a month. Must be from 1 to 31 and valid for the year and month, or 0 to specify a year by itself or a year and month where the day isn't significant. | false | false | None | None | None |

### end_date Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `year` | Year of the date. Must be from 1 to 9999. | false | false | None | None | None |
| `month` | Month of a year. Must be from 1 to 12. | false | false | None | None | None |
| `day` | Day of a month. Must be from 1 to 31 and valid for the year and month. | false | false | None | None | None |

### start_time Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `hours` | Hours of a day in 24 hour format. Must be greater than or equal to 0 and typically must be less than or equal to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time. | false | false | None | None | None |
| `minutes` | Minutes of an hour. Must be greater than or equal to 0 and less than or equal to 59. | false | false | None | None | None |
| `seconds` | Seconds of a minute. Must be greater than or equal to 0 and typically must be less than or equal to 59. An API may allow the value 60 if it allows leap-seconds. | false | false | None | None | None |
| `nanos` | Fractions of seconds, in nanoseconds. Must be greater than or equal to 0 and less than or equal to 999,999,999. | false | false | None | None | None |

### end_time Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `hours` | Hours of a day in 24 hour format. Must be greater than or equal to 0 and typically must be less than or equal to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time. | false | false | None | None | None |
| `minutes` | Minutes of an hour. Must be greater than or equal to 0 and less than or equal to 59. | false | false | None | None | None |
| `seconds` | Seconds of a minute. Must be greater than or equal to 0 and typically must be less than or equal to 59. An API may allow the value 60 if it allows leap-seconds. | false | false | None | None | None |
| `nanos` | Fractions of seconds, in nanoseconds. Must be greater than or equal to 0 and less than or equal to 999,999,999. | false | false | None | None | None |

### weekly_windows Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `days_of_week` | Optional. Days of week. If left empty, all days of the week will be included. Each value may be one of: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | false | false | None | None | None |
| `start_time` | Optional. Start time (inclusive). Use 00:00 for the beginning of the day. If you specify startTime you must also specify endTime. If left empty, this will block for the entire day for the days specified in daysOfWeek. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_weekly_windows_weekly_windows_start_time). | false | false | None | None | None |
| `end_time` | Optional. End time (exclusive). Use 24:00 to indicate midnight. If you specify endTime you must also specify startTime. If left empty, this will block for the entire day for the days specified in daysOfWeek. Structure is [documented below](#nested_rules_rules_rollout_restriction_time_windows_weekly_windows_weekly_windows_end_time). | false | false | None | None | None |
