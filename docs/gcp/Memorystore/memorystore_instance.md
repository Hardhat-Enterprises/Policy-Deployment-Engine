## 🛡️ Policy Deployment Engine: `memorystore_instance`

This section provides a concise policy evaluation for the `memorystore_instance` resource in GCP.

Reference: [Terraform Registry – memorystore_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/memorystore_instance)

---

## 1. Argument Reference

### `shard_count`
- Description: (Required) Required. Number of shards for the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. See documentation for resource type `memorystore.googleapis.com/CertificateAuthority`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_id`
- Description: (Required) Required. The ID to use for the instance, which will become the final component of the instance's resource name. This value is subject to the following restrictions: * Must be 4-63 characters in length * Must begin with a letter or digit * Must contain only lowercase letters, digits, and hyphens * Must not end with a hyphen * Must be unique within a location
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional. Labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `automated_backup_config`
- Description: (Optional) The automated backup config for a instance. Structure is [documented below](#nested_automated_backup_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replica_count`
- Description: (Optional) Optional. Number of replica nodes per shard. If omitted the default is 0 replicas.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorization_mode`
- Description: (Optional) Optional. Immutable. Authorization mode of the instance. Possible values: AUTH_DISABLED IAM_AUTH
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transit_encryption_mode`
- Description: (Optional) Optional. Immutable. In-transit encryption mode of the instance. Possible values: TRANSIT_ENCRYPTION_DISABLED SERVER_AUTHENTICATION
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_type`
- Description: (Optional) Optional. Machine type for individual nodes of the instance. Possible values: SHARED_CORE_NANO HIGHMEM_MEDIUM HIGHMEM_XLARGE STANDARD_SMALL
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `persistence_config`
- Description: (Optional) Represents persistence configuration for a instance. Structure is [documented below](#nested_persistence_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_policy`
- Description: (Optional) Maintenance policy for a cluster Structure is [documented below](#nested_maintenance_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `engine_version`
- Description: (Optional) Optional. Engine version of the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `engine_configs`
- Description: (Optional) Optional. User-provided engine configurations for the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone_distribution_config`
- Description: (Optional) Zone distribution configuration for allocation of instance resources. Structure is [documented below](#nested_zone_distribution_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_fewer_zones_deployment`
- Description: (Optional) Allows customers to specify if they are okay with deploying a multi-zone instance in less than 3 zones. Once set, if there is a zonal outage during the instance creation, the instance will only be deployed in 2 zones, and stay within the 2 zones for its lifecycle.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection_enabled`
- Description: (Optional) Optional. If set to true deletion of the instance will fail.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cross_instance_replication_config`
- Description: (Optional) Cross instance replication config Structure is [documented below](#nested_cross_instance_replication_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) Optional. cluster or cluster-disabled. Possible values: CLUSTER CLUSTER_DISABLED Possible values are: `CLUSTER`, `CLUSTER_DISABLED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_source`
- Description: (Optional) GCS source for the instance. Structure is [documented below](#nested_gcs_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `managed_backup_source`
- Description: (Optional) Managed backup source for the instance. Structure is [documented below](#nested_managed_backup_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Optional) The KMS key used to encrypt the at-rest data of the cluster
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `desired_psc_auto_connections`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `desired_auto_created_endpoints`
- Description: <a name="nested_automated_backup_config"></a>The `automated_backup_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fixed_frequency_schedule`
- Description: (Required) Trigger automated backups at a fixed frequency. Structure is [documented below](#nested_automated_backup_config_fixed_frequency_schedule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retention`
- Description: (Required) How long to keep automated backups before the backups are deleted. The value should be between 1 day and 365 days. If not specified, the default value is 35 days. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". The default_value is "3024000s" <a name="nested_automated_backup_config_fixed_frequency_schedule"></a>The `fixed_frequency_schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Required) The start time of every automated backup in UTC. It must be set to the start of an hour. This field is required. Structure is [documented below](#nested_automated_backup_config_fixed_frequency_schedule_start_time). <a name="nested_automated_backup_config_fixed_frequency_schedule_start_time"></a>The `start_time` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hours`
- Description: (Required) Hours of a day in 24 hour format. Must be greater than or equal to 0 and typically must be less than or equal to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time. <a name="nested_persistence_config"></a>The `persistence_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) Optional. Current persistence mode. Possible values: DISABLED RDB AOF Possible values are: `DISABLED`, `RDB`, `AOF`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rdb_config`
- Description: (Optional) Configuration for RDB based persistence. Structure is [documented below](#nested_persistence_config_rdb_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aof_config`
- Description: (Optional) Configuration for AOF based persistence. Structure is [documented below](#nested_persistence_config_aof_config). <a name="nested_persistence_config_rdb_config"></a>The `rdb_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rdb_snapshot_period`
- Description: (Optional) Optional. Period between RDB snapshots. Possible values: ONE_HOUR SIX_HOURS TWELVE_HOURS TWENTY_FOUR_HOURS
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rdb_snapshot_start_time`
- Description: (Optional) Optional. Time that the first snapshot was/will be attempted, and to which future snapshots will be aligned. If not provided, the current time will be used. <a name="nested_persistence_config_aof_config"></a>The `aof_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `append_fsync`
- Description: (Optional) Optional. The fsync mode. Possible values: NEVER EVERY_SEC ALWAYS <a name="nested_maintenance_policy"></a>The `maintenance_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_time`
- Description: (Output) The time when the policy was created. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `update_time`
- Description: (Output) The time when the policy was last updated. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weekly_maintenance_window`
- Description: (Optional) Optional. Maintenance window that is applied to resources covered by this policy. Minimum 1. For the current version, the maximum number of weekly_window is expected to be one. Structure is [documented below](#nested_maintenance_policy_weekly_maintenance_window). <a name="nested_maintenance_policy_weekly_maintenance_window"></a>The `weekly_maintenance_window` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day`
- Description: (Required) The day of week that maintenance updates occur. - DAY_OF_WEEK_UNSPECIFIED: The day of the week is unspecified. - MONDAY: Monday - TUESDAY: Tuesday - WEDNESDAY: Wednesday - THURSDAY: Thursday - FRIDAY: Friday - SATURDAY: Saturday - SUNDAY: Sunday Possible values are: `DAY_OF_WEEK_UNSPECIFIED`, `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `duration`
- Description: (Output) Duration of the maintenance window. The current window is fixed at 1 hour. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Required) Start time of the window in UTC time. Structure is [documented below](#nested_maintenance_policy_weekly_maintenance_window_weekly_maintenance_window_start_time). <a name="nested_maintenance_policy_weekly_maintenance_window_weekly_maintenance_window_start_time"></a>The `start_time` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hours`
- Description: (Optional) Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minutes`
- Description: (Optional) Minutes of hour of day. Must be from 0 to 59.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999. <a name="nested_zone_distribution_config"></a>The `zone_distribution_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) Optional. Defines zone where all resources will be allocated with SINGLE_ZONE mode. Ignored for MULTI_ZONE mode.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) Optional. Current zone distribution mode. Defaults to MULTI_ZONE. Possible values: MULTI_ZONE SINGLE_ZONE Possible values are: `MULTI_ZONE`, `SINGLE_ZONE`. <a name="nested_cross_instance_replication_config"></a>The `cross_instance_replication_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_role`
- Description: (Optional) The instance role supports the following values: 1. `INSTANCE_ROLE_UNSPECIFIED`: This is an independent instance that has never participated in cross instance replication. It allows both reads and writes. 2. `NONE`: This is an independent instance that previously participated in cross instance replication(either as a `PRIMARY` or `SECONDARY` cluster). It allows both reads and writes. 3. `PRIMARY`: This instance serves as the replication source for secondary instance that are replicating from it. Any data written to it is automatically replicated to its secondary clusters. It allows both reads and writes. 4. `SECONDARY`: This instance replicates data from the primary instance. It allows only reads. Possible values are: `INSTANCE_ROLE_UNSPECIFIED`, `NONE`, `PRIMARY`, `SECONDARY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_instance`
- Description: (Optional) This field is only set for a secondary instance. Details of the primary instance that is used as the replication source for this secondary instance. This is allowed to be set only for clusters whose cluster role is of type `SECONDARY`. Structure is [documented below](#nested_cross_instance_replication_config_primary_instance).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secondary_instances`
- Description: (Optional) List of secondary instances that are replicating from this primary cluster. This is allowed to be set only for instances whose cluster role is of type `PRIMARY`. Structure is [documented below](#nested_cross_instance_replication_config_secondary_instances).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `membership`
- Description: (Output) An output only view of all the member instance participating in cross instance replication. This field is populated for all the member clusters irrespective of their cluster role. Structure is [documented below](#nested_cross_instance_replication_config_membership).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `update_time`
- Description: (Output) The last time cross instance replication config was updated. <a name="nested_cross_instance_replication_config_primary_instance"></a>The `primary_instance` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Optional) The full resource path of the primary instance in the format: projects/{project}/locations/{region}/instances/{instance-id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uid`
- Description: (Output) The unique id of the primary instance. <a name="nested_cross_instance_replication_config_secondary_instances"></a>The `secondary_instances` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Optional) The full resource path of the Nth instance in the format: projects/{project}/locations/{region}/instance/{instance-id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uid`
- Description: (Output) The unique id of the Nth instance. <a name="nested_cross_instance_replication_config_membership"></a>The `membership` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_instance`
- Description: (Output) Details of the primary instance that is used as the replication source for all the secondary instances. Structure is [documented below](#nested_cross_instance_replication_config_membership_primary_instance).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secondary_instance`
- Description: (Output) List of secondary instances that are replicating from the primary instance. Structure is [documented below](#nested_cross_instance_replication_config_membership_secondary_instance). <a name="nested_cross_instance_replication_config_membership_primary_instance"></a>The `primary_instance` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Output) The full resource path of the primary instance in the format: projects/{project}/locations/{region}/instance/{instance-id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uid`
- Description: (Output) The unique id of the primary instance. <a name="nested_cross_instance_replication_config_membership_secondary_instance"></a>The `secondary_instance` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Output) The full resource path of the secondary instance in the format: projects/{project}/locations/{region}/instance/{instance-id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uid`
- Description: (Output) The unique id of the secondary instance. <a name="nested_gcs_source"></a>The `gcs_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uris`
- Description: (Required) URIs of the GCS objects to import. Example: gs://bucket1/object1, gs://bucket2/folder2/object2 <a name="nested_managed_backup_source"></a>The `managed_backup_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup`
- Description: (Required) Example: `projects/{project}/locations/{location}/backupCollections/{collection}/backups/{backup}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
