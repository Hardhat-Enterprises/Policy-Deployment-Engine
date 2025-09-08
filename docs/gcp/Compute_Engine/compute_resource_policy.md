## 🛡️ Policy Deployment Engine: `compute_resource_policy`

This section provides a concise policy evaluation for the `compute_resource_policy` resource in GCP.

Reference: [Terraform Registry – compute_resource_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_resource_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the resource, provided by the client when initially creating the resource. The resource name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])`? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `description` | An optional description of this resource. Provide this property when you create the resource. | false | None | None |
| `region` | Region where resource policy resides. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### snapshot_schedule_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `schedule` | Contains one of an `hourlySchedule`, `dailySchedule`, or `weeklySchedule`. Structure is [documented below](#nested_snapshot_schedule_policy_schedule). | true | None | None |
| `retention_policy` | Retention policy applied to snapshots created by this resource policy. Structure is [documented below](#nested_snapshot_schedule_policy_retention_policy). | false | None | None |
| `snapshot_properties` | Properties with which the snapshots are created, such as labels. Structure is [documented below](#nested_snapshot_schedule_policy_snapshot_properties). | false | None | None |

### group_placement_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `vm_count` | Number of VMs in this placement group. Google does not recommend that you use this field unless you use a compact policy and you want your policy to work only if it contains this exact number of VMs. | false | None | None |
| `availability_domain_count` | The number of availability domains instances will be spread across. If two instances are in different availability domain, they will not be put in the same low latency network | false | None | None |
| `collocation` | Collocation specifies whether to place VMs inside the same availability domain on the same low-latency network. Specify `COLLOCATED` to enable collocation. Can only be specified with `vm_count`. If compute instances are created with a COLLOCATED policy, then exactly `vm_count` instances must be created at the same time with the resource policy attached. Possible values are: `COLLOCATED`. | false | None | None |
| `max_distance` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Specifies the number of max logical switches. | false | None | None |
| `gpu_topology` | Specifies the shape of the GPU slice, in slice based GPU families eg. A4X. | false | None | None |
| `tpu_topology` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Specifies the shape of the TPU slice. | false | None | None |

### instance_schedule_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `vm_start_schedule` | Specifies the schedule for starting instances. Structure is [documented below](#nested_instance_schedule_policy_vm_start_schedule). | false | None | None |
| `vm_stop_schedule` | Specifies the schedule for stopping instances. Structure is [documented below](#nested_instance_schedule_policy_vm_stop_schedule). | false | None | None |
| `time_zone` | Specifies the time zone to be used in interpreting the schedule. The value of this field must be a time zone name from the tz database: http://en.wikipedia.org/wiki/Tz_database. | true | None | None |
| `start_time` | The start time of the schedule. The timestamp is an RFC3339 string. | false | None | None |
| `expiration_time` | The expiration time of the schedule. The timestamp is an RFC3339 string. | false | None | None |

### disk_consistency_group_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Enable disk consistency on the resource policy. | true | None | None |

### workload_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | The type of workload policy. Possible values are: `HIGH_AVAILABILITY`, `HIGH_THROUGHPUT`. | true | None | None |
| `max_topology_distance` | The maximum topology distance. This field can be set only when the workload policy type is HIGH_THROUGHPUT and cannot be set if accelerator topology is set. Possible values are: `BLOCK`, `CLUSTER`, `SUBBLOCK`. | false | None | None |
| `accelerator_topology` | The accelerator topology. This field can be set only when the workload policy type is HIGH_THROUGHPUT and cannot be set if max topology distance is set. | false | None | None |

### schedule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hourly_schedule` | The policy will execute every nth hour starting at the specified time. Structure is [documented below](#nested_snapshot_schedule_policy_schedule_hourly_schedule). | false | None | None |
| `daily_schedule` | The policy will execute every nth day at the specified time. Structure is [documented below](#nested_snapshot_schedule_policy_schedule_daily_schedule). | false | None | None |
| `weekly_schedule` | Allows specifying a snapshot time for each day of the week. Structure is [documented below](#nested_snapshot_schedule_policy_schedule_weekly_schedule). | false | None | None |

### hourly_schedule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `hours_in_cycle` | The number of hours between snapshots. | true | None | None |
| `start_time` | Time within the window to start the operations. It must be in an hourly format "HH:MM", where HH : [00-23] and MM : [00] GMT. eg: 21:00 | true | None | None |

### daily_schedule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `days_in_cycle` | Defines a schedule with units measured in days. The value determines how many days pass between the start of each cycle. Days in cycle for snapshot schedule policy must be 1. | true | None | None |
| `start_time` | This must be in UTC format that resolves to one of 00:00, 04:00, 08:00, 12:00, 16:00, or 20:00. For example, both 13:00-5 and 08:00 are valid. | true | None | None |

### weekly_schedule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `day_of_weeks` | May contain up to seven (one for each day of the week) snapshot times. Structure is [documented below](#nested_snapshot_schedule_policy_schedule_weekly_schedule_day_of_weeks). | true | None | None |

### day_of_weeks Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `start_time` | Time within the window to start the operations. It must be in format "HH:MM", where HH : [00-23] and MM : [00-00] GMT. | true | None | None |
| `day` | The day of the week to create the snapshot. e.g. MONDAY Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | true | None | None |

### retention_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_retention_days` | Maximum age of the snapshot that is allowed to be kept. | true | None | None |
| `on_source_disk_delete` | Specifies the behavior to apply to scheduled snapshots when the source disk is deleted. Default value is `KEEP_AUTO_SNAPSHOTS`. Possible values are: `KEEP_AUTO_SNAPSHOTS`, `APPLY_RETENTION_POLICY`. | false | None | None |

### snapshot_properties Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `labels` | A set of key-value pairs. | false | None | None |
| `storage_locations` | Cloud Storage bucket location to store the auto snapshot (regional or multi-regional) | false | None | None |
| `guest_flush` | Whether to perform a 'guest aware' snapshot. | false | None | None |
| `chain_name` | Creates the new snapshot in the snapshot chain labeled with the specified name. The chain name must be 1-63 characters long and comply with RFC1035. | false | None | None |

### vm_start_schedule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `schedule` | Specifies the frequency for the operation, using the unix-cron format. | true | None | None |

### vm_stop_schedule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `schedule` | Specifies the frequency for the operation, using the unix-cron format. | true | None | None |
