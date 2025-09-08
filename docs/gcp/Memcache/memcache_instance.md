## 🛡️ Policy Deployment Engine: `memcache_instance`

This section provides a concise policy evaluation for the `memcache_instance` resource in GCP.

Reference: [Terraform Registry – memcache_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/memcache_instance)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name of the instance. | true | None | None |
| `node_count` | Number of nodes in the memcache instance. | true | None | None |
| `display_name` | A user-visible name for the instance. | false | None | None |
| `labels` | Resource labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `zones` | Zones where memcache nodes should be provisioned.  If not provided, all zones will be used. | false | None | None |
| `authorized_network` | The full name of the GCE network to connect the instance to.  If not provided, 'default' will be used. | false | None | None |
| `memcache_version` | The major version of Memcached software. If not provided, latest supported version will be used. Currently the latest supported major version is MEMCACHE_1_5. The minor version will be automatically determined by our system based on the latest supported minor version. Default value is `MEMCACHE_1_5`. Possible values are: `MEMCACHE_1_5`, `MEMCACHE_1_6_15`. | false | None | None |
| `reserved_ip_range_id` | Contains the name of allocated IP address ranges associated with the private service access connection for example, "test-default" associated with IP range 10.0.0.0/29. | false | None | None |
| `region` | The region of the Memcache instance. If it is not provided, the provider region is used. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### node_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cpu_count` | Number of CPUs per node. | true | None | None |
| `memory_size_mb` | Memory size in Mebibytes for each memcache node. | true | None | None |

### memcache_parameters Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` | (Output) This is a unique ID associated with this set of parameters. | none | None | None |
| `params` | User-defined set of parameters to use in the memcache process. | false | None | None |

### maintenance_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `create_time` | (Output) Output only. The time when the policy was created. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits | none | None | None |
| `update_time` | (Output) Output only. The time when the policy was updated. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. | none | None | None |
| `description` | Optional. Description of what this policy is for. Create/Update methods return INVALID_ARGUMENT if the length is greater than 512. | false | None | None |
| `weekly_maintenance_window` | Required. Maintenance window that is applied to resources covered by this policy. Minimum 1. For the current version, the maximum number of weekly_maintenance_windows is expected to be one. Structure is [documented below](#nested_maintenance_policy_weekly_maintenance_window). | true | None | None |

### weekly_maintenance_window Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `day` | Required. The day of week that maintenance updates occur. - DAY_OF_WEEK_UNSPECIFIED: The day of the week is unspecified. - MONDAY: Monday - TUESDAY: Tuesday - WEDNESDAY: Wednesday - THURSDAY: Thursday - FRIDAY: Friday - SATURDAY: Saturday - SUNDAY: Sunday Possible values are: `DAY_OF_WEEK_UNSPECIFIED`, `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | true | None | None |
| `duration` | Required. The length of the maintenance window, ranging from 3 hours to 8 hours. A duration in seconds with up to nine fractional digits, terminated by 's'. Example: "3.5s". | true | None | None |
| `start_time` | Required. Start time of the window in UTC time. Structure is [documented below](#nested_maintenance_policy_weekly_maintenance_window_weekly_maintenance_window_start_time). | true | None | None |

### start_time Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hours` | Hours of day in 24 hour format. Should be from 0 to 23. An API may choose to allow the value "24:00:00" for scenarios like business closing time. | false | None | None |
| `minutes` | Minutes of hour of day. Must be from 0 to 59. | false | None | None |
| `seconds` | Seconds of minutes of the time. Must normally be from 0 to 59. An API may allow the value 60 if it allows leap-seconds. | false | None | None |
| `nanos` | Fractions of seconds in nanoseconds. Must be from 0 to 999,999,999. | false | None | None |
