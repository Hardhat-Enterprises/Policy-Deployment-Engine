## 🛡️ Policy Deployment Engine: `redis_instance`

This section provides a concise policy evaluation for the `redis_instance` resource in GCP.

Reference: [Terraform Registry – redis_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/redis_instance)

---

## 1. Argument Reference

### `name`
- Description: (Required) The ID of the instance or a fully qualified identifier for the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory_size_gb`
- Description: (Required) Redis memory size in GiB.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `alternative_location_id`
- Description: (Optional) Only applicable to STANDARD_HA tier which protects the instance against zonal failures by provisioning it across two zones. If provided, it must be a different zone from the one provided in [locationId].
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auth_enabled`
- Description: (Optional) Optional. Indicates whether OSS Redis AUTH is enabled for the instance. If set to "true" AUTH is enabled on the instance. Default value is "false" meaning AUTH is disabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorized_network`
- Description: (Optional) The full name of the Google Compute Engine network to which the instance is connected. If left unspecified, the default network will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connect_mode`
- Description: (Optional) The connection mode of the Redis instance. Default value is `DIRECT_PEERING`. Possible values are: `DIRECT_PEERING`, `PRIVATE_SERVICE_ACCESS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) An arbitrary and optional user-provided name for the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redis_configs`
- Description: (Optional) Redis configuration parameters, according to http://redis.io/topics/config. Please check Memorystore documentation for the list of supported parameters: https://cloud.google.com/memorystore/docs/redis/reference/rest/v1/projects.locations.instances#Instance.FIELDS.redis_configs
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location_id`
- Description: (Optional) The zone where the instance will be provisioned. If not provided, the service will choose a zone for the instance. For STANDARD_HA tier, instances will be created across two zones for protection against zonal failures. If [alternativeLocationId] is also provided, it must be different from [locationId].
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `persistence_config`
- Description: (Optional) Persistence configuration for an instance. Structure is [documented below](#nested_persistence_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_policy`
- Description: (Optional) Maintenance policy for an instance. Structure is [documented below](#nested_maintenance_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_version`
- Description: (Optional) The self service update maintenance version.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `redis_version`
- Description: (Optional) The version of Redis software. If not provided, latest supported version will be used. Please check the API documentation linked at the top for the latest valid values.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reserved_ip_range`
- Description: (Optional) The CIDR range of internal addresses that are reserved for this instance. If not provided, the service will choose an unused /29 block, for example, 10.0.0.0/29 or 192.168.0.0/29. Ranges must be unique and non-overlapping with existing subnets in an authorized network.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tier`
- Description: (Optional) The service tier of the instance. Must be one of these values: - BASIC: standalone instance - STANDARD_HA: highly available primary/replica instances Default value is `BASIC`. Possible values are: `BASIC`, `STANDARD_HA`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `transit_encryption_mode`
- Description: (Optional) The TLS mode of the Redis instance, If not provided, TLS is disabled for the instance. - SERVER_AUTHENTICATION: Client to Server traffic encryption enabled with server authentication Default value is `DISABLED`. Possible values are: `SERVER_AUTHENTICATION`, `DISABLED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replica_count`
- Description: (Optional) Optional. The number of replica nodes. The valid range for the Standard Tier with read replicas enabled is [1-5] and defaults to 2. If read replicas are not enabled for a Standard Tier instance, the only valid value is 1 and the default is 1. The valid value for basic tier is 0 and the default is also 0.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `read_replicas_mode`
- Description: (Optional) Optional. Read replica mode. Can only be specified when trying to create the instance. If not set, Memorystore Redis backend will default to READ_REPLICAS_DISABLED. - READ_REPLICAS_DISABLED: If disabled, read endpoint will not be provided and the instance cannot scale up or down the number of replicas. - READ_REPLICAS_ENABLED: If enabled, read endpoint will be provided and the instance can scale up and down the number of replicas. Possible values are: `READ_REPLICAS_DISABLED`, `READ_REPLICAS_ENABLED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secondary_ip_range`
- Description: (Optional) Optional. Additional IP range for node placement. Required when enabling read replicas on an existing instance. For DIRECT_PEERING mode value must be a CIDR range of size /28, or "auto". For PRIVATE_SERVICE_ACCESS mode value must be the name of an allocated address range associated with the private service access connection, or "auto".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `customer_managed_key`
- Description: (Optional) Optional. The KMS key reference that you want to use to encrypt the data at rest for this Redis instance. If this is provided, CMEK is enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The name of the Redis region of the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_persistence_config"></a>The `persistence_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `persistence_mode`
- Description: (Required) Optional. Controls whether Persistence features are enabled. If not provided, the existing value will be used. - DISABLED: 	Persistence is disabled for the instance, and any existing snapshots are deleted. - RDB: RDB based Persistence is enabled. Possible values are: `DISABLED`, `RDB`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rdb_snapshot_period`
- Description: (Optional) Optional. Available snapshot periods for scheduling. - ONE_HOUR:	Snapshot every 1 hour. - SIX_HOURS:	Snapshot every 6 hours. - TWELVE_HOURS:	Snapshot every 12 hours. - TWENTY_FOUR_HOURS:	Snapshot every 24 hours. Possible values are: `ONE_HOUR`, `SIX_HOURS`, `TWELVE_HOURS`, `TWENTY_FOUR_HOURS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rdb_next_snapshot_time`
- Description: (Output) Output only. The next time that a snapshot attempt is scheduled to occur. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rdb_snapshot_start_time`
- Description: (Optional) Optional. Date and time that the first snapshot was/will be attempted, and to which future snapshots will be aligned. If not provided, the current time will be used. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". <a name="nested_maintenance_policy"></a>The `maintenance_policy` block supports:
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

### `description`
- Description: (Optional) Optional. Description of what this policy is for. Create/Update methods return INVALID_ARGUMENT if the length is greater than 512.
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
- Description: (Optional) Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
