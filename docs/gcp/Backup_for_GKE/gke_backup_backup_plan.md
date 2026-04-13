## 🛡️ Policy Deployment Engine: `gke_backup_backup_plan`

This section provides a concise policy evaluation for the `gke_backup_backup_plan` resource in GCP.

Reference: [Terraform Registry – gke_backup_backup_plan](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_backup_backup_plan)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The full name of the BackupPlan Resource. | true | false | None | None | None |
| `cluster` | The source cluster from which Backups will be created via this BackupPlan. | true | false | None | None | None |
| `location` | The region of the Backup Plan. | true | true | Data sovereignty requires backups to be stored in specific Australian regions. | australia-southeast1 | us-central1 |
| `description` | User specified descriptive string for this BackupPlan. | false | false | None | None | None |
| `retention_policy` | RetentionPolicy governs lifecycle of Backups created under this plan. Structure is [documented below](#nested_retention_policy). | false | false | None | None | None |
| `labels` | Description: A set of custom labels supplied by the user. A list of key->value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Labels are required for cost allocation and ownership tracking. | environment='prod', cost-center='123', owner='team' | missing required labels |
| `backup_schedule` | Defines a schedule for automatic Backup creation via this BackupPlan. Structure is [documented below](#nested_backup_schedule). | false | false | None | None | None |
| `deactivated` | This flag indicates whether this BackupPlan has been deactivated. Setting this field to True locks the BackupPlan such that no further updates will be allowed (except deletes), including the deactivated field itself. It also prevents any new Backups from being created via this BackupPlan (including scheduled Backups). | false | true | Deactivated plans do not create backups, putting data at risk. | false | true |
| `backup_config` | Defines the configuration of Backups created via this BackupPlan. Structure is [documented below](#nested_backup_config). | false | true | Backup configuration must explicitly define secret handling and encryption. | See sub-arguments | See sub-arguments |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `rpo_config` |  | false | false | None | None | None |
| `exclusion_windows` |  | false | false | None | None | None |
| `start_time` |  | false | false | None | None | None |
| `single_occurrence_date` |  | false | false | None | None | None |
| `days_of_week` |  | false | false | None | None | None |
| `encryption_key` |  | false | false | None | None | None |
| `selected_namespaces` |  | false | false | None | None | None |
| `selected_applications` |  | false | false | None | None | None |
| `namespaced_names` |  | false | false | None | None | None |

### retention_policy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `backup_delete_lock_days` | Minimum age for a Backup created via this BackupPlan (in days). Must be an integer value between 0-90 (inclusive). A Backup created under this BackupPlan will not be deletable until it reaches Backup's (create time + backup_delete_lock_days). Updating this field of a BackupPlan does not affect existing Backups. Backups created after a successful update will inherit this new value. | false | false | None | None | None |
| `backup_retain_days` | The default maximum age of a Backup created via this BackupPlan. This field MUST be an integer value >= 0 and <= 365. If specified, a Backup created under this BackupPlan will be automatically deleted after its age reaches (createTime + backupRetainDays). If not specified, Backups created under this BackupPlan will NOT be subject to automatic deletion. Updating this field does NOT affect existing Backups under it. Backups created AFTER a successful update will automatically pick up the new value. NOTE: backupRetainDays must be >= backupDeleteLockDays. If cronSchedule is defined, then this must be <= 360 * the creation interval. If rpo_config is defined, then this must be <= 360 * targetRpoMinutes/(1440minutes/day) | false | true | Retention period must be sufficient for disaster recovery but not exceed data retention policies (7-90 days). | 30 | 1 |
| `locked` | This flag denotes whether the retention policy of this BackupPlan is locked. If set to True, no further update is allowed on this policy, including the locked field itself. | false | false | None | None | None |

### backup_schedule Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cron_schedule` | A standard cron string that defines a repeating schedule for creating Backups via this BackupPlan. This is mutually exclusive with the rpoConfig field since at most one schedule can be defined for a BackupPlan. If this is defined, then backupRetainDays must also be defined. | false | true | Backups should run during off-peak hours to minimize impact. | 0 2 * * * | * * * * * |
| `paused` | This flag denotes whether automatic Backup creation is paused for this BackupPlan. | false | false | None | None | None |
| `rpo_config` | Defines the RPO schedule configuration for this BackupPlan. This is mutually exclusive with the cronSchedule field since at most one schedule can be defined for a BackupPLan. If this is defined, then backupRetainDays must also be defined. Structure is [documented below](#nested_backup_schedule_rpo_config). | false | false | None | None | None |

### backup_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `include_volume_data` | This flag specifies whether volume data should be backed up when PVCs are included in the scope of a Backup. | false | false | None | None | None |
| `include_secrets` | This flag specifies whether Kubernetes Secret resources should be included when they fall into the scope of Backups. | false | false | None | None | None |
| `encryption_key` | This defines a customer managed encryption key that will be used to encrypt the "config" portion (the Kubernetes resources) of Backups created via this plan. Structure is [documented below](#nested_backup_config_encryption_key). | false | false | None | None | None |
| `all_namespaces` | If True, include all namespaced resources. | false | false | None | None | None |
| `selected_namespaces` | If set, include just the resources in the listed namespaces. Structure is [documented below](#nested_backup_config_selected_namespaces). | false | false | None | None | None |
| `selected_applications` | A list of namespaced Kubernetes Resources. Structure is [documented below](#nested_backup_config_selected_applications). | false | false | None | None | None |
| `permissive_mode` | This flag specifies whether Backups will not fail when Backup for GKE detects Kubernetes configuration that is non-standard or requires additional setup to restore. | false | false | None | None | None |

### rpo_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `target_rpo_minutes` | Defines the target RPO for the BackupPlan in minutes, which means the target maximum data loss in time that is acceptable for this BackupPlan. This must be at least 60, i.e., 1 hour, and at most 86400, i.e., 60 days. | true | false | None | None | None |
| `exclusion_windows` | User specified time windows during which backup can NOT happen for this BackupPlan. Backups should start and finish outside of any given exclusion window. Note: backup jobs will be scheduled to start and finish outside the duration of the window as much as possible, but running jobs will not get canceled when it runs into the window. All the time and date values in exclusionWindows entry in the API are in UTC. We only allow <=1 recurrence (daily or weekly) exclusion window for a BackupPlan while no restriction on number of single occurrence windows. Structure is [documented below](#nested_backup_schedule_rpo_config_exclusion_windows). | false | false | None | None | None |

### exclusion_windows Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `start_time` | Specifies the start time of the window using time of the day in UTC. Structure is [documented below](#nested_backup_schedule_rpo_config_exclusion_windows_exclusion_windows_start_time). | true | false | None | None | None |
| `duration` | Specifies duration of the window in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". Restrictions for duration based on the recurrence type to allow some time for backup to happen: - single_occurrence_date:  no restriction - daily window: duration < 24 hours - weekly window: - days of week includes all seven days of a week: duration < 24 hours - all other weekly window: duration < 168 hours (i.e., 24 * 7 hours) | true | false | None | None | None |
| `single_occurrence_date` | No recurrence. The exclusion window occurs only once and on this date in UTC. Only one of singleOccurrenceDate, daily and daysOfWeek may be set. Structure is [documented below](#nested_backup_schedule_rpo_config_exclusion_windows_exclusion_windows_single_occurrence_date). | false | false | None | None | None |
| `daily` | The exclusion window occurs every day if set to "True". Specifying this field to "False" is an error. Only one of singleOccurrenceDate, daily and daysOfWeek may be set. | false | false | None | None | None |
| `days_of_week` | The exclusion window occurs on these days of each week in UTC. Only one of singleOccurrenceDate, daily and daysOfWeek may be set. Structure is [documented below](#nested_backup_schedule_rpo_config_exclusion_windows_exclusion_windows_days_of_week). | false | false | None | None | None |

### start_time Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `hours` | Hours of day in 24 hour format. | false | false | None | None | None |
| `minutes` | Minutes of hour of day. | false | false | None | None | None |
| `seconds` | Seconds of minutes of the time. | false | false | None | None | None |
| `nanos` | Fractions of seconds in nanoseconds. | false | false | None | None | None |

### single_occurrence_date Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `year` | Year of the date. | false | false | None | None | None |
| `month` | Month of a year. | false | false | None | None | None |
| `day` | Day of a month. | false | false | None | None | None |

### days_of_week Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `days_of_week` | A list of days of week. Each value may be one of: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | false | false | None | None | None |

### encryption_key Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `gcp_kms_encryption_key` | Google Cloud KMS encryption key. Format: projects/*/locations/*/keyRings/*/cryptoKeys/* | true | true | CMEK keys must be in the same region as the backup plan (australia-southeast1). | projects/p/locations/australia-southeast1/keyRings/k/cryptoKeys/c | projects/p/locations/us-central1/keyRings/k/cryptoKeys/c |

### selected_namespaces Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `namespaces` | A list of Kubernetes Namespaces. | true | false | None | None | None |

### selected_applications Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `namespaced_names` | A list of namespaced Kubernetes resources. Structure is [documented below](#nested_backup_config_selected_applications_namespaced_names). | true | false | None | None | None |

### namespaced_names Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `namespace` | The namespace of a Kubernetes Resource. | true | false | None | None | None |
| `name` | The name of a Kubernetes Resource. | true | false | None | None | None |
