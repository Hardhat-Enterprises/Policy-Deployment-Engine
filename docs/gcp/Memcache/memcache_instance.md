## 🛡️ Policy Deployment Engine: `memcache_instance`

This section provides a concise policy evaluation for the `memcache_instance` resource in GCP.

Reference: [Terraform Registry – memcache_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/memcache_instance)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource name of the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_count`
- Description: (Required) Number of nodes in the memcache instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_config`
- Description: (Required) Configuration for memcache nodes. Structure is [documented below](#nested_node_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) A user-visible name for the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Resource labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zones`
- Description: (Optional) Zones where memcache nodes should be provisioned.  If not provided, all zones will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorized_network`
- Description: (Optional) The full name of the GCE network to connect the instance to.  If not provided, 'default' will be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memcache_version`
- Description: (Optional) The major version of Memcached software. If not provided, latest supported version will be used. Currently the latest supported major version is MEMCACHE_1_5. The minor version will be automatically determined by our system based on the latest supported minor version. Default value is `MEMCACHE_1_5`. Possible values are: `MEMCACHE_1_5`, `MEMCACHE_1_6_15`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memcache_parameters`
- Description: (Optional) User-specified parameters for this memcache instance. Structure is [documented below](#nested_memcache_parameters).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_policy`
- Description: (Optional) Maintenance policy for an instance. Structure is [documented below](#nested_maintenance_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reserved_ip_range_id`
- Description: (Optional) Contains the name of allocated IP address ranges associated with the private service access connection for example, "test-default" associated with IP range 10.0.0.0/29.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) The region of the Memcache instance. If it is not provided, the provider region is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_node_config"></a>The `node_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cpu_count`
- Description: (Required) Number of CPUs per node.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory_size_mb`
- Description: (Required) Memory size in Mebibytes for each memcache node. <a name="nested_memcache_parameters"></a>The `memcache_parameters` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Output) This is a unique ID associated with this set of parameters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `params`
- Description: (Optional) User-defined set of parameters to use in the memcache process. <a name="nested_maintenance_policy"></a>The `maintenance_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_time`
- Description: (Output) Output only. The time when the policy was created. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `update_time`
- Description: (Output) Output only. The time when the policy was updated. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. Description of what this policy is for. Create/Update methods return INVALID_ARGUMENT if the length is greater than 512.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weekly_maintenance_window`
- Description: (Required) Required. Maintenance window that is applied to resources covered by this policy. Minimum 1. For the current version, the maximum number of weekly_maintenance_windows is expected to be one. Structure is [documented below](#nested_maintenance_policy_weekly_maintenance_window). <a name="nested_maintenance_policy_weekly_maintenance_window"></a>The `weekly_maintenance_window` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day`
- Description: (Required) Required. The day of week that maintenance updates occur. - DAY_OF_WEEK_UNSPECIFIED: The day of the week is unspecified. - MONDAY: Monday - TUESDAY: Tuesday - WEDNESDAY: Wednesday - THURSDAY: Thursday - FRIDAY: Friday - SATURDAY: Saturday - SUNDAY: Sunday Possible values are: `DAY_OF_WEEK_UNSPECIFIED`, `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `duration`
- Description: (Required) Required. The length of the maintenance window, ranging from 3 hours to 8 hours. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s".
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
