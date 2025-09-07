## 🛡️ Policy Deployment Engine: `compute_resource_policy`

This section provides a concise policy evaluation for the `compute_resource_policy` resource in GCP.

Reference: [Terraform Registry – compute_resource_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_resource_policy)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name of the resource, provided by the client when initially creating the resource. The resource name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])`? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource. Provide this property when you create the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `snapshot_schedule_policy`
- Description: (Optional) Policy for creating snapshots of persistent disks. Structure is [documented below](#nested_snapshot_schedule_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `group_placement_policy`
- Description: (Optional) Resource policy for instances used for placement configuration. Structure is [documented below](#nested_group_placement_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_schedule_policy`
- Description: (Optional) Resource policy for scheduling instance operations. Structure is [documented below](#nested_instance_schedule_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_consistency_group_policy`
- Description: (Optional) Replication consistency group for asynchronous disk replication. Structure is [documented below](#nested_disk_consistency_group_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workload_policy`
- Description: (Optional) Represents the workload policy. Structure is [documented below](#nested_workload_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) Region where resource policy resides.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_snapshot_schedule_policy"></a>The `snapshot_schedule_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule`
- Description: (Required) Contains one of an `hourlySchedule`, `dailySchedule`, or `weeklySchedule`. Structure is [documented below](#nested_snapshot_schedule_policy_schedule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `retention_policy`
- Description: (Optional) Retention policy applied to snapshots created by this resource policy. Structure is [documented below](#nested_snapshot_schedule_policy_retention_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `snapshot_properties`
- Description: (Optional) Properties with which the snapshots are created, such as labels. Structure is [documented below](#nested_snapshot_schedule_policy_snapshot_properties). <a name="nested_snapshot_schedule_policy_schedule"></a>The `schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hourly_schedule`
- Description: (Optional) The policy will execute every nth hour starting at the specified time. Structure is [documented below](#nested_snapshot_schedule_policy_schedule_hourly_schedule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `daily_schedule`
- Description: (Optional) The policy will execute every nth day at the specified time. Structure is [documented below](#nested_snapshot_schedule_policy_schedule_daily_schedule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weekly_schedule`
- Description: (Optional) Allows specifying a snapshot time for each day of the week. Structure is [documented below](#nested_snapshot_schedule_policy_schedule_weekly_schedule). <a name="nested_snapshot_schedule_policy_schedule_hourly_schedule"></a>The `hourly_schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hours_in_cycle`
- Description: (Required) The number of hours between snapshots.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Required) Time within the window to start the operations. It must be in an hourly format "HH:MM", where HH : [00-23] and MM : [00] GMT. eg: 21:00 <a name="nested_snapshot_schedule_policy_schedule_daily_schedule"></a>The `daily_schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `days_in_cycle`
- Description: (Required) Defines a schedule with units measured in days. The value determines how many days pass between the start of each cycle. Days in cycle for snapshot schedule policy must be 1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Required) This must be in UTC format that resolves to one of 00:00, 04:00, 08:00, 12:00, 16:00, or 20:00. For example, both 13:00-5 and 08:00 are valid. <a name="nested_snapshot_schedule_policy_schedule_weekly_schedule"></a>The `weekly_schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day_of_weeks`
- Description: (Required) May contain up to seven (one for each day of the week) snapshot times. Structure is [documented below](#nested_snapshot_schedule_policy_schedule_weekly_schedule_day_of_weeks). <a name="nested_snapshot_schedule_policy_schedule_weekly_schedule_day_of_weeks"></a>The `day_of_weeks` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Required) Time within the window to start the operations. It must be in format "HH:MM", where HH : [00-23] and MM : [00-00] GMT.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day`
- Description: (Required) The day of the week to create the snapshot. e.g. MONDAY Possible values are: `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. <a name="nested_snapshot_schedule_policy_retention_policy"></a>The `retention_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_retention_days`
- Description: (Required) Maximum age of the snapshot that is allowed to be kept.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `on_source_disk_delete`
- Description: (Optional) Specifies the behavior to apply to scheduled snapshots when the source disk is deleted. Default value is `KEEP_AUTO_SNAPSHOTS`. Possible values are: `KEEP_AUTO_SNAPSHOTS`, `APPLY_RETENTION_POLICY`. <a name="nested_snapshot_schedule_policy_snapshot_properties"></a>The `snapshot_properties` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) A set of key-value pairs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_locations`
- Description: (Optional) Cloud Storage bucket location to store the auto snapshot (regional or multi-regional)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `guest_flush`
- Description: (Optional) Whether to perform a 'guest aware' snapshot.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `chain_name`
- Description: (Optional) Creates the new snapshot in the snapshot chain labeled with the specified name. The chain name must be 1-63 characters long and comply with RFC1035. <a name="nested_group_placement_policy"></a>The `group_placement_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vm_count`
- Description: (Optional) Number of VMs in this placement group. Google does not recommend that you use this field unless you use a compact policy and you want your policy to work only if it contains this exact number of VMs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `availability_domain_count`
- Description: (Optional) The number of availability domains instances will be spread across. If two instances are in different availability domain, they will not be put in the same low latency network
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `collocation`
- Description: (Optional) Collocation specifies whether to place VMs inside the same availability domain on the same low-latency network. Specify `COLLOCATED` to enable collocation. Can only be specified with `vm_count`. If compute instances are created with a COLLOCATED policy, then exactly `vm_count` instances must be created at the same time with the resource policy attached. Possible values are: `COLLOCATED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_distance`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Specifies the number of max logical switches.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gpu_topology`
- Description: (Optional) Specifies the shape of the GPU slice, in slice based GPU families eg. A4X.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tpu_topology`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Specifies the shape of the TPU slice. <a name="nested_instance_schedule_policy"></a>The `instance_schedule_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vm_start_schedule`
- Description: (Optional) Specifies the schedule for starting instances. Structure is [documented below](#nested_instance_schedule_policy_vm_start_schedule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vm_stop_schedule`
- Description: (Optional) Specifies the schedule for stopping instances. Structure is [documented below](#nested_instance_schedule_policy_vm_stop_schedule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `time_zone`
- Description: (Required) Specifies the time zone to be used in interpreting the schedule. The value of this field must be a time zone name from the tz database: http://en.wikipedia.org/wiki/Tz_database.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Optional) The start time of the schedule. The timestamp is an RFC3339 string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expiration_time`
- Description: (Optional) The expiration time of the schedule. The timestamp is an RFC3339 string. <a name="nested_instance_schedule_policy_vm_start_schedule"></a>The `vm_start_schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule`
- Description: (Required) Specifies the frequency for the operation, using the unix-cron format. <a name="nested_instance_schedule_policy_vm_stop_schedule"></a>The `vm_stop_schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `schedule`
- Description: (Required) Specifies the frequency for the operation, using the unix-cron format. <a name="nested_disk_consistency_group_policy"></a>The `disk_consistency_group_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) Enable disk consistency on the resource policy. <a name="nested_workload_policy"></a>The `workload_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) The type of workload policy. Possible values are: `HIGH_AVAILABILITY`, `HIGH_THROUGHPUT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_topology_distance`
- Description: (Optional) The maximum topology distance. This field can be set only when the workload policy type is HIGH_THROUGHPUT and cannot be set if accelerator topology is set. Possible values are: `BLOCK`, `CLUSTER`, `SUBBLOCK`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_topology`
- Description: (Optional) The accelerator topology. This field can be set only when the workload policy type is HIGH_THROUGHPUT and cannot be set if max topology distance is set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
