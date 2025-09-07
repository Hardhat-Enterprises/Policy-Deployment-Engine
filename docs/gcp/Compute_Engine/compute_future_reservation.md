## 🛡️ Policy Deployment Engine: `compute_future_reservation`

This section provides a concise policy evaluation for the `compute_future_reservation` resource in GCP.

Reference: [Terraform Registry – compute_future_reservation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_future_reservation)

---

## 1. Argument Reference

### `time_window`
- Description: (Required) Time window for this Future Reservation. Structure is [documented below](#nested_time_window).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the las character, which cannot be a dash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `share_settings`
- Description: (Optional) Settings for sharing the future reservation Structure is [documented below](#nested_share_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name_prefix`
- Description: (Optional) Name prefix for the reservations to be created at the time of delivery. The name prefix must comply with RFC1035. Maximum allowed length for name prefix is 20. Automatically created reservations name format will be -date-####.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `planning_status`
- Description: (Optional) Planning state before being submitted for evaluation Possible values are: `DRAFT`, `SUBMITTED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_delete_auto_created_reservations`
- Description: (Optional) Setting for enabling or disabling automatic deletion for auto-created reservation. If set to true, auto-created reservations will be deleted at Future Reservation's end time (default) or at user's defined timestamp if any of the [autoCreatedReservationsDeleteTime, autoCreatedReservationsDuration] values is specified. For keeping auto-created reservation indefinitely, this value should be set to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `specific_reservation_required`
- Description: (Optional) Indicates whether the auto-created reservation can be consumed by VMs with affinity for "any" reservation. If the field is set, then only VMs that target the reservation by name can consume from the delivered reservation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reservation_name`
- Description: (Optional) Name of reservations where the capacity is provisioned at the time of delivery of future reservations. If the reservation with the given name does not exist already, it is created automatically at the time of Approval with INACTIVE state till specified start-time. Either provide the reservationName or a namePrefix.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deployment_type`
- Description: (Optional) Type of the deployment requested as part of future reservation. Possible values are: `DENSE`, `FLEXIBLE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reservation_mode`
- Description: (Optional) The reservation mode which determines reservation-termination behavior and expected pricing. Possible values are: `CALENDAR`, `DEFAULT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `commitment_info`
- Description: (Optional) If not present, then FR will not deliver a new commitment or update an existing commitment. Structure is [documented below](#nested_commitment_info).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scheduling_type`
- Description: (Optional) Maintenance information for this reservation Possible values are: `GROUPED`, `INDEPENDENT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `specific_sku_properties`
- Description: (Optional) Future Reservation configuration to indicate instance properties and total count. Structure is [documented below](#nested_specific_sku_properties).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_created_reservations_delete_time`
- Description: (Optional) Future timestamp when the FR auto-created reservations will be deleted by Compute Engine.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_created_reservations_duration`
- Description: (Optional) Specifies the duration of auto-created reservations. It represents relative time to future reservation startTime when auto-created reservations will be automatically deleted by Compute Engine. Duration time unit is represented as a count of seconds and fractions of seconds at nanosecond resolution. Structure is [documented below](#nested_auto_created_reservations_duration).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `aggregate_reservation`
- Description: (Optional) Aggregate reservation details for the future reservation. Structure is [documented below](#nested_aggregate_reservation).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_time_window"></a>The `time_window` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Required) Start time of the future reservation in RFC3339 format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `end_time`
- Description: (Optional) End time of the future reservation in RFC3339 format.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `duration`
- Description: (Optional) Duration of the future reservation Structure is [documented below](#nested_time_window_duration). <a name="nested_time_window_duration"></a>The `duration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. <a name="nested_share_settings"></a>The `share_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `share_type`
- Description: (Optional) Type of sharing for this future reservation. Possible values are: `LOCAL`, `SPECIFIC_PROJECTS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `projects`
- Description: (Optional) list of Project names to specify consumer projects for this shared-reservation. This is only valid when shareType's value is SPECIFIC_PROJECTS.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_map`
- Description: (Optional) A map of project id and project config. This is only valid when shareType's value is SPECIFIC_PROJECTS. Structure is [documented below](#nested_share_settings_project_map). <a name="nested_share_settings_project_map"></a>The `project_map` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project_id`
- Description: (Optional) The project ID, should be same as the key of this project config in the parent map. <a name="nested_commitment_info"></a>The `commitment_info` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `commitment_plan`
- Description: (Optional) Indicates if a Commitment needs to be created as part of FR delivery. If this field is not present, then no commitment needs to be created. Possible values are: `INVALID`, `THIRTY_SIX_MONTH`, `TWELVE_MONTH`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `commitment_name`
- Description: (Optional) name of the commitment where capacity is being delivered to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `previous_commitment_terms`
- Description: (Optional) Only applicable if FR is delivering to the same reservation. If set, all parent commitments will be extended to match the end date of the plan for this commitment. Possible values are: `EXTEND`. <a name="nested_specific_sku_properties"></a>The `specific_sku_properties` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_properties`
- Description: (Optional) Properties of the SKU instances being reserved. Structure is [documented below](#nested_specific_sku_properties_instance_properties).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `total_count`
- Description: (Optional) Total number of instances for which capacity assurance is requested at a future time period.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_instance_template`
- Description: (Optional) The instance template that will be used to populate the ReservedInstanceProperties of the future reservation <a name="nested_specific_sku_properties_instance_properties"></a>The `instance_properties` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: (Optional) Specifies type of machine (name only) which has fixed number of vCPUs and fixed amount of memory. This also includes specifying custom machine type following custom-NUMBER_OF_CPUS-AMOUNT_OF_MEMORY pattern.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `guest_accelerators`
- Description: (Optional) Specifies accelerator type and count. Structure is [documented below](#nested_specific_sku_properties_instance_properties_guest_accelerators).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_cpu_platform`
- Description: (Optional) Minimum cpu platform the reservation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_ssds`
- Description: (Optional) Specifies amount of local ssd to reserve with each instance. The type of disk is local-ssd. Structure is [documented below](#nested_specific_sku_properties_instance_properties_local_ssds).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_freeze_duration_hours`
- Description: (Optional) Specifies the number of hours after reservation creation where instances using the reservation won't be scheduled for maintenance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location_hint`
- Description: (Optional) An opaque location hint used to place the allocation close to other resources. This field is for use by internal tools that use the public API.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_interval`
- Description: (Optional) Specifies the frequency of planned maintenance events. The accepted values are: PERIODIC Possible values are: `PERIODIC`. <a name="nested_specific_sku_properties_instance_properties_guest_accelerators"></a>The `guest_accelerators` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_type`
- Description: (Optional) Full or partial URL of the accelerator type resource to attach to this instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_count`
- Description: (Optional) The number of the guest accelerator cards exposed to this instance. <a name="nested_specific_sku_properties_instance_properties_local_ssds"></a>The `local_ssds` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_size_gb`
- Description: (Optional) Specifies the size of the disk in base-2 GB.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interface`
- Description: (Optional) Specifies the disk interface to use for attaching this disk, which is either SCSI or NVME. The default is SCSI. Possible values are: `SCSI`, `NVME`. <a name="nested_auto_created_reservations_duration"></a>The `auto_created_reservations_duration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: (Optional) Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: (Optional) Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive. <a name="nested_aggregate_reservation"></a>The `aggregate_reservation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vm_family`
- Description: (Optional) The VM family that all instances scheduled against this reservation must belong to. Possible values are: `VM_FAMILY_CLOUD_TPU_DEVICE_CT3`, `VM_FAMILY_CLOUD_TPU_LITE_DEVICE_CT5L`, `VM_FAMILY_CLOUD_TPU_LITE_POD_SLICE_CT5LP`, `VM_FAMILY_CLOUD_TPU_LITE_POD_SLICE_CT6E`, `VM_FAMILY_CLOUD_TPU_POD_SLICE_CT3P`, `VM_FAMILY_CLOUD_TPU_POD_SLICE_CT4P`, `VM_FAMILY_CLOUD_TPU_POD_SLICE_CT5P`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reserved_resources`
- Description: (Required) futureReservations.list of reserved resources (CPUs, memory, accelerators). Structure is [documented below](#nested_aggregate_reservation_reserved_resources).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workload_type`
- Description: (Optional) The workload type of the instances that will target this reservation. Possible values are: `BATCH`, `SERVING`, `UNSPECIFIED`. <a name="nested_aggregate_reservation_reserved_resources"></a>The `reserved_resources` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator`
- Description: (Optional) Properties of accelerator resources in this reservation. Structure is [documented below](#nested_aggregate_reservation_reserved_resources_reserved_resources_accelerator). <a name="nested_aggregate_reservation_reserved_resources_reserved_resources_accelerator"></a>The `accelerator` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_count`
- Description: (Optional) Number of accelerators of specified type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_type`
- Description: (Optional) Full or partial URL to accelerator type. e.g. "projects/{PROJECT}/zones/{ZONE}/acceleratorTypes/ct4l"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
