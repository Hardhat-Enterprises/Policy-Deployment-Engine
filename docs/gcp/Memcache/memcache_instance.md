## 🛡️ Policy Deployment Engine: `memcache_instance`

This section provides a concise policy evaluation for the `memcache_instance` resource in GCP.

Reference: [Terraform Registry – memcache_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/memcache_instance)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The resource name of the instance. | true | false | None | None | None |
| `node_count` | Number of nodes in the memcache instance. | true | false | None | None | None |
| `node_config` | Configuration for memcache nodes. Structure is [documented below](#nested_node_config). | true | false | None | None | None |
| `display_name` | A user-visible name for the instance. | false | false | None | None | None |
| `labels` | Resource labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `zones` | Zones where memcache nodes should be provisioned.  If not provided, all zones will be used. | false | false | None | None | None |
| `authorized_network` | The full name of the GCE network to connect the instance to.  If not provided, 'default' will be used. | false | true | Selecting the correct VPC network ensures that instances are accessed only from trusted networks, thereby improving data security. | google_service_networking_connection.private_service_connection.network | [None, '', 'default'] |
| `memcache_version` | The major version of Memcached software. If not provided, latest supported version will be used. Currently the latest supported major version is MEMCACHE_1_5. The minor version will be automatically determined by our system based on the latest supported minor version. Default value is `MEMCACHE_1_5`. Possible values are: `MEMCACHE_1_5`, `MEMCACHE_1_6_15`. | false | true | Choosing an appropriate Memcache version guarantees compatibility with client libraries and ensures continued support and security updates from GCP. | ['MEMCACHE_1_5', 'MEMCACHE_1_6_15'] | [None, '', 'default'] |
| `memcache_parameters` | User-specified parameters for this memcache instance. Structure is [documented below](#nested_memcache_parameters). | false | false | None | None | None |
| `maintenance_policy` | Maintenance policy for an instance. Structure is [documented below](#nested_maintenance_policy). | false | true | Defining a maintenance policy ensures predictable maintenance windows, allowing administrators to plan for downtime and reduce unexpected service disruptions. | None | [None, ''] |
| `reserved_ip_range_id` | Contains the name of allocated IP address ranges associated with the private service access connection for example, "test-default" associated with IP range 10.0.0.0/29. | false | true | Specifying a reserved IP range ensures that the Memcache instance operates within an allocated, conflict-free network space, preventing overlaps with other resources. | ['test-default'] |  |
| `region` | The region of the Memcache instance. If it is not provided, the provider region is used. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |

### node_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `cpu_count` | Number of CPUs per node. | true | false | None | None | None |
| `memory_size_mb` | Memory size in Mebibytes for each memcache node. | true | false | None | None | None |

### memcache_parameters Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` | (Output) This is a unique ID associated with this set of parameters. | false | false | None | None | None |
| `params` | User-defined set of parameters to use in the memcache process. | false | false | None | None | None |

### maintenance_policy Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `create_time` | (Output) Output only. The time when the policy was created. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits | false | false | None | None | None |
| `update_time` | (Output) Output only. The time when the policy was updated. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. | false | false | None | None | None |
| `description` | Optional. Description of what this policy is for. Create/Update methods return INVALID_ARGUMENT if the length is greater than 512. | false | false | None | None | None |
| `weekly_maintenance_window` | Required. Maintenance window that is applied to resources covered by this policy. Minimum 1. For the current version, the maximum number of weekly_maintenance_windows is expected to be one. Structure is [documented below](#nested_maintenance_policy_weekly_maintenance_window). | true | true | Setting a weekly maintenance window allows administrators to align system updates with low-traffic periods, minimizing operational impact and ensuring service stability. | None | None |

###   weekly_maintenance_window Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `day` | Day of the week when the maintenance window starts (e.g., MONDAY, SUNDAY). | true | false | Selecting an appropriate day ensures maintenance does not disrupt peak traffic periods. | ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY'] | [None, '', 'DAY_OF_WEEK_UNSPECIFIED', 3] |
  | `start_time` | Time of day (UTC) when the maintenance window starts. | true | false | A properly chosen start time ensures updates happen during low-usage hours. | None | [None, ''] |
  | `duration` | Duration of the maintenance window in seconds. | true | false | Specifying the duration ensures that updates are completed within a controlled timeframe. | 10800s to 28800s | None |

###     start_time Block

    | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
    |----------|-------------|----------|-----------------|-----------|-----------|---------------|
    | `hours` | Hour of the day (0-23). | false | false | Correct hour selection ensures updates align with expected downtime periods. | Integer between 0 - 23 | [-1, 24, 'non-integer values'] |
    | `minutes` | Minute of the hour (0-59). | true | false | Precise minute specification helps align maintenance with exact scheduling needs. | Integer between 0 - 59 | [-1, 60, 'non-integer values'] |
    | `seconds` | Second of the minute (0-59). | false | false | Seconds allow fine-grained control of the start time, but usually default to 0. | Integer between 0 - 59 | [-1, 60, 'non-integer values'] |
    | `nanos` | Fractions of a second in nanoseconds (0-999,999,999). | false | false | Nanosecond precision is rarely required for maintenance windows but ensures full compatibility with GCP TimeOfDay format. | 0 | 999999999 |
