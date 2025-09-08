## 🛡️ Policy Deployment Engine: `compute_future_reservation`

This section provides a concise policy evaluation for the `compute_future_reservation` resource in GCP.

Reference: [Terraform Registry – compute_future_reservation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_future_reservation)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the las character, which cannot be a dash. | true | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `name_prefix` | Name prefix for the reservations to be created at the time of delivery. The name prefix must comply with RFC1035. Maximum allowed length for name prefix is 20. Automatically created reservations name format will be -date-####. | false | None | None |
| `planning_status` | Planning state before being submitted for evaluation Possible values are: `DRAFT`, `SUBMITTED`. | false | None | None |
| `auto_delete_auto_created_reservations` | Setting for enabling or disabling automatic deletion for auto-created reservation. If set to true, auto-created reservations will be deleted at Future Reservation's end time (default) or at user's defined timestamp if any of the [autoCreatedReservationsDeleteTime, autoCreatedReservationsDuration] values is specified. For keeping auto-created reservation indefinitely, this value should be set to false. | false | None | None |
| `specific_reservation_required` | Indicates whether the auto-created reservation can be consumed by VMs with affinity for "any" reservation. If the field is set, then only VMs that target the reservation by name can consume from the delivered reservation. | false | None | None |
| `reservation_name` | Name of reservations where the capacity is provisioned at the time of delivery of future reservations. If the reservation with the given name does not exist already, it is created automatically at the time of Approval with INACTIVE state till specified start-time. Either provide the reservationName or a namePrefix. | false | None | None |
| `deployment_type` | Type of the deployment requested as part of future reservation. Possible values are: `DENSE`, `FLEXIBLE`. | false | None | None |
| `reservation_mode` | The reservation mode which determines reservation-termination behavior and expected pricing. Possible values are: `CALENDAR`, `DEFAULT`. | false | None | None |
| `scheduling_type` | Maintenance information for this reservation Possible values are: `GROUPED`, `INDEPENDENT`. | false | None | None |
| `auto_created_reservations_delete_time` | Future timestamp when the FR auto-created reservations will be deleted by Compute Engine. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### time_window Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `start_time` | Start time of the future reservation in RFC3339 format. | true | None | None |
| `end_time` | End time of the future reservation in RFC3339 format. | false | None | None |
| `duration` | Duration of the future reservation Structure is [documented below](#nested_time_window_duration). | false | None | None |

### share_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `share_type` | Type of sharing for this future reservation. Possible values are: `LOCAL`, `SPECIFIC_PROJECTS`. | false | None | None |
| `projects` | list of Project names to specify consumer projects for this shared-reservation. This is only valid when shareType's value is SPECIFIC_PROJECTS. | false | None | None |
| `project_map` | A map of project id and project config. This is only valid when shareType's value is SPECIFIC_PROJECTS. Structure is [documented below](#nested_share_settings_project_map). | false | None | None |

### commitment_info Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `commitment_plan` | Indicates if a Commitment needs to be created as part of FR delivery. If this field is not present, then no commitment needs to be created. Possible values are: `INVALID`, `THIRTY_SIX_MONTH`, `TWELVE_MONTH`. | false | None | None |
| `commitment_name` | name of the commitment where capacity is being delivered to. | false | None | None |
| `previous_commitment_terms` | Only applicable if FR is delivering to the same reservation. If set, all parent commitments will be extended to match the end date of the plan for this commitment. Possible values are: `EXTEND`. | false | None | None |

### specific_sku_properties Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `instance_properties` | Properties of the SKU instances being reserved. Structure is [documented below](#nested_specific_sku_properties_instance_properties). | false | None | None |
| `total_count` | Total number of instances for which capacity assurance is requested at a future time period. | false | None | None |
| `source_instance_template` | The instance template that will be used to populate the ReservedInstanceProperties of the future reservation | false | None | None |

### auto_created_reservations_duration Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `seconds` | Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. | false | None | None |
| `nanos` | Span of time that's a fraction of a second at nanosecond resolution. Durations less than one second are represented with a 0 seconds field and a positive nanos field. Must be from 0 to 999,999,999 inclusive. | false | None | None |

### aggregate_reservation Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `vm_family` | The VM family that all instances scheduled against this reservation must belong to. Possible values are: `VM_FAMILY_CLOUD_TPU_DEVICE_CT3`, `VM_FAMILY_CLOUD_TPU_LITE_DEVICE_CT5L`, `VM_FAMILY_CLOUD_TPU_LITE_POD_SLICE_CT5LP`, `VM_FAMILY_CLOUD_TPU_LITE_POD_SLICE_CT6E`, `VM_FAMILY_CLOUD_TPU_POD_SLICE_CT3P`, `VM_FAMILY_CLOUD_TPU_POD_SLICE_CT4P`, `VM_FAMILY_CLOUD_TPU_POD_SLICE_CT5P`. | false | None | None |
| `reserved_resources` | futureReservations.list of reserved resources (CPUs, memory, accelerators). Structure is [documented below](#nested_aggregate_reservation_reserved_resources). | true | None | None |
| `workload_type` | The workload type of the instances that will target this reservation. Possible values are: `BATCH`, `SERVING`, `UNSPECIFIED`. | false | None | None |

### duration Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `seconds` | Span of time at a resolution of a second. Must be from 0 to 315,576,000,000 inclusive. | false | None | None |
| `nanos` | Span of time that's a fraction of a second at nanosecond resolution. | false | None | None |

### project_map Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` |  | none | None | None |
| `project_id` | The project ID, should be same as the key of this project config in the parent map. | false | None | None |

### instance_properties Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `machine_type` | Specifies type of machine (name only) which has fixed number of vCPUs and fixed amount of memory. This also includes specifying custom machine type following custom-NUMBER_OF_CPUS-AMOUNT_OF_MEMORY pattern. | false | None | None |
| `guest_accelerators` | Specifies accelerator type and count. Structure is [documented below](#nested_specific_sku_properties_instance_properties_guest_accelerators). | false | None | None |
| `min_cpu_platform` | Minimum cpu platform the reservation. | false | None | None |
| `local_ssds` | Specifies amount of local ssd to reserve with each instance. The type of disk is local-ssd. Structure is [documented below](#nested_specific_sku_properties_instance_properties_local_ssds). | false | None | None |
| `maintenance_freeze_duration_hours` | Specifies the number of hours after reservation creation where instances using the reservation won't be scheduled for maintenance. | false | None | None |
| `location_hint` | An opaque location hint used to place the allocation close to other resources. This field is for use by internal tools that use the public API. | false | None | None |
| `maintenance_interval` | Specifies the frequency of planned maintenance events. The accepted values are: PERIODIC Possible values are: `PERIODIC`. | false | None | None |

### guest_accelerators Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `accelerator_type` | Full or partial URL of the accelerator type resource to attach to this instance. | false | None | None |
| `accelerator_count` | The number of the guest accelerator cards exposed to this instance. | false | None | None |

### local_ssds Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disk_size_gb` | Specifies the size of the disk in base-2 GB. | false | None | None |
| `interface` | Specifies the disk interface to use for attaching this disk, which is either SCSI or NVME. The default is SCSI. Possible values are: `SCSI`, `NVME`. | false | None | None |

### reserved_resources Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `accelerator` | Properties of accelerator resources in this reservation. Structure is [documented below](#nested_aggregate_reservation_reserved_resources_reserved_resources_accelerator). | false | None | None |

### accelerator Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `accelerator_count` | Number of accelerators of specified type. | false | None | None |
| `accelerator_type` | Full or partial URL to accelerator type. e.g. "projects/{PROJECT}/zones/{ZONE}/acceleratorTypes/ct4l" | false | None | None |
