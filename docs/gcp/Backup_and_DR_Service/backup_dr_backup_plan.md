## 🛡️ Policy Deployment Engine: `backup_dr_backup_plan`

This section provides a concise policy evaluation for the `backup_dr_backup_plan` resource in GCP.

Reference: [Terraform Registry – backup_dr_backup_plan](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/backup_dr_backup_plan)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `backup_vault` | Backup vault where the backups gets stored using this Backup plan. | true | false | None | None | None |
| `resource_type` | The resource type to which the `BackupPlan` will be applied. Examples include, "compute.googleapis.com/Instance", "compute.googleapis.com/Disk", "sqladmin.googleapis.com/Instance" and "storage.googleapis.com/Bucket". | true | false | None | None | None |
| `backup_rules` | The backup rules for this `BackupPlan`. There must be at least one `BackupRule` message. Structure is [documented below](#nested_backup_rules). | true | false | None | None | None |
| `location` | The location for the backup plan | true | false | None | None | None |
| `backup_plan_id` | The ID of the backup plan | true | false | None | None | None |
| `description` | The description allows for additional details about `BackupPlan` and its use cases to be provided. | false | false | None | None | None |
| `log_retention_days` | This is only applicable for CloudSql resource. Days for which logs will be stored. This value should be greater than or equal to minimum enforced log retention duration of the backup vault. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `standard_schedule` |  | false | false | None | None | None |
| `week_day_of_month` |  | false | false | None | None | None |
| `backup_window` |  | false | false | None | None | None |

### backup_rules Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `rule_id` | The unique ID of this `BackupRule`. The `rule_id` is unique per `BackupPlan`. | true | false | None | None | None |
| `backup_retention_days` | Configures the duration for which backup data will be kept. The value should be greater than or equal to minimum enforced retention of the backup vault. | true | false | None | None | None |
| `standard_schedule` | StandardSchedule defines a schedule that runs within the confines of a defined window of days. Structure is [documented below](#nested_backup_rules_backup_rules_standard_schedule). | true | false | None | None | None |

### standard_schedule Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `recurrence_type` | RecurrenceType enumerates the applicable periodicity for the schedule. Possible values are: `HOURLY`, `DAILY`, `WEEKLY`, `MONTHLY`, `YEARLY`. | true | false | None | None | None |
| `hourly_frequency` | Specifies frequency for hourly backups. An hourly frequency of 2 means jobs will run every 2 hours from start time till end time defined. This is required for `recurrence_type`, `HOURLY` and is not applicable otherwise. | false | false | None | None | None |
| `days_of_week` | Specifies days of week like MONDAY or TUESDAY, on which jobs will run. This is required for `recurrence_type`, `WEEKLY` and is not applicable otherwise. Each value may be one of: `DAY_OF_WEEK_UNSPECIFIED`, `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | false | false | None | None | None |
| `days_of_month` | Specifies days of months like 1, 5, or 14 on which jobs will run. | false | false | None | None | None |
| `week_day_of_month` | Specifies a week day of the month like FIRST SUNDAY or LAST MONDAY, on which jobs will run. Structure is [documented below](#nested_backup_rules_backup_rules_standard_schedule_week_day_of_month). | false | false | None | None | None |
| `months` | Specifies values of months Each value may be one of: `MONTH_UNSPECIFIED`, `JANUARY`, `FEBRUARY`, `MARCH`, `APRIL`, `MAY`, `JUNE`, `JULY`, `AUGUST`, `SEPTEMBER`, `OCTOBER`, `NOVEMBER`, `DECEMBER`. | false | false | None | None | None |
| `time_zone` | The time zone to be used when interpreting the schedule. | true | false | None | None | None |
| `backup_window` | A BackupWindow defines the window of the day during which backup jobs will run. Jobs are queued at the beginning of the window and will be marked as `NOT_RUN` if they do not start by the end of the window. Structure is [documented below](#nested_backup_rules_backup_rules_standard_schedule_backup_window). | false | false | None | None | None |

### week_day_of_month Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `week_of_month` | WeekOfMonth enumerates possible weeks in the month, e.g. the first, third, or last week of the month. Possible values are: `WEEK_OF_MONTH_UNSPECIFIED`, `FIRST`, `SECOND`, `THIRD`, `FOURTH`, `LAST`. | true | false | None | None | None |
| `day_of_week` | Specifies the day of the week. Possible values are: `DAY_OF_WEEK_UNSPECIFIED`, `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | true | false | None | None | None |

### backup_window Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `start_hour_of_day` | The hour of the day (0-23) when the window starts, for example, if the value of the start hour of the day is 6, that means the backup window starts at 6:00. | true | false | None | None | None |
| `end_hour_of_day` | The hour of the day (1-24) when the window ends, for example, if the value of end hour of the day is 10, that means the backup window end time is 10:00. The end hour of the day should be greater than the start | false | false | None | None | None |
