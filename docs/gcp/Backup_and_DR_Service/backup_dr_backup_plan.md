## 🛡️ Policy Deployment Engine: `backup_dr_backup_plan`

This section provides a concise policy evaluation for the `backup_dr_backup_plan` resource in GCP.

Reference: [Terraform Registry – backup_dr_backup_plan](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/backup_dr_backup_plan)

---

## 1. Argument Reference

### `backup_vault`
- Description: (Required) Backup vault where the backups gets stored using this Backup plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_type`
- Description: (Required) The resource type to which the `BackupPlan` will be applied. Examples include, "compute.googleapis.com/Instance", "compute.googleapis.com/Disk", "sqladmin.googleapis.com/Instance" and "storage.googleapis.com/Bucket".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_rules`
- Description: (Required) The backup rules for this `BackupPlan`. There must be at least one `BackupRule` message. Structure is [documented below](#nested_backup_rules).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the backup plan
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_plan_id`
- Description: (Required) The ID of the backup plan
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) The description allows for additional details about `BackupPlan` and its use cases to be provided.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_retention_days`
- Description: (Optional) This is only applicable for CloudSql resource. Days for which logs will be stored. This value should be greater than or equal to minimum enforced log retention duration of the backup vault.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_backup_rules"></a>The `backup_rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rule_id`
- Description: (Required) The unique ID of this `BackupRule`. The `rule_id` is unique per `BackupPlan`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_retention_days`
- Description: (Required) Configures the duration for which backup data will be kept. The value should be greater than or equal to minimum enforced retention of the backup vault.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `standard_schedule`
- Description: (Required) StandardSchedule defines a schedule that runs within the confines of a defined window of days. Structure is [documented below](#nested_backup_rules_backup_rules_standard_schedule). <a name="nested_backup_rules_backup_rules_standard_schedule"></a>The `standard_schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `recurrence_type`
- Description: (Required) RecurrenceType enumerates the applicable periodicity for the schedule. Possible values are: `HOURLY`, `DAILY`, `WEEKLY`, `MONTHLY`, `YEARLY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hourly_frequency`
- Description: (Optional) Specifies frequency for hourly backups. An hourly frequency of 2 means jobs will run every 2 hours from start time till end time defined. This is required for `recurrence_type`, `HOURLY` and is not applicable otherwise.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `days_of_week`
- Description: (Optional) Specifies days of week like MONDAY or TUESDAY, on which jobs will run. This is required for `recurrence_type`, `WEEKLY` and is not applicable otherwise. Each value may be one of: `DAY_OF_WEEK_UNSPECIFIED`, `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `days_of_month`
- Description: (Optional) Specifies days of months like 1, 5, or 14 on which jobs will run.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `week_day_of_month`
- Description: (Optional) Specifies a week day of the month like FIRST SUNDAY or LAST MONDAY, on which jobs will run. Structure is [documented below](#nested_backup_rules_backup_rules_standard_schedule_week_day_of_month).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `months`
- Description: (Optional) Specifies values of months Each value may be one of: `MONTH_UNSPECIFIED`, `JANUARY`, `FEBRUARY`, `MARCH`, `APRIL`, `MAY`, `JUNE`, `JULY`, `AUGUST`, `SEPTEMBER`, `OCTOBER`, `NOVEMBER`, `DECEMBER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_zone`
- Description: (Required) The time zone to be used when interpreting the schedule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_window`
- Description: (Optional) A BackupWindow defines the window of the day during which backup jobs will run. Jobs are queued at the beginning of the window and will be marked as `NOT_RUN` if they do not start by the end of the window. Structure is [documented below](#nested_backup_rules_backup_rules_standard_schedule_backup_window). <a name="nested_backup_rules_backup_rules_standard_schedule_week_day_of_month"></a>The `week_day_of_month` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `week_of_month`
- Description: (Required) WeekOfMonth enumerates possible weeks in the month, e.g. the first, third, or last week of the month. Possible values are: `WEEK_OF_MONTH_UNSPECIFIED`, `FIRST`, `SECOND`, `THIRD`, `FOURTH`, `LAST`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day_of_week`
- Description: (Required) Specifies the day of the week. Possible values are: `DAY_OF_WEEK_UNSPECIFIED`, `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. <a name="nested_backup_rules_backup_rules_standard_schedule_backup_window"></a>The `backup_window` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_hour_of_day`
- Description: (Required) The hour of the day (0-23) when the window starts, for example, if the value of the start hour of the day is 6, that means the backup window starts at 6:00.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_hour_of_day`
- Description: (Optional) The hour of the day (1-24) when the window ends, for example, if the value of end hour of the day is 10, that means the backup window end time is 10:00. The end hour of the day should be greater than the start
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
