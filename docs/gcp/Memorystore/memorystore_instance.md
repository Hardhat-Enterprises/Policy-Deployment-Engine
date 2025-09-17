## 🛡️ Policy Deployment Engine: `memorystore_instance`

This section provides a concise policy evaluation for the `memorystore_instance` resource in GCP.

Reference: [Terraform Registry – memorystore_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/memorystore_instance)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `shard_count` | Required. Number of shards for the instance. | true | false | None | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. See documentation for resource type `memorystore.googleapis.com/CertificateAuthority`. | true | false | None | None | None |
| `instance_id` | Required. The ID to use for the instance, which will become the final component of the instance's resource name. This value is subject to the following restrictions: * Must be 4-63 characters in length * Must begin with a letter or digit * Must contain only lowercase letters, digits, and hyphens * Must not end with a hyphen * Must be unique within a location | true | false | None | None | None |
| `labels` | Optional. Labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `automated_backup_config` | The automated backup config for a instance. Structure is [documented below](#nested_automated_backup_config). | false | false | None | None | None |
| `replica_count` | Optional. Number of replica nodes per shard. If omitted the default is 0 replicas. | false | false | None | None | None |
| `authorization_mode` | Optional. Immutable. Authorization mode of the instance. Possible values: AUTH_DISABLED IAM_AUTH.Redis instances must use IAM-based authentication (AUTH_MODE_IAM_AUTH) to enforce centralized access control. | true | false | None | None | None |
| `transit_encryption_mode` | Optional. Immutable. In-transit encryption mode of the instance. Possible values: TRANSIT_ENCRYPTION_DISABLED SERVER_AUTHENTICATION | false | false | None | None | None |
| `node_type` | Optional. Machine type for individual nodes of the instance. Possible values: SHARED_CORE_NANO HIGHMEM_MEDIUM HIGHMEM_XLARGE STANDARD_SMALL | false | false | None | None | None |
| `persistence_config` | Represents persistence configuration for a instance. Structure is [documented below](#nested_persistence_config).Redis instances must use RDB persistence mode to ensure point-in-time recovery capability. | true | false | None | None | None |
| `maintenance_policy` | Maintenance policy for a cluster Structure is [documented below](#nested_maintenance_policy). | false | false | None | None | None |
| `engine_version` | Optional. Engine version of the instance. | false | false | None | None | None |
| `engine_configs` | Optional. User-provided engine configurations for the instance. | false | false | None | None | None |
| `zone_distribution_config` | Zone distribution configuration for allocation of instance resources. Structure is [documented below](#nested_zone_distribution_config). | false | false | None | None | None |
| `allow_fewer_zones_deployment` | Allows customers to specify if they are okay with deploying a multi-zone instance in less than 3 zones. Once set, if there is a zonal outage during the instance creation, the instance will only be deployed in 2 zones, and stay within the 2 zones for its lifecycle. | false | false | None | None | None |
| `deletion_protection_enabled` | Optional. If set to true deletion of the instance will fail.Redis instances must have deletion protection enabled to prevent accidental data loss. | true | false | None | None | None |
| `cross_instance_replication_config` | Cross instance replication config Structure is [documented below](#nested_cross_instance_replication_config). | false | false | None | None | None |
| `mode` | Optional. cluster or cluster-disabled. Possible values: CLUSTER CLUSTER_DISABLED Possible values are: `CLUSTER`, `CLUSTER_DISABLED`. | false | false | None | None | None |
| `gcs_source` | GCS source for the instance. Structure is [documented below](#nested_gcs_source). | false | false | None | None | None |
| `managed_backup_source` | Managed backup source for the instance. Structure is [documented below](#nested_managed_backup_source). | false | false | None | None | None |
| `kms_key` | The KMS key used to encrypt the at-rest data of the cluster | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `desired_psc_auto_connections` |  | false | false | None | None | None |
| `desired_auto_created_endpoints` |  | false | false | None | None | None |
| `fixed_frequency_schedule` |  | false | false | None | None | None |
| `start_time` |  | false | false | None | None | None |
| `rdb_config` |  | false | false | None | None | None |
| `aof_config` |  | false | false | None | None | None |
| `weekly_maintenance_window` |  | false | false | None | None | None |
| `primary_instance` |  | false | false | None | None | None |
| `secondary_instances` |  | false | false | None | None | None |

### automated_backup_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `fixed_frequency_schedule` | Trigger automated backups at a fixed frequency. Structure is [documented below](#nested_automated_backup_config_fixed_frequency_schedule). | true | false | None | None | None |
| `retention` | How long to keep automated backups before the backups are deleted. The value should be between 1 day and 365 days. If not specified, the default value is 35 days. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". The default_value is "3024000s" | true | false | None | None | None |

### persistence_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `mode` | Optional. Current persistence mode. Possible values: DISABLED RDB AOF Possible values are: `DISABLED`, `RDB`, `AOF`. | false | false | None | None | None |
| `rdb_config` | Configuration for RDB based persistence. Structure is [documented below](#nested_persistence_config_rdb_config). | false | false | None | None | None |
| `aof_config` | Configuration for AOF based persistence. Structure is [documented below](#nested_persistence_config_aof_config). | false | false | None | None | None |

### maintenance_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `create_time` | (Output) The time when the policy was created. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. | false | false | None | None | None |
| `update_time` | (Output) The time when the policy was last updated. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. | false | false | None | None | None |
| `weekly_maintenance_window` | Optional. Maintenance window that is applied to resources covered by this policy. Minimum 1. For the current version, the maximum number of weekly_window is expected to be one. Structure is [documented below](#nested_maintenance_policy_weekly_maintenance_window). | false | false | None | None | None |

### zone_distribution_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `zone` | Optional. Defines zone where all resources will be allocated with SINGLE_ZONE mode. Ignored for MULTI_ZONE mode. | false | false | None | None | None |
| `mode` | Optional. Current zone distribution mode. Defaults to MULTI_ZONE. Possible values: MULTI_ZONE SINGLE_ZONE Possible values are: `MULTI_ZONE`, `SINGLE_ZONE`. | false | false | None | None | None |

### cross_instance_replication_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `instance_role` | The instance role supports the following values: 1. `INSTANCE_ROLE_UNSPECIFIED`: This is an independent instance that has never participated in cross instance replication. It allows both reads and writes. 2. `NONE`: This is an independent instance that previously participated in cross instance replication(either as a `PRIMARY` or `SECONDARY` cluster). It allows both reads and writes. 3. `PRIMARY`: This instance serves as the replication source for secondary instance that are replicating from it. Any data written to it is automatically replicated to its secondary clusters. It allows both reads and writes. 4. `SECONDARY`: This instance replicates data from the primary instance. It allows only reads. Possible values are: `INSTANCE_ROLE_UNSPECIFIED`, `NONE`, `PRIMARY`, `SECONDARY`. | false | false | None | None | None |
| `primary_instance` | This field is only set for a secondary instance. Details of the primary instance that is used as the replication source for this secondary instance. This is allowed to be set only for clusters whose cluster role is of type `SECONDARY`. Structure is [documented below](#nested_cross_instance_replication_config_primary_instance). | false | false | None | None | None |
| `secondary_instances` | List of secondary instances that are replicating from this primary cluster. This is allowed to be set only for instances whose cluster role is of type `PRIMARY`. Structure is [documented below](#nested_cross_instance_replication_config_secondary_instances). | false | false | None | None | None |
| `membership` | (Output) An output only view of all the member instance participating in cross instance replication. This field is populated for all the member clusters irrespective of their cluster role. Structure is [documented below](#nested_cross_instance_replication_config_membership). | false | false | None | None | None |
| `update_time` | (Output) The last time cross instance replication config was updated. | false | false | None | None | None |

### gcs_source Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `uris` | URIs of the GCS objects to import. Example: gs://bucket1/object1, gs://bucket2/folder2/object2 | true | false | None | None | None |

### managed_backup_source Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `backup` | Example: `projects/{project}/locations/{location}/backupCollections/{collection}/backups/{backup}`. | true | false | None | None | None |

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
| `rdb_snapshot_period` | Optional. Period between RDB snapshots. Possible values: ONE_HOUR SIX_HOURS TWELVE_HOURS TWENTY_FOUR_HOURS | false | false | None | None | None |
| `rdb_snapshot_start_time` | Optional. Time that the first snapshot was/will be attempted, and to which future snapshots will be aligned. If not provided, the current time will be used. | false | false | None | None | None |

### aof_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `append_fsync` | Optional. The fsync mode. Possible values: NEVER EVERY_SEC ALWAYS | false | false | None | None | None |

### weekly_maintenance_window Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `day` | The day of week that maintenance updates occur. - DAY_OF_WEEK_UNSPECIFIED: The day of the week is unspecified. - MONDAY: Monday - TUESDAY: Tuesday - WEDNESDAY: Wednesday - THURSDAY: Thursday - FRIDAY: Friday - SATURDAY: Saturday - SUNDAY: Sunday Possible values are: `DAY_OF_WEEK_UNSPECIFIED`, `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | true | false | None | None | None |
| `duration` | (Output) Duration of the maintenance window. The current window is fixed at 1 hour. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | false | false | None | None | None |
| `start_time` | Start time of the window in UTC time. Structure is [documented below](#nested_maintenance_policy_weekly_maintenance_window_weekly_maintenance_window_start_time). | true | false | None | None | None |

### primary_instance Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `instance` | The full resource path of the primary instance in the format: projects/{project}/locations/{region}/instances/{instance-id} | false | false | None | None | None |
| `uid` | (Output) The unique id of the primary instance. | false | false | None | None | None |

### secondary_instances Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `instance` | (Output) The full resource path of the secondary instance in the format: projects/{project}/locations/{region}/instance/{instance-id} | false | false | None | None | None |
| `uid` | (Output) The unique id of the secondary instance. | false | false | None | None | None |
| `primary_instance` | (Output) Details of the primary instance that is used as the replication source for all the secondary instances. Structure is [documented below](#nested_cross_instance_replication_config_membership_primary_instance). | false | false | None | None | None |
| `secondary_instance` | (Output) List of secondary instances that are replicating from the primary instance. Structure is [documented below](#nested_cross_instance_replication_config_membership_secondary_instance). The `primary_instance` block contains: | false | false | None | None | None |
