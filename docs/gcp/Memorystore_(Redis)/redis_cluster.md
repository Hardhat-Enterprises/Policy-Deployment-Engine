## 🛡️ Policy Deployment Engine: `redis_cluster`

This section provides a concise policy evaluation for the `redis_cluster` resource in GCP.

Reference: [Terraform Registry – redis_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/redis_cluster)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `shard_count` | Required. Number of shards for the Redis cluster. | true | false | None | None | None |
| `name` | Unique name of the resource in this scope including project and location using the form: projects/{projectId}/locations/{locationId}/clusters/{clusterId} | true | false | None | None | None |
| `gcs_source` | Backups stored in Cloud Storage buckets. The Cloud Storage buckets need to be the same region as the clusters. Structure is [documented below](#nested_gcs_source). | false | false | None | None | None |
| `managed_backup_source` | Backups that generated and managed by memorystore. Structure is [documented below](#nested_managed_backup_source). | false | false | None | None | None |
| `automated_backup_config` | The automated backup config for a instance. Structure is [documented below](#nested_automated_backup_config). | false | false | None | None | None |
| `authorization_mode` | Optional. The authorization mode of the Redis cluster. If not provided, auth feature is disabled for the cluster. Default value is `AUTH_MODE_DISABLED`. Possible values are: `AUTH_MODE_UNSPECIFIED`, `AUTH_MODE_IAM_AUTH`, `AUTH_MODE_DISABLED`. | false | true | None | AUTH_MODE_IAM_AUTH | ['AUTH_MODE_UNSPECIFIED', 'AUTH_MODE_DISABLED'] |
| `transit_encryption_mode` | Optional. The in-transit encryption for the Redis cluster. If not provided, encryption is disabled for the cluster. Default value is `TRANSIT_ENCRYPTION_MODE_DISABLED`. Possible values are: `TRANSIT_ENCRYPTION_MODE_UNSPECIFIED`, `TRANSIT_ENCRYPTION_MODE_DISABLED`, `TRANSIT_ENCRYPTION_MODE_SERVER_AUTHENTICATION`. | false | false | None | None | None |
| `node_type` | The nodeType for the Redis cluster. If not provided, REDIS_HIGHMEM_MEDIUM will be used as default Possible values are: `REDIS_SHARED_CORE_NANO`, `REDIS_HIGHMEM_MEDIUM`, `REDIS_HIGHMEM_XLARGE`, `REDIS_STANDARD_SMALL`. | false | false | None | None | None |
| `zone_distribution_config` | Immutable. Zone distribution config for Memorystore Redis cluster. Structure is [documented below](#nested_zone_distribution_config). | false | false | None | None | None |
| `allow_fewer_zones_deployment` | Allows customers to specify if they are okay with deploying a multi-zone cluster in less than 3 zones. Once set, if there is a zonal outage during the cluster creation, the cluster will only be deployed in 2 zones, and stay within the 2 zones for its lifecycle. | false | false | None | None | None |
| `psc_configs` | Required. Each PscConfig configures the consumer network where two network addresses will be designated to the cluster for client access. Currently, only one PscConfig is supported. Structure is [documented below](#nested_psc_configs). | false | false | None | None | None |
| `replica_count` | Optional. The number of replica nodes per shard. | false | false | None | None | None |
| `deletion_protection_enabled` | Optional. Indicates if the cluster is deletion protected or not. If the value if set to true, any delete cluster operation will fail. Default value is true. | false | true | None | True | False |
| `redis_configs` | Configure Redis Cluster behavior using a subset of native Redis configuration parameters. Please check Memorystore documentation for the list of supported parameters: https://cloud.google.com/memorystore/docs/cluster/supported-instance-configurations | false | false | None | None | None |
| `persistence_config` | Persistence config (RDB, AOF) for the cluster. Structure is [documented below](#nested_persistence_config). | false | true | None | ['RDB', 'AOF'] | ['DISABLED', 'PERSISTENCE_MODE_UNSPECIFIED'] |
| `maintenance_policy` | Maintenance policy for a cluster Structure is [documented below](#nested_maintenance_policy). | false | false | None | None | None |
| `cross_cluster_replication_config` | Cross cluster replication config Structure is [documented below](#nested_cross_cluster_replication_config). | false | false | None | None | None |
| `kms_key` | The KMS key used to encrypt the at-rest data of the cluster. | false | false | None | None | None |
| `region` | The name of the region of the Redis cluster. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `fixed_frequency_schedule` |  | false | false | None | None | None |
| `start_time` |  | false | false | None | None | None |
| `rdb_config` |  | false | false | None | None | None |
| `aof_config` |  | false | false | None | None | None |
| `weekly_maintenance_window` |  | false | false | None | None | None |
| `primary_cluster` |  | false | false | None | None | None |
| `secondary_clusters` |  | false | false | None | None | None |

### gcs_source Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `uris` | URIs of the GCS objects to import. Example: gs://bucket1/object1, gs://bucket2/folder2/object2 | true | false | None | None | None |

### managed_backup_source Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `backup` | Example: `projects/{project}/locations/{location}/backupCollections/{collection}/backups/{backup}`. | true | false | None | None | None |

### automated_backup_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `fixed_frequency_schedule` | Trigger automated backups at a fixed frequency. Structure is [documented below](#nested_automated_backup_config_fixed_frequency_schedule). | true | false | None | None | None |
| `retention` | How long to keep automated backups before the backups are deleted. The value should be between 1 day and 365 days. If not specified, the default value is 35 days. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | true | false | None | None | None |

### zone_distribution_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `mode` | Immutable. The mode for zone distribution for Memorystore Redis cluster. If not provided, MULTI_ZONE will be used as default Possible values are: `MULTI_ZONE`, `SINGLE_ZONE`. | false | false | None | None | None |
| `zone` | Immutable. The zone for single zone Memorystore Redis cluster. | false | false | None | None | None |

### psc_configs Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `network` | Required. The consumer network where the network address of the discovery endpoint will be reserved, in the form of projects/{network_project_id_or_number}/global/networks/{network_id}. | true | false | None | None | None |

### persistence_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `mode` | Optional. Controls whether Persistence features are enabled. If not provided, the existing value will be used. - DISABLED: 	Persistence (both backup and restore) is disabled for the cluster. - RDB: RDB based Persistence is enabled. - AOF: AOF based Persistence is enabled. Possible values are: `PERSISTENCE_MODE_UNSPECIFIED`, `DISABLED`, `RDB`, `AOF`. | false | true | None | ['RDB', 'AOF'] | ['DISABLED', 'PERSISTENCE_MODE_UNSPECIFIED'] |
| `rdb_config` | RDB configuration. This field will be ignored if mode is not RDB. Structure is [documented below](#nested_persistence_config_rdb_config). | false | true | None | ONE_HOUR | ['SIX_HOURS', 'TWELVE_HOURS', 'TWENTY_FOUR_HOURS'] |
| `aof_config` | AOF configuration. This field will be ignored if mode is not AOF. Structure is [documented below](#nested_persistence_config_aof_config). | false | true | None | EVERYSEC | ['ALWAYS', 'NO'] |

### maintenance_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `create_time` | (Output) Output only. The time when the policy was created. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. | false | false | None | None | None |
| `update_time` | (Output) Output only. The time when the policy was last updated. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. | false | false | None | None | None |
| `weekly_maintenance_window` | Optional. Maintenance window that is applied to resources covered by this policy. Minimum 1. For the current version, the maximum number of weekly_window is expected to be one. Structure is [documented below](#nested_maintenance_policy_weekly_maintenance_window). | false | false | None | None | None |

### cross_cluster_replication_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cluster_role` | The role of the cluster in cross cluster replication. Supported values are: 1. `CLUSTER_ROLE_UNSPECIFIED`: This is an independent cluster that has never participated in cross cluster replication. It allows both reads and writes. 1. `NONE`: This is an independent cluster that previously participated in cross cluster replication(either as a `PRIMARY` or `SECONDARY` cluster). It allows both reads and writes. 1. `PRIMARY`: This cluster serves as the replication source for secondary clusters that are replicating from it. Any data written to it is automatically replicated to its secondary clusters. It allows both reads and writes. 1. `SECONDARY`: This cluster replicates data from the primary cluster. It allows only reads. Possible values are: `CLUSTER_ROLE_UNSPECIFIED`, `NONE`, `PRIMARY`, `SECONDARY`. | false | false | None | None | None |
| `primary_cluster` | Details of the primary cluster that is used as the replication source for this secondary cluster. This is allowed to be set only for clusters whose cluster role is of type `SECONDARY`. Structure is [documented below](#nested_cross_cluster_replication_config_primary_cluster). | false | false | None | None | None |
| `secondary_clusters` | List of secondary clusters that are replicating from this primary cluster. This is allowed to be set only for clusters whose cluster role is of type `PRIMARY`. Structure is [documented below](#nested_cross_cluster_replication_config_secondary_clusters). | false | false | None | None | None |
| `membership` | (Output) An output only view of all the member clusters participating in cross cluster replication. This field is populated for all the member clusters irrespective of their cluster role. Structure is [documented below](#nested_cross_cluster_replication_config_membership). | false | false | None | None | None |
| `update_time` | (Output) The last time cross cluster replication config was updated. | false | false | None | None | None |

### fixed_frequency_schedule Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `start_time` | The start time of every automated backup in UTC. It must be set to the start of an hour. This field is required. Structure is [documented below](#nested_automated_backup_config_fixed_frequency_schedule_start_time). | true | false | None | None | None |

### start_time Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `hours` | Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time. | false | false | None | None | None |
| `minutes` | Minutes of hour of day. Must be from 0 to 59. | false | false | None | None | None |
| `seconds` | Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds. | false | false | None | None | None |
| `nanos` | Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999. | false | false | None | None | None |

### rdb_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `rdb_snapshot_period` | Optional. Available snapshot periods for scheduling. - ONE_HOUR:	Snapshot every 1 hour. - SIX_HOURS:	Snapshot every 6 hours. - TWELVE_HOURS:	Snapshot every 12 hours. - TWENTY_FOUR_HOURS:	Snapshot every 24 hours. Possible values are: `SNAPSHOT_PERIOD_UNSPECIFIED`, `ONE_HOUR`, `SIX_HOURS`, `TWELVE_HOURS`, `TWENTY_FOUR_HOURS`. | false | false | None | None | None |
| `rdb_snapshot_start_time` | The time that the first snapshot was/will be attempted, and to which future snapshots will be aligned. If not provided, the current time will be used. | false | false | None | None | None |

### aof_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `append_fsync` | Optional. Available fsync modes. - NO - Do not explicitly call fsync(). Rely on OS defaults. - EVERYSEC - Call fsync() once per second in a background thread. A balance between performance and durability. - ALWAYS - Call fsync() for earch write command. Possible values are: `APPEND_FSYNC_UNSPECIFIED`, `NO`, `EVERYSEC`, `ALWAYS`. | false | false | None | None | None |

### weekly_maintenance_window Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `day` | Required. The day of week that maintenance updates occur. - DAY_OF_WEEK_UNSPECIFIED: The day of the week is unspecified. - MONDAY: Monday - TUESDAY: Tuesday - WEDNESDAY: Wednesday - THURSDAY: Thursday - FRIDAY: Friday - SATURDAY: Saturday - SUNDAY: Sunday Possible values are: `DAY_OF_WEEK_UNSPECIFIED`, `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | true | false | None | None | None |
| `duration` | (Output) Output only. Duration of the maintenance window. The current window is fixed at 1 hour. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | false | None | None | None |
| `start_time` | Required. Start time of the window in UTC time. Structure is [documented below](#nested_maintenance_policy_weekly_maintenance_window_weekly_maintenance_window_start_time). | true | false | None | None | None |

### primary_cluster Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cluster` | The full resource path of the primary cluster in the format: projects/{project}/locations/{region}/clusters/{cluster-id} | false | false | None | None | None |
| `uid` | (Output) The unique id of the primary cluster. | false | false | None | None | None |

### secondary_clusters Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cluster` | (Output) The full resource path of the secondary cluster in the format: projects/{project}/locations/{region}/clusters/{cluster-id} | false | false | None | None | None |
| `uid` | (Output) The unique id of the secondary cluster. | false | false | None | None | None |
| `primary_cluster` | (Output) Details of the primary cluster that is used as the replication source for all the secondary clusters. Structure is [documented below](#nested_cross_cluster_replication_config_membership_primary_cluster). | false | false | None | None | None |
| `secondary_clusters` | (Output) List of secondary clusters that are replicating from the primary cluster. Structure is [documented below](#nested_cross_cluster_replication_config_membership_secondary_clusters). The `primary_cluster` block contains: | false | false | None | None | None |
