## 🛡️ Policy Deployment Engine: `compute_reservation`

This section provides a concise policy evaluation for the `compute_reservation` resource in GCP.

Reference: [Terraform Registry – compute_reservation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_reservation)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])?` which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash. | true | None | None |
| `zone` | The zone where the reservation is made. | true | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `specific_reservation_required` | When set to true, only VMs that target this reservation by name can consume this reservation. Otherwise, it can be consumed by VMs with affinity for any reservation. Defaults to false. | false | None | None |
| `delete_at_time` | Absolute time in future when the reservation will be auto-deleted by Compute Engine. Timestamp is represented in RFC3339 text format. Cannot be used with delete_after_duration. | false | None | None |
| `enable_emergent_maintenance` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Indicates if this group of VMs have emergent maintenance enabled. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### specific_reservation Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `count` | The number of resources that are allocated. | true | None | None |
| `in_use_count` | (Output) How many instances are in use. | none | None | None |
| `instance_properties` | The instance properties for the reservation. Structure is [documented below](#nested_specific_reservation_instance_properties). | false | None | None |
| `source_instance_template` | Specifies the instance template to create the reservation. If you use this field, you must exclude the instanceProperties field. | false | None | None |

### share_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `share_type` | Type of sharing for this shared-reservation Possible values are: `LOCAL`, `SPECIFIC_PROJECTS`. | false | None | None |
| `project_map` | A map of project number and project config. This is only valid when shareType's value is SPECIFIC_PROJECTS. Structure is [documented below](#nested_share_settings_project_map). | false | None | None |
| `projects` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) List of project IDs with which the reservation is shared. | false | None | None |

### delete_after_duration Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `seconds` | Number of seconds for the auto-delete duration. | false | None | None |
| `nanos` | Number of nanoseconds for the auto-delete duration. | false | None | None |

### reservation_sharing_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_share_type` | Sharing config for all Google Cloud services. Possible values are: `ALLOW_ALL`, `DISALLOW_ALL`. | false | None | None |

### instance_properties Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `machine_type` | The name of the machine type to reserve. | true | None | None |
| `min_cpu_platform` | The minimum CPU platform for the reservation. For example, `"Intel Skylake"`. See the CPU platform availability reference](https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform#availablezones) for information on available CPU platforms. | false | None | None |
| `guest_accelerators` | Guest accelerator type and count. Structure is [documented below](#nested_specific_reservation_instance_properties_guest_accelerators). | false | None | None |
| `local_ssds` | The amount of local ssd to reserve with each instance. This reserves disks of type `local-ssd`. Structure is [documented below](#nested_specific_reservation_instance_properties_local_ssds). | false | None | None |
| `maintenance_interval` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Specifies the frequency of planned maintenance events. Possible values are: `AS_NEEDED`, `PERIODIC`, `RECURRENT`. | false | None | None |

### guest_accelerators Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `accelerator_type` | The full or partial URL of the accelerator type to attach to this instance. For example: `projects/my-project/zones/us-central1-c/acceleratorTypes/nvidia-tesla-p100` If you are creating an instance template, specify only the accelerator name. | true | None | None |
| `accelerator_count` | The number of the guest accelerator cards exposed to this instance. | true | None | None |

### local_ssds Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `interface` | The disk interface to use for attaching this disk. Default value is `SCSI`. Possible values are: `SCSI`, `NVME`. | false | None | None |
| `disk_size_gb` | The size of the disk in base-2 GB. | true | None | None |

### project_map Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id` |  | none | None | None |
| `project_id` | The project id/number, should be same as the key of this project config in the project map. | false | None | None |
