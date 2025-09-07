## 🛡️ Policy Deployment Engine: `redis_cluster`

This section provides a concise policy evaluation for the `redis_cluster` resource in GCP.

Reference: [Terraform Registry – redis_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/redis_cluster)

---

## 1. Argument Reference

### `shard_count`
- Description: (Required) Required. Number of shards for the Redis cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Unique name of the resource in this scope including project and location using the form: projects/{projectId}/locations/{locationId}/clusters/{clusterId}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gcs_source`
- Description: (Optional) Backups stored in Cloud Storage buckets. The Cloud Storage buckets need to be the same region as the clusters. Structure is [documented below](#nested_gcs_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `managed_backup_source`
- Description: (Optional) Backups that generated and managed by memorystore. Structure is [documented below](#nested_managed_backup_source).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `automated_backup_config`
- Description: (Optional) The automated backup config for a instance. Structure is [documented below](#nested_automated_backup_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorization_mode`
- Description: (Optional) Optional. The authorization mode of the Redis cluster. If not provided, auth feature is disabled for the cluster. Default value is `AUTH_MODE_DISABLED`. Possible values are: `AUTH_MODE_UNSPECIFIED`, `AUTH_MODE_IAM_AUTH`, `AUTH_MODE_DISABLED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transit_encryption_mode`
- Description: (Optional) Optional. The in-transit encryption for the Redis cluster. If not provided, encryption is disabled for the cluster. Default value is `TRANSIT_ENCRYPTION_MODE_DISABLED`. Possible values are: `TRANSIT_ENCRYPTION_MODE_UNSPECIFIED`, `TRANSIT_ENCRYPTION_MODE_DISABLED`, `TRANSIT_ENCRYPTION_MODE_SERVER_AUTHENTICATION`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_type`
- Description: (Optional) The nodeType for the Redis cluster. If not provided, REDIS_HIGHMEM_MEDIUM will be used as default Possible values are: `REDIS_SHARED_CORE_NANO`, `REDIS_HIGHMEM_MEDIUM`, `REDIS_HIGHMEM_XLARGE`, `REDIS_STANDARD_SMALL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone_distribution_config`
- Description: (Optional) Immutable. Zone distribution config for Memorystore Redis cluster. Structure is [documented below](#nested_zone_distribution_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_fewer_zones_deployment`
- Description: (Optional) Allows customers to specify if they are okay with deploying a multi-zone cluster in less than 3 zones. Once set, if there is a zonal outage during the cluster creation, the cluster will only be deployed in 2 zones, and stay within the 2 zones for its lifecycle.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `psc_configs`
- Description: (Optional) Required. Each PscConfig configures the consumer network where two network addresses will be designated to the cluster for client access. Currently, only one PscConfig is supported. Structure is [documented below](#nested_psc_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replica_count`
- Description: (Optional) Optional. The number of replica nodes per shard.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection_enabled`
- Description: (Optional) Optional. Indicates if the cluster is deletion protected or not. If the value if set to true, any delete cluster operation will fail. Default value is true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redis_configs`
- Description: (Optional) Configure Redis Cluster behavior using a subset of native Redis configuration parameters. Please check Memorystore documentation for the list of supported parameters: https://cloud.google.com/memorystore/docs/cluster/supported-instance-configurations
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `persistence_config`
- Description: (Optional) Persistence config (RDB, AOF) for the cluster. Structure is [documented below](#nested_persistence_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_policy`
- Description: (Optional) Maintenance policy for a cluster Structure is [documented below](#nested_maintenance_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cross_cluster_replication_config`
- Description: (Optional) Cross cluster replication config Structure is [documented below](#nested_cross_cluster_replication_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Optional) The KMS key used to encrypt the at-rest data of the cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The name of the region of the Redis cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_gcs_source"></a>The `gcs_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uris`
- Description: (Required) URIs of the GCS objects to import. Example: gs://bucket1/object1, gs://bucket2/folder2/object2 <a name="nested_managed_backup_source"></a>The `managed_backup_source` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup`
- Description: (Required) Example: `projects/{project}/locations/{location}/backupCollections/{collection}/backups/{backup}`. <a name="nested_automated_backup_config"></a>The `automated_backup_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fixed_frequency_schedule`
- Description: (Required) Trigger automated backups at a fixed frequency. Structure is [documented below](#nested_automated_backup_config_fixed_frequency_schedule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retention`
- Description: (Required) How long to keep automated backups before the backups are deleted. The value should be between 1 day and 365 days. If not specified, the default value is 35 days. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". <a name="nested_automated_backup_config_fixed_frequency_schedule"></a>The `fixed_frequency_schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Required) The start time of every automated backup in UTC. It must be set to the start of an hour. This field is required. Structure is [documented below](#nested_automated_backup_config_fixed_frequency_schedule_start_time). <a name="nested_automated_backup_config_fixed_frequency_schedule_start_time"></a>The `start_time` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hours`
- Description: (Required) Hours of a day in 24 hour format. Must be greater than or equal to 0 and typically must be less than or equal to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time. <a name="nested_zone_distribution_config"></a>The `zone_distribution_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) Immutable. The mode for zone distribution for Memorystore Redis cluster. If not provided, MULTI_ZONE will be used as default Possible values are: `MULTI_ZONE`, `SINGLE_ZONE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional) Immutable. The zone for single zone Memorystore Redis cluster. <a name="nested_psc_configs"></a>The `psc_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Required) Required. The consumer network where the network address of the discovery endpoint will be reserved, in the form of projects/{network_project_id_or_number}/global/networks/{network_id}. <a name="nested_persistence_config"></a>The `persistence_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) Optional. Controls whether Persistence features are enabled. If not provided, the existing value will be used. - DISABLED: 	Persistence (both backup and restore) is disabled for the cluster. - RDB: RDB based Persistence is enabled. - AOF: AOF based Persistence is enabled. Possible values are: `PERSISTENCE_MODE_UNSPECIFIED`, `DISABLED`, `RDB`, `AOF`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rdb_config`
- Description: (Optional) RDB configuration. This field will be ignored if mode is not RDB. Structure is [documented below](#nested_persistence_config_rdb_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aof_config`
- Description: (Optional) AOF configuration. This field will be ignored if mode is not AOF. Structure is [documented below](#nested_persistence_config_aof_config). <a name="nested_persistence_config_rdb_config"></a>The `rdb_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rdb_snapshot_period`
- Description: (Optional) Optional. Available snapshot periods for scheduling. - ONE_HOUR:	Snapshot every 1 hour. - SIX_HOURS:	Snapshot every 6 hours. - TWELVE_HOURS:	Snapshot every 12 hours. - TWENTY_FOUR_HOURS:	Snapshot every 24 hours. Possible values are: `SNAPSHOT_PERIOD_UNSPECIFIED`, `ONE_HOUR`, `SIX_HOURS`, `TWELVE_HOURS`, `TWENTY_FOUR_HOURS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rdb_snapshot_start_time`
- Description: (Optional) The time that the first snapshot was/will be attempted, and to which future snapshots will be aligned. If not provided, the current time will be used. <a name="nested_persistence_config_aof_config"></a>The `aof_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `append_fsync`
- Description: (Optional) Optional. Available fsync modes. - NO - Do not explicitly call fsync(). Rely on OS defaults. - EVERYSEC - Call fsync() once per second in a background thread. A balance between performance and durability. - ALWAYS - Call fsync() for earch write command. Possible values are: `APPEND_FSYNC_UNSPECIFIED`, `NO`, `EVERYSEC`, `ALWAYS`. <a name="nested_maintenance_policy"></a>The `maintenance_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_time`
- Description: (Output) Output only. The time when the policy was created. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `update_time`
- Description: (Output) Output only. The time when the policy was last updated. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weekly_maintenance_window`
- Description: (Optional) Optional. Maintenance window that is applied to resources covered by this policy. Minimum 1. For the current version, the maximum number of weekly_window is expected to be one. Structure is [documented below](#nested_maintenance_policy_weekly_maintenance_window). <a name="nested_maintenance_policy_weekly_maintenance_window"></a>The `weekly_maintenance_window` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day`
- Description: (Required) Required. The day of week that maintenance updates occur. - DAY_OF_WEEK_UNSPECIFIED: The day of the week is unspecified. - MONDAY: Monday - TUESDAY: Tuesday - WEDNESDAY: Wednesday - THURSDAY: Thursday - FRIDAY: Friday - SATURDAY: Saturday - SUNDAY: Sunday Possible values are: `DAY_OF_WEEK_UNSPECIFIED`, `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `duration`
- Description: (Output) Output only. Duration of the maintenance window. The current window is fixed at 1 hour. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Required) Required. Start time of the window in UTC time. Structure is [documented below](#nested_maintenance_policy_weekly_maintenance_window_weekly_maintenance_window_start_time). <a name="nested_maintenance_policy_weekly_maintenance_window_weekly_maintenance_window_start_time"></a>The `start_time` block supports:
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
- Description: (Optional) Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999. <a name="nested_cross_cluster_replication_config"></a>The `cross_cluster_replication_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_role`
- Description: (Optional) The role of the cluster in cross cluster replication. Supported values are: 1. `CLUSTER_ROLE_UNSPECIFIED`: This is an independent cluster that has never participated in cross cluster replication. It allows both reads and writes. 1. `NONE`: This is an independent cluster that previously participated in cross cluster replication(either as a `PRIMARY` or `SECONDARY` cluster). It allows both reads and writes. 1. `PRIMARY`: This cluster serves as the replication source for secondary clusters that are replicating from it. Any data written to it is automatically replicated to its secondary clusters. It allows both reads and writes. 1. `SECONDARY`: This cluster replicates data from the primary cluster. It allows only reads. Possible values are: `CLUSTER_ROLE_UNSPECIFIED`, `NONE`, `PRIMARY`, `SECONDARY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_cluster`
- Description: (Optional) Details of the primary cluster that is used as the replication source for this secondary cluster. This is allowed to be set only for clusters whose cluster role is of type `SECONDARY`. Structure is [documented below](#nested_cross_cluster_replication_config_primary_cluster).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secondary_clusters`
- Description: (Optional) List of secondary clusters that are replicating from this primary cluster. This is allowed to be set only for clusters whose cluster role is of type `PRIMARY`. Structure is [documented below](#nested_cross_cluster_replication_config_secondary_clusters).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `membership`
- Description: (Output) An output only view of all the member clusters participating in cross cluster replication. This field is populated for all the member clusters irrespective of their cluster role. Structure is [documented below](#nested_cross_cluster_replication_config_membership).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `update_time`
- Description: (Output) The last time cross cluster replication config was updated. <a name="nested_cross_cluster_replication_config_primary_cluster"></a>The `primary_cluster` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster`
- Description: (Optional) The full resource path of the primary cluster in the format: projects/{project}/locations/{region}/clusters/{cluster-id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uid`
- Description: (Output) The unique id of the primary cluster. <a name="nested_cross_cluster_replication_config_secondary_clusters"></a>The `secondary_clusters` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster`
- Description: (Optional) The full resource path of the secondary cluster in the format: projects/{project}/locations/{region}/clusters/{cluster-id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uid`
- Description: (Output) The unique id of the secondary cluster. <a name="nested_cross_cluster_replication_config_membership"></a>The `membership` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `primary_cluster`
- Description: (Output) Details of the primary cluster that is used as the replication source for all the secondary clusters. Structure is [documented below](#nested_cross_cluster_replication_config_membership_primary_cluster).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secondary_clusters`
- Description: (Output) List of secondary clusters that are replicating from the primary cluster. Structure is [documented below](#nested_cross_cluster_replication_config_membership_secondary_clusters). <a name="nested_cross_cluster_replication_config_membership_primary_cluster"></a>The `primary_cluster` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster`
- Description: (Output) The full resource path of the primary cluster in the format: projects/{project}/locations/{region}/clusters/{cluster-id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uid`
- Description: (Output) The unique id of the primary cluster. <a name="nested_cross_cluster_replication_config_membership_secondary_clusters"></a>The `secondary_clusters` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster`
- Description: (Output) The full resource path of the secondary cluster in the format: projects/{project}/locations/{region}/clusters/{cluster-id}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uid`
- Description: (Output) The unique id of the secondary cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
