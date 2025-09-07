## 🛡️ Policy Deployment Engine: `clouddeploy_automation`

This section provides a concise policy evaluation for the `clouddeploy_automation` resource in GCP.

Reference: [Terraform Registry – clouddeploy_automation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/clouddeploy_automation)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the `Automation`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Required) Required. Email address of the user-managed IAM service account that creates Cloud Deploy release and rollout resources.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `selector`
- Description: (Required) Required. Selected resources to which the automation will be applied. Structure is [documented below](#nested_selector).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rules`
- Description: (Required) Required. List of Automation rules associated with the Automation resource. Must have at least one rule and limited to 250 rules per Delivery Pipeline. Note: the order of the rules here is not the same as the order of execution. Structure is [documented below](#nested_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delivery_pipeline`
- Description: (Required) The delivery_pipeline for the resource
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. Description of the `Automation`. Max length is 255 characters.
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
- Description: (Optional) Optional. When Suspended, automation is deactivated from execution.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_selector"></a>The `selector` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `targets`
- Description: (Required) Contains attributes about a target. Structure is [documented below](#nested_selector_targets). <a name="nested_selector_targets"></a>The `targets` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Optional) ID of the `Target`. The value of this field could be one of the following: * The last segment of a target name. It only needs the ID to determine which target is being referred to * "*", all targets in a location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Target labels. <a name="nested_rules"></a>The `rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `promote_release_rule`
- Description: (Optional) Optional. `PromoteReleaseRule` will automatically promote a release from the current target to a specified target. Structure is [documented below](#nested_rules_rules_promote_release_rule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `advance_rollout_rule`
- Description: (Optional) Optional. The `AdvanceRolloutRule` will automatically advance a successful Rollout. Structure is [documented below](#nested_rules_rules_advance_rollout_rule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repair_rollout_rule`
- Description: (Optional) Optional. The RepairRolloutRule will automatically repair a failed rollout. Structure is [documented below](#nested_rules_rules_repair_rollout_rule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timed_promote_release_rule`
- Description: (Optional) Optional. The `TimedPromoteReleaseRule` will automatically promote a release from the current target(s) to the specified target(s) on a configured schedule. Structure is [documented below](#nested_rules_rules_timed_promote_release_rule). <a name="nested_rules_rules_promote_release_rule"></a>The `promote_release_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) Required. ID of the rule. This id must be unique in the `Automation` resource to which this rule belongs. The format is `a-z{0,62}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `wait`
- Description: (Optional) Optional. How long the release need to be paused until being promoted to the next target.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_target_id`
- Description: (Optional) Optional. The ID of the stage in the pipeline to which this `Release` is deploying. If unspecified, default it to the next stage in the promotion flow. The value of this field could be one of the following: * The last segment of a target name. It only needs the ID to determine if the target is one of the stages in the promotion sequence defined in the pipeline. * "@next", the next target in the promotion sequence.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_phase`
- Description: (Optional) Optional. The starting phase of the rollout created by this operation. Default to the first phase. <a name="nested_rules_rules_advance_rollout_rule"></a>The `advance_rollout_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) Required. ID of the rule. This id must be unique in the `Automation` resource to which this rule belongs. The format is `a-z{0,62}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `wait`
- Description: (Optional) Optional. How long to wait after a rollout is finished.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_phases`
- Description: (Optional) Optional. Proceeds only after phase name matched any one in the list. This value must consist of lower-case letters, numbers, and hyphens, start with a letter and end with a letter or a number, and have a max length of 63 characters. In other words, it must match the following regex: `^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$`. <a name="nested_rules_rules_repair_rollout_rule"></a>The `repair_rollout_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) Required. ID of the rule. This id must be unique in the `Automation` resource to which this rule belongs. The format is `a-z{0,62}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `phases`
- Description: (Optional) Optional. Phases within which jobs are subject to automatic repair actions on failure. Proceeds only after phase name matched any one in the list, or for all phases if unspecified. This value must consist of lower-case letters, numbers, and hyphens, start with a letter and end with a letter or a number, and have a max length of 63 characters. In other words, it must match the following regex: ^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jobs`
- Description: (Optional) Optional. Jobs to repair. Proceeds only after job name matched any one in the list, or for all jobs if unspecified or empty. The phase that includes the job must match the phase ID specified in sourcePhase. This value must consist of lower-case letters, numbers, and hyphens, start with a letter and end with a letter or a number, and have a max length of 63 characters. In other words, it must match the following regex: ^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repair_phases`
- Description: (Optional) Optional. Proceeds only after phase name matched any one in the list. This value must consist of lower-case letters, numbers, and hyphens, start with a letter and end with a letter or a number, and have a max length of 63 characters. In other words, it must match the following regex: `^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$`. Structure is [documented below](#nested_rules_rules_repair_rollout_rule_repair_phases). <a name="nested_rules_rules_repair_rollout_rule_repair_phases"></a>The `repair_phases` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retry`
- Description: (Optional) Optional. Retries a failed job. Structure is [documented below](#nested_rules_rules_repair_rollout_rule_repair_phases_repair_phases_retry).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rollback`
- Description: (Optional) Optional. Rolls back a Rollout. Structure is [documented below](#nested_rules_rules_repair_rollout_rule_repair_phases_repair_phases_rollback). <a name="nested_rules_rules_repair_rollout_rule_repair_phases_repair_phases_retry"></a>The `retry` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attempts`
- Description: (Required) Required. Total number of retries. Retry is skipped if set to 0; The minimum value is 1, and the maximum value is 10.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `wait`
- Description: (Optional) Optional. How long to wait for the first retry. Default is 0, and the maximum value is 14d. A duration in seconds with up to nine fractional digits, ending with 's'. Example: `3.5s`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backoff_mode`
- Description: (Optional) Optional. The pattern of how wait time will be increased. Default is linear. Backoff mode will be ignored if wait is 0. Possible values are: `BACKOFF_MODE_UNSPECIFIED`, `BACKOFF_MODE_LINEAR`, `BACKOFF_MODE_EXPONENTIAL`. <a name="nested_rules_rules_repair_rollout_rule_repair_phases_repair_phases_rollback"></a>The `rollback` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_phase`
- Description: (Optional) Optional. The starting phase ID for the Rollout. If unspecified, the Rollout will start in the stable phase.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_rollback_if_rollout_pending`
- Description: (Optional) Optional. If pending rollout exists on the target, the rollback operation will be aborted. <a name="nested_rules_rules_timed_promote_release_rule"></a>The `timed_promote_release_rule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) Required. ID of the rule. This id must be unique in the `Automation` resource to which this rule belongs. The format is `a-z{0,62}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_target_id`
- Description: (Optional) Optional. The ID of the stage in the pipeline to which this Release is deploying. If unspecified, default it to the next stage in the promotion flow. The value of this field could be one of the following: - The last segment of a target name - "@next", the next target in the promotion sequence"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule`
- Description: (Required) Required. Schedule in crontab format. e.g. `0 9 * * 1` for every Monday at 9am.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_zone`
- Description: (Required) Required. The time zone in IANA format IANA Time Zone Database (e.g. America/New_York).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_phase`
- Description: (Optional) Optional. The starting phase of the rollout created by this rule. Default to the first phase.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
