## 🛡️ Policy Deployment Engine: `backup_dr_backup_plan`

This section provides a concise policy evaluation for the `backup_dr_backup_plan` resource in GCP.

Reference: [Terraform Registry – backup_dr_backup_plan](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/backup_dr_backup_plan)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `backup_vault` | Backup vault where the backups gets stored using this Backup plan. | true | false | This setting is not enforced by policy and does not directly impact security controls for this service. | None | None |
| `resource_type` | The resource type to which the `BackupPlan` will be applied. Examples include, "compute.googleapis.com/Instance", "compute.googleapis.com/Disk", "sqladmin.googleapis.com/Instance" and "storage.googleapis.com/Bucket". | true | false | This setting is not enforced by policy and does not directly impact security controls for this service. | None | None |
| `backup_rules` | The backup rules for this `BackupPlan`. There must be at least one `BackupRule` message. Structure is [documented below](#nested_backup_rules). | true | false | This block groups backup rule settings and is not directly enforced by policy. | None | None |
| `location` | The location for the backup plan | true | false | Location; not enforced by policy. | None | None |
| `backup_plan_id` | The ID of the backup plan | true | false |  Plan id has no impact on the security of the resource or data contained. | None | None |
| `description` | The description allows for additional details about `BackupPlan` and its use cases to be provided. | false | false | Description has no impact on the security of the resource or data contained. | None | None |
| `log_retention_days` | This is only applicable for CloudSql resource. Days for which logs will be stored. This value should be greater than or equal to minimum enforced log retention duration of the backup vault. | false | false | Log retention is a configuration setting and does not directly impact security. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Project is a configuration setting and does not directly impact security. | None | None |

### backup_rules Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `rule_id` | The unique ID of this `BackupRule`. The `rule_id` is unique per `BackupPlan`. | true | false | This is a identifier only and does not impact security controls for this service. | None | None |
| `backup_retention_days` | Required. Configures the duration for which backup data will be kept. Retention_days must be between 7 and 365 days | true | true | Lower period of retention increases data loss and compliance risk. | [7, 30, 365] | [0, 1] |
| `standard_schedule` | Standard schedule for taking backups. Structure is [documented below](#nested_backup_rules_backup_rules_standard_schedule). | true | false | Security rules apply to fields inside this block, not the block itself. | None | None |

###   standard_schedule Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `recurrence_type` | Required. Configures the duration for which backup data will be kept. Recurrence type should be DAILY or WEEKLY | true | true | Frequency period impacts recovery and compliance. Values outside the approved range increase data loss and compliance risk. | ['DAILY', 'WEEKLY'] | ['HOURLY'] |
  | `hourly_frequency` | Specifies frequency for hourly backups. An hourly frequency of 2 means jobs will run every 2 hours from start time till end time defined. This is required for `recurrence_type`, `HOURLY` and is not applicable otherwise. | false | false | Scheduling configuration; not enforced by policy. | None | None |
  | `days_of_week` | Specifies days of week like MONDAY or TUESDAY, on which jobs will run. This is required for `recurrence_type`, `WEEKLY` and is not applicable otherwise. Each value may be one of: `DAY_OF_WEEK_UNSPECIFIED`, `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | false | false | Scheduling configuration; not enforced by policy. | None | None |
  | `days_of_month` | Specifies days of months like 1, 5, or 14 on which jobs will run. | false | false | Scheduling configuration; not enforced by policy. | None | None |
  | `week_day_of_month` | Specifies a week day of the month like FIRST SUNDAY or LAST MONDAY, on which jobs will run. Structure is [documented below](#nested_backup_rules_backup_rules_standard_schedule_week_day_of_month). | false | false | Scheduling configuration; not enforced by policy. | None | None |
  | `months` | Specifies values of months Each value may be one of: `MONTH_UNSPECIFIED`, `JANUARY`, `FEBRUARY`, `MARCH`, `APRIL`, `MAY`, `JUNE`, `JULY`, `AUGUST`, `SEPTEMBER`, `OCTOBER`, `NOVEMBER`, `DECEMBER`. | false | false | Scheduling configuration; not enforced by policy. | None | None |
  | `time_zone` | The time zone to be used when interpreting the schedule. | true | false | Scheduling configuration; not enforced by policy. | None | None |
  | `backup_window` | A BackupWindow defines the window of the day during which backup jobs will run. Jobs are queued at the beginning of the window and will be marked as `NOT_RUN` if they do not start by the end of the window. Structure is [documented below](#nested_backup_rules_backup_rules_standard_schedule_backup_window). | false | false | Scheduling configuration; not enforced by policy. | None | None |

###     backup_window Block

    | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
    |----------|-------------|----------|-----------------|-----------|-----------|---------------|
    | `start_hour_of_day` | The hour of the day (0-23) when the window starts, for example, if the value of the start hour of the day is 6, that means the backup window starts at 6:00. | true | false | Scheduling configuration; not enforced by policy. | None | None |
    | `end_hour_of_day` | The hour of the day (1-24) when the window ends, for example, if the value of end hour of the day is 10, that means the backup window end time is 10:00. The end hour of the day should be greater than the start | false | false | Scheduling configuration; not enforced by policy. | None | None |
