## 🛡️ Policy Deployment Engine: `alloydb_cluster`

This section provides a concise policy evaluation for the `alloydb_cluster` resource in GCP.

Reference: [Terraform Registry – alloydb_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/alloydb_cluster)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cluster_id` | The ID of the alloydb cluster. | true | false | None | None | None |
| `location` | The location where the alloydb cluster should reside. | true | false | None | None | None |
| `labels` | User-defined labels for the alloydb cluster. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `encryption_config` | EncryptionConfig describes the encryption config of a cluster or a backup that is encrypted with a CMEK (customer-managed encryption key). Structure is [documented below](#nested_encryption_config). | false | false | None | None | None |
| `network_config` | Metadata related to network configuration. Structure is [documented below](#nested_network_config). | false | false | None | None | None |
| `display_name` | User-settable and human-readable display name for the Cluster. | false | false | None | None | None |
| `etag` | For Resource freshness validation (https://google.aip.dev/154) | false | false | None | None | None |
| `annotations` | Annotations to allow client tools to store small amount of arbitrary data. This is distinct from labels. https://google.aip.dev/128 An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | None | None | None |
| `database_version` | The database engine major version. This is an optional field and it's populated at the Cluster creation time. Note: Changing this field to a higer version results in upgrading the AlloyDB cluster which is an irreversible change. | false | false | None | None | None |
| `psc_config` | Configuration for Private Service Connect (PSC) for the cluster. Structure is [documented below](#nested_psc_config). | false | false | None | None | None |
| `initial_user` | Initial user to setup during cluster creation. Structure is [documented below](#nested_initial_user). | false | false | None | None | None |
| `restore_backup_source` | The source when restoring from a backup. Conflicts with 'restore_continuous_backup_source', both can't be set together. Structure is [documented below](#nested_restore_backup_source). | false | false | None | None | None |
| `restore_continuous_backup_source` | The source when restoring via point in time recovery (PITR). Conflicts with 'restore_backup_source', both can't be set together. Structure is [documented below](#nested_restore_continuous_backup_source). | false | false | None | None | None |
| `continuous_backup_config` | The continuous backup config for this cluster. If no policy is provided then the default policy will be used. The default policy takes one backup a day and retains backups for 14 days. Structure is [documented below](#nested_continuous_backup_config). | false | false | None | None | None |
| `automated_backup_policy` | The automated backup policy for this cluster. AutomatedBackupPolicy is disabled by default. Structure is [documented below](#nested_automated_backup_policy). | false | false | None | None | None |
| `cluster_type` | The type of cluster. If not set, defaults to PRIMARY. Default value is `PRIMARY`. Possible values are: `PRIMARY`, `SECONDARY`. | false | false | None | None | None |
| `secondary_config` | Configuration of the secondary cluster for Cross Region Replication. This should be set if and only if the cluster is of type SECONDARY. Structure is [documented below](#nested_secondary_config). | false | false | None | None | None |
| `maintenance_update_policy` | MaintenanceUpdatePolicy defines the policy for system updates. Structure is [documented below](#nested_maintenance_update_policy). | false | false | None | None | None |
| `subscription_type` | The subscrition type of cluster. Possible values are: `TRIAL`, `STANDARD`. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `deletion_policy` | Deleting a cluster forcefully, deletes the cluster and all its associated instances within the cluster. Deleting a Secondary cluster with a secondary instance REQUIRES setting deletion_policy = "FORCE" otherwise an error is returned. This is needed as there is no support to delete just the secondary instance, and the only way to delete secondary instance is to delete the associated secondary cluster forcefully which also deletes the secondary instance. Possible values: DEFAULT, FORCE | false | false | None | None | None |
| `skip_await_major_version_upgrade` | Possible values: true, false Default value: "true" | false | false | None | None | None |
| `weekly_schedule` |  | false | false | None | None | None |
| `start_times` |  | false | false | None | None | None |
| `time_based_retention` |  | false | false | None | None | None |
| `quantity_based_retention` |  | false | false | None | None | None |
| `maintenance_windows` |  | false | false | None | None | None |
| `start_time` |  | false | false | None | None | None |

### encryption_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kms_key_name` | The fully-qualified resource name of the KMS key. Each Cloud KMS key is regionalized and has the following format: projects/[PROJECT]/locations/[REGION]/keyRings/[RING]/cryptoKeys/[KEY_NAME]. | false | false | None | None | None |

### network_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network` | The resource link for the VPC network in which cluster resources are created and from which they are accessible via Private IP. The network must belong to the same project as the cluster. It is specified in the form: "projects/{projectNumber}/global/networks/{network_id}". | false | false | None | None | None |
| `allocated_ip_range` | The name of the allocated IP range for the private IP AlloyDB cluster. For example: "google-managed-services-default". If set, the instance IPs for this cluster will be created in the allocated range. | false | false | None | None | None |

### psc_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `psc_enabled` | Create an instance that allows connections from Private Service Connect endpoints to the instance. | false | false | None | None | None |
| `service_owned_project_number` | (Output) The project number that needs to be allowlisted on the network attachment to enable outbound connectivity, if the network attachment is configured to ACCEPT_MANUAL connections. In case the network attachment is configured to ACCEPT_AUTOMATIC, this project number does not need to be allowlisted explicitly. | false | false | None | None | None |

### initial_user Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `user` | The database username. | false | false | None | None | None |
| `password` | The initial password for the user. **Note**: This property is sensitive and will not be displayed in the plan. | true | false | None | None | None |

### restore_backup_source Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `backup_name` | The name of the backup that this cluster is restored from. | true | false | None | None | None |

### restore_continuous_backup_source Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cluster` | The name of the source cluster that this cluster is restored from. | true | false | None | None | None |
| `point_in_time` | The point in time that this cluster is restored to, in RFC 3339 format. | true | false | None | None | None |

### continuous_backup_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | Whether continuous backup recovery is enabled. If not set, defaults to true. | false | false | None | None | None |
| `recovery_window_days` | The numbers of days that are eligible to restore from using PITR. To support the entire recovery window, backups and logs are retained for one day more than the recovery window. If not set, defaults to 14 days. | false | false | None | None | None |
| `encryption_config` | EncryptionConfig describes the encryption config of a cluster or a backup that is encrypted with a CMEK (customer-managed encryption key). Structure is [documented below](#nested_continuous_backup_config_encryption_config). | false | false | None | None | None |

### automated_backup_policy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `backup_window` | The length of the time window during which a backup can be taken. If a backup does not succeed within this time window, it will be canceled and considered failed. The backup window must be at least 5 minutes long. There is no upper bound on the window. If not set, it will default to 1 hour. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | false | None | None | None |
| `location` | The location where the backup will be stored. Currently, the only supported option is to store the backup in the same region as the cluster. | false | false | None | None | None |
| `labels` | Labels to apply to backups created using this configuration. | false | false | None | None | None |
| `encryption_config` | EncryptionConfig describes the encryption config of a cluster or a backup that is encrypted with a CMEK (customer-managed encryption key). Structure is [documented below](#nested_automated_backup_policy_encryption_config). | false | false | None | None | None |
| `weekly_schedule` | Weekly schedule for the Backup. Structure is [documented below](#nested_automated_backup_policy_weekly_schedule). | false | false | None | None | None |
| `time_based_retention` | Time-based Backup retention policy. Conflicts with 'quantity_based_retention', both can't be set together. Structure is [documented below](#nested_automated_backup_policy_time_based_retention). | false | false | None | None | None |
| `quantity_based_retention` | Quantity-based Backup retention policy to retain recent backups. Conflicts with 'time_based_retention', both can't be set together. Structure is [documented below](#nested_automated_backup_policy_quantity_based_retention). | false | false | None | None | None |
| `enabled` | Whether automated backups are enabled. | false | false | None | None | None |

### secondary_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `primary_cluster_name` | Name of the primary cluster must be in the format 'projects/{project}/locations/{location}/clusters/{cluster_id}' | true | false | None | None | None |

### maintenance_update_policy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `maintenance_windows` | Preferred windows to perform maintenance. Currently limited to 1. Structure is [documented below](#nested_maintenance_update_policy_maintenance_windows). | false | false | None | None | None |

### weekly_schedule Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `days_of_week` | The days of the week to perform a backup. At least one day of the week must be provided. Each value may be one of: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | false | false | None | None | None |
| `start_times` | The times during the day to start a backup. At least one start time must be provided. The start times are assumed to be in UTC and to be an exact hour (e.g., 04:00:00). Structure is [documented below](#nested_automated_backup_policy_weekly_schedule_start_times). | true | false | None | None | None |

### start_times Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `hours` | Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time. | false | false | None | None | None |
| `minutes` | Minutes of hour of day. Currently, only the value 0 is supported. | false | false | None | None | None |
| `seconds` | Seconds of minutes of the time. Currently, only the value 0 is supported. | false | false | None | None | None |
| `nanos` | Fractions of seconds in nanoseconds. Currently, only the value 0 is supported. | false | false | None | None | None |

### time_based_retention Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `retention_period` | The retention period. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | false | None | None | None |

### quantity_based_retention Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `count` | The number of backups to retain. | false | false | None | None | None |

### maintenance_windows Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `day` | Preferred day of the week for maintenance, e.g. MONDAY, TUESDAY, etc. Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | true | false | None | None | None |
| `start_time` | Preferred time to start the maintenance operation on the specified day. Maintenance will start within 1 hour of this time. Structure is [documented below](#nested_maintenance_update_policy_maintenance_windows_maintenance_windows_start_time). | true | false | None | None | None |

### start_time Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `hours` | Hours of day in 24 hour format. Should be from 0 to 23. | true | false | None | None | None |
| `minutes` | Minutes of hour of day. Currently, only the value 0 is supported. | false | false | None | None | None |
| `seconds` | Seconds of minutes of the time. Currently, only the value 0 is supported. | false | false | None | None | None |
| `nanos` | Fractions of seconds in nanoseconds. Currently, only the value 0 is supported. | false | false | None | None | None |
