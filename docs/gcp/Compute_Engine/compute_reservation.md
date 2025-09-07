## 🛡️ Policy Deployment Engine: `compute_reservation`

This section provides a concise policy evaluation for the `compute_reservation` resource in GCP.

Reference: [Terraform Registry – compute_reservation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_reservation)

---

## 1. Argument Reference

### `name`
- Description: (Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `specific_reservation`
- Description: (Required) Reservation for instances with specific machine shapes. Structure is [documented below](#nested_specific_reservation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Required) The zone where the reservation is made.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `specific_reservation_required`
- Description: (Optional) When set to true, only VMs that target this reservation by name can consume this reservation. Otherwise, it can be consumed by VMs with affinity for any reservation. Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `share_settings`
- Description: (Optional) The share setting for reservations. Structure is [documented below](#nested_share_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delete_at_time`
- Description: (Optional) Absolute time in future when the reservation will be auto-deleted by Compute Engine. Timestamp is represented in RFC3339 text format. Cannot be used with delete_after_duration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `delete_after_duration`
- Description: (Optional) Duration after which the reservation will be auto-deleted by Compute Engine. Cannot be used with delete_at_time. Structure is [documented below](#nested_delete_after_duration).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reservation_sharing_policy`
- Description: (Optional) Sharing policy for reservations with Google Cloud managed services. Structure is [documented below](#nested_reservation_sharing_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_emergent_maintenance`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Indicates if this group of VMs have emergent maintenance enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_specific_reservation"></a>The `specific_reservation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `count`
- Description: (Required) The number of resources that are allocated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `in_use_count`
- Description: (Output) How many instances are in use.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_properties`
- Description: (Optional) The instance properties for the reservation. Structure is [documented below](#nested_specific_reservation_instance_properties).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_instance_template`
- Description: (Optional) Specifies the instance template to create the reservation. If you use this field, you must exclude the instanceProperties field. <a name="nested_specific_reservation_instance_properties"></a>The `instance_properties` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: (Required) The name of the machine type to reserve.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_cpu_platform`
- Description: (Optional) The minimum CPU platform for the reservation. For example, `"Intel Skylake"`. See the CPU platform availability reference](https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform#availablezones) for information on available CPU platforms.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `guest_accelerators`
- Description: (Optional) Guest accelerator type and count. Structure is [documented below](#nested_specific_reservation_instance_properties_guest_accelerators).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_ssds`
- Description: (Optional) The amount of local ssd to reserve with each instance. This reserves disks of type `local-ssd`. Structure is [documented below](#nested_specific_reservation_instance_properties_local_ssds).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_interval`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Specifies the frequency of planned maintenance events. Possible values are: `AS_NEEDED`, `PERIODIC`, `RECURRENT`. <a name="nested_specific_reservation_instance_properties_guest_accelerators"></a>The `guest_accelerators` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_type`
- Description: (Required) The full or partial URL of the accelerator type to attach to this instance. For example: `projects/my-project/zones/us-central1-c/acceleratorTypes/nvidia-tesla-p100` If you are creating an instance template, specify only the accelerator name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_count`
- Description: (Required) The number of the guest accelerator cards exposed to this instance. <a name="nested_specific_reservation_instance_properties_local_ssds"></a>The `local_ssds` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interface`
- Description: (Optional) The disk interface to use for attaching this disk. Default value is `SCSI`. Possible values are: `SCSI`, `NVME`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_size_gb`
- Description: (Required) The size of the disk in base-2 GB. <a name="nested_share_settings"></a>The `share_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `share_type`
- Description: (Optional) Type of sharing for this shared-reservation Possible values are: `LOCAL`, `SPECIFIC_PROJECTS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_map`
- Description: (Optional) A map of project number and project config. This is only valid when shareType's value is SPECIFIC_PROJECTS. Structure is [documented below](#nested_share_settings_project_map).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `projects`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) List of project IDs with which the reservation is shared. <a name="nested_share_settings_project_map"></a>The `project_map` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) The project id/number, should be same as the key of this project config in the project map. <a name="nested_delete_after_duration"></a>The `delete_after_duration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Number of seconds for the auto-delete duration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Number of nanoseconds for the auto-delete duration. <a name="nested_reservation_sharing_policy"></a>The `reservation_sharing_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_share_type`
- Description: (Optional) Sharing config for all Google Cloud services. Possible values are: `ALLOW_ALL`, `DISALLOW_ALL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
