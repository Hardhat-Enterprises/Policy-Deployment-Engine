## 🛡️ Policy Deployment Engine: `alloydb_cluster`

This section provides a concise policy evaluation for the `alloydb_cluster` resource in GCP.

Reference: [Terraform Registry – alloydb_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/alloydb_cluster)

---

## 1. Argument Reference

### `cluster_id`
- Description: (Required) The ID of the alloydb cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location where the alloydb cluster should reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) User-defined labels for the alloydb cluster. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_config`
- Description: (Optional) EncryptionConfig describes the encryption config of a cluster or a backup that is encrypted with a CMEK (customer-managed encryption key). Structure is [documented below](#nested_encryption_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_config`
- Description: (Optional) Metadata related to network configuration. Structure is [documented below](#nested_network_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) User-settable and human-readable display name for the Cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `etag`
- Description: (Optional) For Resource freshness validation (https://google.aip.dev/154)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Annotations to allow client tools to store small amount of arbitrary data. This is distinct from labels. https://google.aip.dev/128 An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_version`
- Description: (Optional) The database engine major version. This is an optional field and it's populated at the Cluster creation time. Note: Changing this field to a higer version results in upgrading the AlloyDB cluster which is an irreversible change.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `psc_config`
- Description: (Optional) Configuration for Private Service Connect (PSC) for the cluster. Structure is [documented below](#nested_psc_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `initial_user`
- Description: (Optional) Initial user to setup during cluster creation. Structure is [documented below](#nested_initial_user).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `restore_backup_source`
- Description: (Optional) The source when restoring from a backup. Conflicts with 'restore_continuous_backup_source', both can't be set together. Structure is [documented below](#nested_restore_backup_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `restore_continuous_backup_source`
- Description: (Optional) The source when restoring via point in time recovery (PITR). Conflicts with 'restore_backup_source', both can't be set together. Structure is [documented below](#nested_restore_continuous_backup_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `continuous_backup_config`
- Description: (Optional) The continuous backup config for this cluster. If no policy is provided then the default policy will be used. The default policy takes one backup a day and retains backups for 14 days. Structure is [documented below](#nested_continuous_backup_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `automated_backup_policy`
- Description: (Optional) The automated backup policy for this cluster. AutomatedBackupPolicy is disabled by default. Structure is [documented below](#nested_automated_backup_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_type`
- Description: (Optional) The type of cluster. If not set, defaults to PRIMARY. Default value is `PRIMARY`. Possible values are: `PRIMARY`, `SECONDARY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secondary_config`
- Description: (Optional) Configuration of the secondary cluster for Cross Region Replication. This should be set if and only if the cluster is of type SECONDARY. Structure is [documented below](#nested_secondary_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_update_policy`
- Description: (Optional) MaintenanceUpdatePolicy defines the policy for system updates. Structure is [documented below](#nested_maintenance_update_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subscription_type`
- Description: (Optional) The subscrition type of cluster. Possible values are: `TRIAL`, `STANDARD`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_policy`
- Description: Deleting a cluster forcefully, deletes the cluster and all its associated instances within the cluster. Deleting a Secondary cluster with a secondary instance REQUIRES setting deletion_policy = "FORCE" otherwise an error is returned. This is needed as there is no support to delete just the secondary instance, and the only way to delete secondary instance is to delete the associated secondary cluster forcefully which also deletes the secondary instance. Possible values: DEFAULT, FORCE
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `skip_await_major_version_upgrade`
- Description: Possible values: true, false Default value: "true" <a name="nested_encryption_config"></a>The `encryption_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) The fully-qualified resource name of the KMS key. Each Cloud KMS key is regionalized and has the following format: projects/[PROJECT]/locations/[REGION]/keyRings/[RING]/cryptoKeys/[KEY_NAME]. <a name="nested_network_config"></a>The `network_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) The resource link for the VPC network in which cluster resources are created and from which they are accessible via Private IP. The network must belong to the same project as the cluster. It is specified in the form: "projects/{projectNumber}/global/networks/{network_id}".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allocated_ip_range`
- Description: (Optional) The name of the allocated IP range for the private IP AlloyDB cluster. For example: "google-managed-services-default". If set, the instance IPs for this cluster will be created in the allocated range. <a name="nested_psc_config"></a>The `psc_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `psc_enabled`
- Description: (Optional) Create an instance that allows connections from Private Service Connect endpoints to the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_owned_project_number`
- Description: (Output) The project number that needs to be allowlisted on the network attachment to enable outbound connectivity, if the network attachment is configured to ACCEPT_MANUAL connections. In case the network attachment is configured to ACCEPT_AUTOMATIC, this project number does not need to be allowlisted explicitly. <a name="nested_initial_user"></a>The `initial_user` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user`
- Description: (Optional) The database username.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Required) The initial password for the user. **Note**: This property is sensitive and will not be displayed in the plan. <a name="nested_restore_backup_source"></a>The `restore_backup_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_name`
- Description: (Required) The name of the backup that this cluster is restored from. <a name="nested_restore_continuous_backup_source"></a>The `restore_continuous_backup_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster`
- Description: (Required) The name of the source cluster that this cluster is restored from.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `point_in_time`
- Description: (Required) The point in time that this cluster is restored to, in RFC 3339 format. <a name="nested_continuous_backup_config"></a>The `continuous_backup_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Whether continuous backup recovery is enabled. If not set, defaults to true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `recovery_window_days`
- Description: (Optional) The numbers of days that are eligible to restore from using PITR. To support the entire recovery window, backups and logs are retained for one day more than the recovery window. If not set, defaults to 14 days.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_config`
- Description: (Optional) EncryptionConfig describes the encryption config of a cluster or a backup that is encrypted with a CMEK (customer-managed encryption key). Structure is [documented below](#nested_continuous_backup_config_encryption_config). <a name="nested_continuous_backup_config_encryption_config"></a>The `encryption_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) The fully-qualified resource name of the KMS key. Each Cloud KMS key is regionalized and has the following format: projects/[PROJECT]/locations/[REGION]/keyRings/[RING]/cryptoKeys/[KEY_NAME]. <a name="nested_automated_backup_policy"></a>The `automated_backup_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_window`
- Description: (Optional) The length of the time window during which a backup can be taken. If a backup does not succeed within this time window, it will be canceled and considered failed. The backup window must be at least 5 minutes long. There is no upper bound on the window. If not set, it will default to 1 hour. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The location where the backup will be stored. Currently, the only supported option is to store the backup in the same region as the cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels to apply to backups created using this configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_config`
- Description: (Optional) EncryptionConfig describes the encryption config of a cluster or a backup that is encrypted with a CMEK (customer-managed encryption key). Structure is [documented below](#nested_automated_backup_policy_encryption_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weekly_schedule`
- Description: (Optional) Weekly schedule for the Backup. Structure is [documented below](#nested_automated_backup_policy_weekly_schedule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_based_retention`
- Description: (Optional) Time-based Backup retention policy. Conflicts with 'quantity_based_retention', both can't be set together. Structure is [documented below](#nested_automated_backup_policy_time_based_retention).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `quantity_based_retention`
- Description: (Optional) Quantity-based Backup retention policy to retain recent backups. Conflicts with 'time_based_retention', both can't be set together. Structure is [documented below](#nested_automated_backup_policy_quantity_based_retention).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Whether automated backups are enabled. <a name="nested_automated_backup_policy_encryption_config"></a>The `encryption_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) The fully-qualified resource name of the KMS key. Each Cloud KMS key is regionalized and has the following format: projects/[PROJECT]/locations/[REGION]/keyRings/[RING]/cryptoKeys/[KEY_NAME]. <a name="nested_automated_backup_policy_weekly_schedule"></a>The `weekly_schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `days_of_week`
- Description: (Optional) The days of the week to perform a backup. At least one day of the week must be provided. Each value may be one of: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_times`
- Description: (Required) The times during the day to start a backup. At least one start time must be provided. The start times are assumed to be in UTC and to be an exact hour (e.g., 04:00:00). Structure is [documented below](#nested_automated_backup_policy_weekly_schedule_start_times). <a name="nested_automated_backup_policy_weekly_schedule_start_times"></a>The `start_times` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hours`
- Description: (Optional) Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minutes`
- Description: (Optional) Minutes of hour of day. Currently, only the value 0 is supported.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Seconds of minutes of the time. Currently, only the value 0 is supported.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Fractions of seconds in nanoseconds. Currently, only the value 0 is supported. <a name="nested_automated_backup_policy_time_based_retention"></a>The `time_based_retention` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retention_period`
- Description: (Optional) The retention period. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". <a name="nested_automated_backup_policy_quantity_based_retention"></a>The `quantity_based_retention` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `count`
- Description: (Optional) The number of backups to retain. <a name="nested_secondary_config"></a>The `secondary_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_cluster_name`
- Description: (Required) Name of the primary cluster must be in the format 'projects/{project}/locations/{location}/clusters/{cluster_id}' <a name="nested_maintenance_update_policy"></a>The `maintenance_update_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_windows`
- Description: (Optional) Preferred windows to perform maintenance. Currently limited to 1. Structure is [documented below](#nested_maintenance_update_policy_maintenance_windows). <a name="nested_maintenance_update_policy_maintenance_windows"></a>The `maintenance_windows` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day`
- Description: (Required) Preferred day of the week for maintenance, e.g. MONDAY, TUESDAY, etc. Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Required) Preferred time to start the maintenance operation on the specified day. Maintenance will start within 1 hour of this time. Structure is [documented below](#nested_maintenance_update_policy_maintenance_windows_maintenance_windows_start_time). <a name="nested_maintenance_update_policy_maintenance_windows_maintenance_windows_start_time"></a>The `start_time` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hours`
- Description: (Required) Hours of day in 24 hour format. Should be from 0 to 23.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minutes`
- Description: (Optional) Minutes of hour of day. Currently, only the value 0 is supported.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Seconds of minutes of the time. Currently, only the value 0 is supported.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Fractions of seconds in nanoseconds. Currently, only the value 0 is supported.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
