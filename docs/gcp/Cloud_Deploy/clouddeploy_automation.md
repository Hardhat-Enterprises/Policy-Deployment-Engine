## 🛡️ Policy Deployment Engine: `clouddeploy_automation`

This section provides a concise policy evaluation for the `clouddeploy_automation` resource in GCP.

Reference: [Terraform Registry – clouddeploy_automation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/clouddeploy_automation)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the `Automation`. | true | None | None |
| `service_account` | Required. Email address of the user-managed IAM service account that creates Cloud Deploy release and rollout resources. | true | None | None |
| `location` | The location for the resource | true | None | None |
| `delivery_pipeline` | The delivery_pipeline for the resource | true | None | None |
| `description` | Optional. Description of the `Automation`. Max length is 255 characters. | false | None | None |
| `annotations` | Optional. User annotations. These attributes can only be set and used by the user, and not by Cloud Deploy. Annotations must meet the following constraints: * Annotations are key/value pairs. * Valid annotation keys have two segments: an optional prefix and name, separated by a slash (`/`). * The name segment is required and must be 63 characters or less, beginning and ending with an alphanumeric character (`[a-z0-9A-Z]`) with dashes (`-`), underscores (`_`), dots (`.`), and alphanumerics between. * The prefix is optional. If specified, the prefix must be a DNS subdomain: a series of DNS labels separated by dots(`.`), not longer than 253 characters in total, followed by a slash (`/`). See https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/#syntax-and-character-set for more details. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `labels` | Optional. Labels are attributes that can be set and used by both the user and by Cloud Deploy. Labels must meet the following constraints: * Keys and values can contain only lowercase letters, numeric characters, underscores, and dashes. * All characters must use UTF-8 encoding, and international characters are allowed. * Keys must start with a lowercase letter or international character. * Each resource is limited to a maximum of 64 labels. Both keys and values are additionally constrained to be <= 63 characters. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `suspended` | Optional. When Suspended, automation is deactivated from execution. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### selector Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `targets` | Contains attributes about a target. Structure is [documented below](#nested_selector_targets). | true | None | None |

### rules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `promote_release_rule` | Optional. `PromoteReleaseRule` will automatically promote a release from the current target to a specified target. Structure is [documented below](#nested_rules_rules_promote_release_rule). | false | None | None |
| `advance_rollout_rule` | Optional. The `AdvanceRolloutRule` will automatically advance a successful Rollout. Structure is [documented below](#nested_rules_rules_advance_rollout_rule). | false | None | None |
| `repair_rollout_rule` | Optional. The RepairRolloutRule will automatically repair a failed rollout. Structure is [documented below](#nested_rules_rules_repair_rollout_rule). | false | None | None |
| `timed_promote_release_rule` | Optional. The `TimedPromoteReleaseRule` will automatically promote a release from the current target(s) to the specified target(s) on a configured schedule. Structure is [documented below](#nested_rules_rules_timed_promote_release_rule). | false | None | None |

### targets Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | ID of the `Target`. The value of this field could be one of the following: * The last segment of a target name. It only needs the ID to determine which target is being referred to * "*", all targets in a location. | false | None | None |
| `labels` | Target labels. | false | None | None |

### promote_release_rule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | Required. ID of the rule. This id must be unique in the `Automation` resource to which this rule belongs. The format is `a-z{0,62}`. | true | None | None |
| `wait` | Optional. How long the release need to be paused until being promoted to the next target. | false | None | None |
| `destination_target_id` | Optional. The ID of the stage in the pipeline to which this `Release` is deploying. If unspecified, default it to the next stage in the promotion flow. The value of this field could be one of the following: * The last segment of a target name. It only needs the ID to determine if the target is one of the stages in the promotion sequence defined in the pipeline. * "@next", the next target in the promotion sequence. | false | None | None |
| `destination_phase` | Optional. The starting phase of the rollout created by this operation. Default to the first phase. | false | None | None |

### advance_rollout_rule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | Required. ID of the rule. This id must be unique in the `Automation` resource to which this rule belongs. The format is `a-z{0,62}`. | true | None | None |
| `wait` | Optional. How long to wait after a rollout is finished. | false | None | None |
| `source_phases` | Optional. Proceeds only after phase name matched any one in the list. This value must consist of lower-case letters, numbers, and hyphens, start with a letter and end with a letter or a number, and have a max length of 63 characters. In other words, it must match the following regex: `^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$`. | false | None | None |

### repair_rollout_rule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | Required. ID of the rule. This id must be unique in the `Automation` resource to which this rule belongs. The format is `a-z{0,62}`. | true | None | None |
| `phases` | Optional. Phases within which jobs are subject to automatic repair actions on failure. Proceeds only after phase name matched any one in the list, or for all phases if unspecified. This value must consist of lower-case letters, numbers, and hyphens, start with a letter and end with a letter or a number, and have a max length of 63 characters. In other words, it must match the following regex: ^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$. | false | None | None |
| `jobs` | Optional. Jobs to repair. Proceeds only after job name matched any one in the list, or for all jobs if unspecified or empty. The phase that includes the job must match the phase ID specified in sourcePhase. This value must consist of lower-case letters, numbers, and hyphens, start with a letter and end with a letter or a number, and have a max length of 63 characters. In other words, it must match the following regex: ^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$. | false | None | None |
| `repair_phases` | Optional. Proceeds only after phase name matched any one in the list. This value must consist of lower-case letters, numbers, and hyphens, start with a letter and end with a letter or a number, and have a max length of 63 characters. In other words, it must match the following regex: `^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$`. Structure is [documented below](#nested_rules_rules_repair_rollout_rule_repair_phases). | false | None | None |

### repair_phases Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `retry` | Optional. Retries a failed job. Structure is [documented below](#nested_rules_rules_repair_rollout_rule_repair_phases_repair_phases_retry). | false | None | None |
| `rollback` | Optional. Rolls back a Rollout. Structure is [documented below](#nested_rules_rules_repair_rollout_rule_repair_phases_repair_phases_rollback). | false | None | None |

### retry Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `attempts` | Required. Total number of retries. Retry is skipped if set to 0; The minimum value is 1, and the maximum value is 10. | true | None | None |
| `wait` | Optional. How long to wait for the first retry. Default is 0, and the maximum value is 14d. A duration in seconds with up to nine fractional digits, ending with 's'. Example: `3.5s`. | false | None | None |
| `backoff_mode` | Optional. The pattern of how wait time will be increased. Default is linear. Backoff mode will be ignored if wait is 0. Possible values are: `BACKOFF_MODE_UNSPECIFIED`, `BACKOFF_MODE_LINEAR`, `BACKOFF_MODE_EXPONENTIAL`. | false | None | None |

### rollback Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `destination_phase` | Optional. The starting phase ID for the Rollout. If unspecified, the Rollout will start in the stable phase. | false | None | None |
| `disable_rollback_if_rollout_pending` | Optional. If pending rollout exists on the target, the rollback operation will be aborted. | false | None | None |

### timed_promote_release_rule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | Required. ID of the rule. This id must be unique in the `Automation` resource to which this rule belongs. The format is `a-z{0,62}`. | true | None | None |
| `destination_target_id` | Optional. The ID of the stage in the pipeline to which this Release is deploying. If unspecified, default it to the next stage in the promotion flow. The value of this field could be one of the following: - The last segment of a target name - "@next", the next target in the promotion sequence" | false | None | None |
| `schedule` | Required. Schedule in crontab format. e.g. `0 9 * * 1` for every Monday at 9am. | true | None | None |
| `time_zone` | Required. The time zone in IANA format IANA Time Zone Database (e.g. America/New_York). | true | None | None |
| `destination_phase` | Optional. The starting phase of the rollout created by this rule. Default to the first phase. | false | None | None |
