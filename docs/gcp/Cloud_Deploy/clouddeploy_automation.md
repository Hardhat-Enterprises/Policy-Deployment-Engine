## 🛡️ Policy Deployment Engine: `clouddeploy_automation`

This section provides a concise policy evaluation for the `clouddeploy_automation` resource in GCP.

Reference: [Terraform Registry – clouddeploy_automation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/clouddeploy_automation)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Name of the `Automation`. | true | false | Display name has no impact on the security of the resource or data contained. | None | None |
| `service_account` | Required. Email address of the user-managed IAM service account that creates Cloud Deploy release and rollout resources. | true | true | Controls the identity that executes automation. Improper service accounts can lead to privilege escalation or excessive permissions.  | dedicated-automation-sa@my-project.iam.gserviceaccount.com | generic-sa@my-project.iam.gserviceaccount.com |
| `selector` | Required. Selected resources to which the automation will be applied. Structure is [documented below](#nested_selector). | true | false | Defines the scope of targets the automation applies to (e.g., specific targets or all targets). The security of actions on those targets is governed by the service_account's permissions, not the selection itself. | None | None |
| `rules` | Required. List of Automation rules associated with the Automation resource. Must have at least one rule and limited to 250 rules per Delivery Pipeline. Note: the order of the rules here is not the same as the order of execution. Structure is [documented below](#nested_rules). | true | false | Rules define the automation's behavior and logic but do not, by themselves, grant permissions or change access controls. The security of the actions they trigger is governed by the service account's IAM permissions and the 'suspended' state. | None | None |
| `location` | The location for the resource | true | false | A geographical identifier (e.g., 'us-central1') for data residency. It does not confer any access rights or security capabilities. | None | None |
| `delivery_pipeline` | The delivery_pipeline for the resource | true | false | A reference to an existing pipeline resource. This is an identifier and does not alter the security posture; access to the pipeline is controlled by its own IAM policies. | None | None |
| `description` | Optional. Description of the `Automation`. Max length is 255 characters. | false | false | Purely descriptive metadata for human readability. Has no functional impact on the automation's execution or permissions. | None | None |
| `annotations` | Optional. User annotations. These attributes can only be set and used by the user, and not by Cloud Deploy. Annotations must meet the following constraints: * Annotations are key/value pairs. * Valid annotation keys have two segments: an optional prefix and name, separated by a slash (`/`). * The name segment is required and must be 63 characters or less, beginning and ending with an alphanumeric character (`[a-z0-9A-Z]`) with dashes (`-`), underscores (`_`), dots (`.`), and alphanumerics between. * The prefix is optional. If specified, the prefix must be a DNS subdomain: a series of DNS labels separated by dots(`.`), not longer than 253 characters in total, followed by a slash (`/`). See https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/#syntax-and-character-set for more details. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Key-value pairs for user-defined metadata. While they could be misused to store sensitive data (which is a bad practice), the annotations themselves do not affect the permissions or execution logic of the Cloud Deploy service. | None | None |
| `labels` | Optional. Labels are attributes that can be set and used by both the user and by Cloud Deploy. Labels must meet the following constraints: * Keys and values can contain only lowercase letters, numeric characters, underscores, and dashes. * All characters must use UTF-8 encoding, and international characters are allowed. * Keys must start with a lowercase letter or international character. * Each resource is limited to a maximum of 64 labels. Both keys and values are additionally constrained to be <= 63 characters. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Used for organizing and filtering resources. Like annotations, they should not contain secrets but are not used for authorization decisions and have no security impact on the automation's function. | None | None |
| `suspended` | Optional. When Suspended, automation is deactivated from execution. | false | true | This is a master on/off switch for the automation. If set to 'false' or not set, the automation will run according to its rules. If set to 'true' incorrectly, it can disrupt deployment processes. If left 'false' when it should be disabled, it can cause unintended automatic deployments. | False | True |
| `project` | If it is not provided, the provider project is used. | false | false | An identifier for resource placement and billing. The project itself has security boundaries (IAM policies, etc.), but this argument simply points to it and does not alter those boundaries. | None | None |
| `targets` |  | false | false | None | None | None |
| `promote_release_rule` | Optional. PromoteReleaseRule will automatically promote a release from the current target to a specified target. Structure is documented below. | false | false | Defines the conditions for a promotion but cannot execute it without the permissions granted to the service_account. The security impact is contingent on that principal's rights. | None | None |
| `advance_rollout_rule` | Optional. The AdvanceRolloutRule will automatically advance a successful Rollout.  | false | false | Defines the conditions for advancing a rollout but cannot execute it without the permissions granted to the service_account. The security impact is contingent on that principal's rights. | None | None |
| `repair_rollout_rule` | Optional. The `RepairRolloutRule` will automatically repair a failed rollout. | false | false | Defines the conditions and actions for repairing a rollout but cannot execute them without the permissions granted to the service_account. The security impact is contingent on that principal's rights. | None | None |
| `repair_phases` | Proceeds only after phase name matched any one in the list. This value must consist of lower-case letters, numbers, and hyphens, start with a letter and end with a letter or a number, and have a max length of 63 characters. In other words, it must match the following regex: `^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$`. Structure is [documented below](#nested_rules_rules_repair_rollout_rule_repair_phases). | false | false | A container block that defines one or more repair strategies (e.g., retry, rollback). The choice of strategy is an operational decision on 'how' to fix a failure. The ability to actually perform the retry or rollback action is solely determined by the service_account's permissions. | None | None |
| `retry` |  | false | false | None | None | None |
| `rollback` |  | false | false | None | None | None |
| `timed_promote_release_rule` | Optional. The `TimedPromoteReleaseRule` will automatically promote a release from the current target(s) to the specified target(s) on a configured schedule. | false | false | Defines a schedule for automatic promotions but cannot execute them without the permissions granted to the service_account. The security impact is contingent on that principal's rights. | None | None |

### selector Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `targets` | Contains attributes about a target. Structure is [documented below](#nested_selector_targets). | true | false | None | None | None |

### rules Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `promote_release_rule` | Optional. `PromoteReleaseRule` will automatically promote a release from the current target to a specified target. Structure is [documented below](#nested_rules_rules_promote_release_rule). | false | false | Defines the conditions for a promotion but cannot execute it without the permissions granted to the service_account. The security impact is contingent on that principal's rights. | None | None |
| `advance_rollout_rule` | Optional. The `AdvanceRolloutRule` will automatically advance a successful Rollout. Structure is [documented below](#nested_rules_rules_advance_rollout_rule). | false | false | Defines the conditions for advancing a rollout but cannot execute it without the permissions granted to the service_account. The security impact is contingent on that principal's rights | None | None |
| `repair_rollout_rule` | Optional. The RepairRolloutRule will automatically repair a failed rollout. Structure is [documented below](#nested_rules_rules_repair_rollout_rule). | false | false | Defines the conditions and actions for repairing a rollout but cannot execute them without the permissions granted to the service_account. The security impact is contingent on that principal's rights. | None | None |
| `timed_promote_release_rule` | Optional. The `TimedPromoteReleaseRule` will automatically promote a release from the current target(s) to the specified target(s) on a configured schedule. Structure is [documented below](#nested_rules_rules_timed_promote_release_rule). | false | false | Defines a schedule for automatic promotions but cannot execute them without the permissions granted to the service_account. The security impact is contingent on that principal's rights. | None | None |

### targets Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` | ID of the `Target`. The value of this field could be one of the following: * The last segment of a target name. It only needs the ID to determine which target is being referred to * "*", all targets in a location. | false | false | Specifies which target(s) to act upon. Using "*" broadens scope but does not grant new permissions; the service_account must already have access to all targets for any action to succeed. | None | None |
| `labels` | Target labels. | false | false | Used to select targets based on metadata labels. This is a filtering operation and does not bypass IAM checks performed against the service_account when actions are executed on those targets. | None | None |

### promote_release_rule Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` | Required. ID of the rule. This id must be unique in the `Automation` resource to which this rule belongs. The format is `a-z{0,62}`. | true | false | None | None | None |
| `wait` | Optional. How long the release need to be paused until being promoted to the next target. | false | false | None | None | None |
| `destination_target_id` | Optional. The ID of the stage in the pipeline to which this `Release` is deploying. If unspecified, default it to the next stage in the promotion flow. The value of this field could be one of the following: * The last segment of a target name. It only needs the ID to determine if the target is one of the stages in the promotion sequence defined in the pipeline. * "@next", the next target in the promotion sequence. | false | false | None | None | None |
| `destination_phase` | Optional. The starting phase of the rollout created by this operation. Default to the first phase. | false | false | None | None | None |

### advance_rollout_rule Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` | Required. ID of the rule. This id must be unique in the `Automation` resource to which this rule belongs. The format is `a-z{0,62}`. | true | false | None | None | None |
| `wait` | Optional. How long to wait after a rollout is finished. | false | false | None | None | None |
| `source_phases` | Optional. Proceeds only after phase name matched any one in the list. This value must consist of lower-case letters, numbers, and hyphens, start with a letter and end with a letter or a number, and have a max length of 63 characters. In other words, it must match the following regex: `^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$`. | false | false | None | None | None |

### repair_rollout_rule Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` | Required. ID of the rule. This id must be unique in the `Automation` resource to which this rule belongs. The format is `a-z{0,62}`. | true | false | None | None | None |
| `phases` | Optional. Phases within which jobs are subject to automatic repair actions on failure. Proceeds only after phase name matched any one in the list, or for all phases if unspecified. This value must consist of lower-case letters, numbers, and hyphens, start with a letter and end with a letter or a number, and have a max length of 63 characters. In other words, it must match the following regex: ^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$. | false | false | None | None | None |
| `jobs` | Optional. Jobs to repair. Proceeds only after job name matched any one in the list, or for all jobs if unspecified or empty. The phase that includes the job must match the phase ID specified in sourcePhase. This value must consist of lower-case letters, numbers, and hyphens, start with a letter and end with a letter or a number, and have a max length of 63 characters. In other words, it must match the following regex: ^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$. | false | false | None | None | None |
| `repair_phases` | Optional. Proceeds only after phase name matched any one in the list. This value must consist of lower-case letters, numbers, and hyphens, start with a letter and end with a letter or a number, and have a max length of 63 characters. In other words, it must match the following regex: `^[a-z]([a-z0-9-]{0,61}[a-z0-9])?$`. Structure is [documented below](#nested_rules_rules_repair_rollout_rule_repair_phases). | false | false | None | None | None |

### repair_phases Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `retry` | Optional. Retries a failed job. Structure is [documented below](#nested_rules_rules_repair_rollout_rule_repair_phases_repair_phases_retry). | false | false | None | None | None |
| `rollback` | Optional. Rolls back a Rollout. Structure is [documented below](#nested_rules_rules_repair_rollout_rule_repair_phases_repair_phases_rollback). | false | false | None | None | None |

### retry Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `attempts` | Required. Total number of retries. Retry is skipped if set to 0; The minimum value is 1, and the maximum value is 10. | true | false | None | None | None |
| `wait` | Optional. How long to wait for the first retry. Default is 0, and the maximum value is 14d. A duration in seconds with up to nine fractional digits, ending with 's'. Example: `3.5s`. | false | false | None | None | None |
| `backoff_mode` | Optional. The pattern of how wait time will be increased. Default is linear. Backoff mode will be ignored if wait is 0. Possible values are: `BACKOFF_MODE_UNSPECIFIED`, `BACKOFF_MODE_LINEAR`, `BACKOFF_MODE_EXPONENTIAL`. | false | false | None | None | None |

### rollback Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `destination_phase` | Optional. The starting phase ID for the Rollout. If unspecified, the Rollout will start in the stable phase. | false | false | None | None | None |
| `disable_rollback_if_rollout_pending` | Optional. If pending rollout exists on the target, the rollback operation will be aborted. | false | false | None | None | None |

### timed_promote_release_rule Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` | Required. ID of the rule. This id must be unique in the `Automation` resource to which this rule belongs. The format is `a-z{0,62}`. | true | false | None | None | None |
| `destination_target_id` | Optional. The ID of the stage in the pipeline to which this Release is deploying. If unspecified, default it to the next stage in the promotion flow. The value of this field could be one of the following: - The last segment of a target name - "@next", the next target in the promotion sequence" | false | false | None | None | None |
| `schedule` | Required. Schedule in crontab format. e.g. `0 9 * * 1` for every Monday at 9am. | true | false | None | None | None |
| `time_zone` | Required. The time zone in IANA format IANA Time Zone Database (e.g. America/New_York). | true | false | None | None | None |
| `destination_phase` | Optional. The starting phase of the rollout created by this rule. Default to the first phase. | false | false | None | None | None |
