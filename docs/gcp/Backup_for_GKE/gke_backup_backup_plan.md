## 🛡️ Policy Deployment Engine: `gke_backup_backup_plan`

This section provides a concise policy evaluation for the `gke_backup_backup_plan` resource in GCP.

Reference: [Terraform Registry – gke_backup_backup_plan](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_backup_backup_plan)

---

## 1. Argument Reference

### `name`
- Description: (Required) The full name of the BackupPlan Resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster`
- Description: (Required) The source cluster from which Backups will be created via this BackupPlan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The region of the Backup Plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) User specified descriptive string for this BackupPlan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retention_policy`
- Description: (Optional) RetentionPolicy governs lifecycle of Backups created under this plan. Structure is [documented below](#nested_retention_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Description: A set of custom labels supplied by the user. A list of key->value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_schedule`
- Description: (Optional) Defines a schedule for automatic Backup creation via this BackupPlan. Structure is [documented below](#nested_backup_schedule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deactivated`
- Description: (Optional) This flag indicates whether this BackupPlan has been deactivated. Setting this field to True locks the BackupPlan such that no further updates will be allowed (except deletes), including the deactivated field itself. It also prevents any new Backups from being created via this BackupPlan (including scheduled Backups).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_config`
- Description: (Optional) Defines the configuration of Backups created via this BackupPlan. Structure is [documented below](#nested_backup_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_retention_policy"></a>The `retention_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_delete_lock_days`
- Description: (Optional) Minimum age for a Backup created via this BackupPlan (in days). Must be an integer value between 0-90 (inclusive). A Backup created under this BackupPlan will not be deletable until it reaches Backup's (create time + backup_delete_lock_days). Updating this field of a BackupPlan does not affect existing Backups. Backups created after a successful update will inherit this new value.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_retain_days`
- Description: (Optional) The default maximum age of a Backup created via this BackupPlan. This field MUST be an integer value >= 0 and <= 365. If specified, a Backup created under this BackupPlan will be automatically deleted after its age reaches (createTime + backupRetainDays). If not specified, Backups created under this BackupPlan will NOT be subject to automatic deletion. Updating this field does NOT affect existing Backups under it. Backups created AFTER a successful update will automatically pick up the new value. NOTE: backupRetainDays must be >= backupDeleteLockDays. If cronSchedule is defined, then this must be <= 360 * the creation interval. If rpo_config is defined, then this must be <= 360 * targetRpoMinutes/(1440minutes/day)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `locked`
- Description: (Optional) This flag denotes whether the retention policy of this BackupPlan is locked. If set to True, no further update is allowed on this policy, including the locked field itself. <a name="nested_backup_schedule"></a>The `backup_schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cron_schedule`
- Description: (Optional) A standard cron string that defines a repeating schedule for creating Backups via this BackupPlan. This is mutually exclusive with the rpoConfig field since at most one schedule can be defined for a BackupPlan. If this is defined, then backupRetainDays must also be defined.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `paused`
- Description: (Optional) This flag denotes whether automatic Backup creation is paused for this BackupPlan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rpo_config`
- Description: (Optional) Defines the RPO schedule configuration for this BackupPlan. This is mutually exclusive with the cronSchedule field since at most one schedule can be defined for a BackupPLan. If this is defined, then backupRetainDays must also be defined. Structure is [documented below](#nested_backup_schedule_rpo_config). <a name="nested_backup_schedule_rpo_config"></a>The `rpo_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `target_rpo_minutes`
- Description: (Required) Defines the target RPO for the BackupPlan in minutes, which means the target maximum data loss in time that is acceptable for this BackupPlan. This must be at least 60, i.e., 1 hour, and at most 86400, i.e., 60 days.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `exclusion_windows`
- Description: (Optional) User specified time windows during which backup can NOT happen for this BackupPlan. Backups should start and finish outside of any given exclusion window. Note: backup jobs will be scheduled to start and finish outside the duration of the window as much as possible, but running jobs will not get canceled when it runs into the window. All the time and date values in exclusionWindows entry in the API are in UTC. We only allow <=1 recurrence (daily or weekly) exclusion window for a BackupPlan while no restriction on number of single occurrence windows. Structure is [documented below](#nested_backup_schedule_rpo_config_exclusion_windows). <a name="nested_backup_schedule_rpo_config_exclusion_windows"></a>The `exclusion_windows` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Required) Specifies the start time of the window using time of the day in UTC. Structure is [documented below](#nested_backup_schedule_rpo_config_exclusion_windows_exclusion_windows_start_time).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `duration`
- Description: (Required) Specifies duration of the window in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". Restrictions for duration based on the recurrence type to allow some time for backup to happen: - single_occurrence_date:  no restriction - daily window: duration < 24 hours - weekly window: - days of week includes all seven days of a week: duration < 24 hours - all other weekly window: duration < 168 hours (i.e., 24 * 7 hours)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `single_occurrence_date`
- Description: (Optional) No recurrence. The exclusion window occurs only once and on this date in UTC. Only one of singleOccurrenceDate, daily and daysOfWeek may be set. Structure is [documented below](#nested_backup_schedule_rpo_config_exclusion_windows_exclusion_windows_single_occurrence_date).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `daily`
- Description: (Optional) The exclusion window occurs every day if set to "True". Specifying this field to "False" is an error. Only one of singleOccurrenceDate, daily and daysOfWeek may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `days_of_week`
- Description: (Optional) The exclusion window occurs on these days of each week in UTC. Only one of singleOccurrenceDate, daily and daysOfWeek may be set. Structure is [documented below](#nested_backup_schedule_rpo_config_exclusion_windows_exclusion_windows_days_of_week). <a name="nested_backup_schedule_rpo_config_exclusion_windows_exclusion_windows_start_time"></a>The `start_time` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hours`
- Description: (Optional) Hours of day in 24 hour format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minutes`
- Description: (Optional) Minutes of hour of day.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Seconds of minutes of the time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Fractions of seconds in nanoseconds. <a name="nested_backup_schedule_rpo_config_exclusion_windows_exclusion_windows_single_occurrence_date"></a>The `single_occurrence_date` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `year`
- Description: (Optional) Year of the date.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `month`
- Description: (Optional) Month of a year.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day`
- Description: (Optional) Day of a month. <a name="nested_backup_schedule_rpo_config_exclusion_windows_exclusion_windows_days_of_week"></a>The `days_of_week` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `days_of_week`
- Description: (Optional) A list of days of week. Each value may be one of: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. <a name="nested_backup_config"></a>The `backup_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_volume_data`
- Description: (Optional) This flag specifies whether volume data should be backed up when PVCs are included in the scope of a Backup.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `include_secrets`
- Description: (Optional) This flag specifies whether Kubernetes Secret resources should be included when they fall into the scope of Backups.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_key`
- Description: (Optional) This defines a customer managed encryption key that will be used to encrypt the "config" portion (the Kubernetes resources) of Backups created via this plan. Structure is [documented below](#nested_backup_config_encryption_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `all_namespaces`
- Description: (Optional) If True, include all namespaced resources.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `selected_namespaces`
- Description: (Optional) If set, include just the resources in the listed namespaces. Structure is [documented below](#nested_backup_config_selected_namespaces).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `selected_applications`
- Description: (Optional) A list of namespaced Kubernetes Resources. Structure is [documented below](#nested_backup_config_selected_applications).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `permissive_mode`
- Description: (Optional) This flag specifies whether Backups will not fail when Backup for GKE detects Kubernetes configuration that is non-standard or requires additional setup to restore. <a name="nested_backup_config_encryption_key"></a>The `encryption_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcp_kms_encryption_key`
- Description: (Required) Google Cloud KMS encryption key. Format: projects/*/locations/*/keyRings/*/cryptoKeys/* <a name="nested_backup_config_selected_namespaces"></a>The `selected_namespaces` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespaces`
- Description: (Required) A list of Kubernetes Namespaces. <a name="nested_backup_config_selected_applications"></a>The `selected_applications` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespaced_names`
- Description: (Required) A list of namespaced Kubernetes resources. Structure is [documented below](#nested_backup_config_selected_applications_namespaced_names). <a name="nested_backup_config_selected_applications_namespaced_names"></a>The `namespaced_names` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `namespace`
- Description: (Required) The namespace of a Kubernetes Resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of a Kubernetes Resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
