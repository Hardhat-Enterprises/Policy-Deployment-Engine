## 🛡️ Policy Deployment Engine: `notebooks_runtime`

This section provides a concise policy evaluation for the `notebooks_runtime` resource in GCP.

Reference: [Terraform Registry – notebooks_runtime](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/notebooks_runtime)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name specified for the Notebook runtime. | true | None | None |
| `location` | A reference to the zone where the machine resides. | true | None | None |
| `labels` | The labels to associate with this runtime. Label **keys** must contain 1 to 63 characters, and must conform to [RFC 1035] (https://www.ietf.org/rfc/rfc1035.txt). Label **values** may be empty, but, if present, must contain 1 to 63 characters, and must conform to [RFC 1035](https://www.ietf.org/rfc/rfc1035.txt). No more than 32 labels can be associated with a cluster. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### virtual_machine Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `instance_name` | (Output) The user-friendly name of the Managed Compute Engine instance. | none | None | None |
| `instance_id` | (Output) The unique identifier of the Managed Compute Engine instance. | none | None | None |
| `virtual_machine_config` | Virtual Machine configuration settings. Structure is [documented below](#nested_virtual_machine_virtual_machine_config). | false | None | None |

### access_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `access_type` | The type of access mode this instance. For valid values, see `https://cloud.google.com/vertex-ai/docs/workbench/reference/ rest/v1/projects.locations.runtimes#RuntimeAccessType`. | false | None | None |
| `runtime_owner` | The owner of this runtime after creation. Format: `alias@example.com`. Currently supports one owner only. | false | None | None |
| `proxy_uri` | (Output) The proxy endpoint that is used to access the runtime. | none | None | None |

### software_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `notebook_upgrade_schedule` | Cron expression in UTC timezone for schedule instance auto upgrade. Please follow the [cron format](https://en.wikipedia.org/wiki/Cron). | false | None | None |
| `enable_health_monitoring` | Verifies core internal services are running. Default: True. | false | None | None |
| `idle_shutdown` | Runtime will automatically shutdown after idle_shutdown_time. Default: True | false | None | None |
| `idle_shutdown_timeout` | Time in minutes to wait before shuting down runtime. Default: 180 minutes | false | None | None |
| `install_gpu_driver` | Install Nvidia Driver automatically. | false | None | None |
| `upgradeable` | (Output) Bool indicating whether an newer image is available in an image family. | none | None | None |
| `custom_gpu_driver_path` | Specify a custom Cloud Storage path where the GPU driver is stored. If not specified, we'll automatically choose from official GPU drivers. | false | None | None |
| `post_startup_script` | Path to a Bash script that automatically runs after a notebook instance fully boots up. The path must be a URL or Cloud Storage path (gs://path-to-file/file-name). | false | None | None |
| `post_startup_script_behavior` | Behavior for the post startup script. Possible values are: `POST_STARTUP_SCRIPT_BEHAVIOR_UNSPECIFIED`, `RUN_EVERY_START`, `DOWNLOAD_AND_RUN_EVERY_START`. | false | None | None |
| `kernels` | Use a list of container images to use as Kernels in the notebook instance. Structure is [documented below](#nested_software_config_kernels). | false | None | None |

### virtual_machine_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `zone` | (Output) The zone where the virtual machine is located. | none | None | None |
| `machine_type` | The Compute Engine machine type used for runtimes. | true | None | None |
| `data_disk` | Data disk option configuration settings. Structure is [documented below](#nested_virtual_machine_virtual_machine_config_data_disk). | true | None | None |
| `container_images` | Use a list of container images to start the notebook instance. Structure is [documented below](#nested_virtual_machine_virtual_machine_config_container_images). | false | None | None |
| `encryption_config` | Encryption settings for virtual machine data disk. Structure is [documented below](#nested_virtual_machine_virtual_machine_config_encryption_config). | false | None | None |
| `shielded_instance_config` | Shielded VM Instance configuration settings. Structure is [documented below](#nested_virtual_machine_virtual_machine_config_shielded_instance_config). | false | None | None |
| `accelerator_config` | The Compute Engine accelerator configuration for this runtime. Structure is [documented below](#nested_virtual_machine_virtual_machine_config_accelerator_config). | false | None | None |
| `network` | The Compute Engine network to be used for machine communications. Cannot be specified with subnetwork. If neither `network` nor `subnet` is specified, the "default" network of the project is used, if it exists. A full URL or partial URI. Examples: * `https://www.googleapis.com/compute/v1/projects/[project_id]/ regions/global/default` * `projects/[project_id]/regions/global/default` Runtimes are managed resources inside Google Infrastructure. Runtimes support the following network configurations: * Google Managed Network (Network & subnet are empty) * Consumer Project VPC (network & subnet are required). Requires configuring Private Service Access. * Shared VPC (network & subnet are required). Requires configuring Private Service Access. | false | None | None |
| `subnet` | The Compute Engine subnetwork to be used for machine communications. Cannot be specified with network. A full URL or partial URI are valid. Examples: * `https://www.googleapis.com/compute/v1/projects/[project_id]/ regions/us-east1/subnetworks/sub0` * `projects/[project_id]/regions/us-east1/subnetworks/sub0` | false | None | None |
| `internal_ip_only` | If true, runtime will only have internal IP addresses. By default, runtimes are not restricted to internal IP addresses, and will have ephemeral external IP addresses assigned to each vm. This `internal_ip_only` restriction can only be enabled for subnetwork enabled networks, and all dependencies must be configured to be accessible without external IP addresses. | false | None | None |
| `tags` | The Compute Engine tags to add to runtime (see [Tagging instances] (https://cloud.google.com/compute/docs/ label-or-tag-resources#tags)). | false | None | None |
| `guest_attributes` | (Output) The Compute Engine guest attributes. (see [Project and instance guest attributes](https://cloud.google.com/compute/docs/ storing-retrieving-metadata#guest_attributes)). | none | None | None |
| `metadata` | The Compute Engine metadata entries to add to virtual machine. (see [Project and instance metadata](https://cloud.google.com /compute/docs/storing-retrieving-metadata#project_and_instance _metadata)). | false | None | None |
| `labels` | The labels to associate with this runtime. Label **keys** must contain 1 to 63 characters, and must conform to [RFC 1035] (https://www.ietf.org/rfc/rfc1035.txt). Label **values** may be empty, but, if present, must contain 1 to 63 characters, and must conform to [RFC 1035](https://www.ietf.org/rfc/rfc1035.txt). No more than 32 labels can be associated with a cluster. | false | None | None |
| `nic_type` | The type of vNIC to be used on this interface. This may be gVNIC or VirtioNet. Possible values are: `UNSPECIFIED_NIC_TYPE`, `VIRTIO_NET`, `GVNIC`. | false | None | None |
| `reserved_ip_range` | Reserved IP Range name is used for VPC Peering. The subnetwork allocation will use the range *name* if it's assigned. | false | None | None |

### data_disk Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `auto_delete` | (Output) Optional. Specifies whether the disk will be auto-deleted when the instance is deleted (but not when the disk is detached from the instance). | none | None | None |
| `boot` | (Output) Optional. Indicates that this is a boot disk. The virtual machine will use the first partition of the disk for its root filesystem. | none | None | None |
| `device_name` | (Output) Optional. Specifies a unique device name of your choice that is reflected into the /dev/disk/by-id/google-* tree of a Linux operating system running within the instance. This name can be used to reference the device for mounting, resizing, and so on, from within the instance. If not specified, the server chooses a default device name to apply to this disk, in the form persistent-disk-x, where x is a number assigned by Google Compute Engine. This field is only applicable for persistent disks. | none | None | None |
| `guest_os_features` | (Output) Indicates a list of features to enable on the guest operating system. Applicable only for bootable images. To see a list of available features, read `https://cloud.google.com/compute/docs/ images/create-delete-deprecate-private-images#guest-os-features` options. `` | none | None | None |
| `index` | (Output) Output only. A zero-based index to this disk, where 0 is reserved for the boot disk. If you have many disks attached to an instance, each disk would have a unique index number. | none | None | None |
| `initialize_params` | Input only. Specifies the parameters for a new disk that will be created alongside the new instance. Use initialization parameters to create boot disks or local SSDs attached to the new instance. This property is mutually exclusive with the source property; you can only define one or the other, but not both. Structure is [documented below](#nested_virtual_machine_virtual_machine_config_data_disk_initialize_params). | false | None | None |
| `interface` | "Specifies the disk interface to use for attaching this disk, which is either SCSI or NVME. The default is SCSI. Persistent disks must always use SCSI and the request will fail if you attempt to attach a persistent disk in any other format than SCSI. Local SSDs can use either NVME or SCSI. For performance characteristics of SCSI over NVMe, see Local SSD performance. Valid values: * NVME * SCSI". | false | None | None |
| `kind` | (Output) Type of the resource. Always compute#attachedDisk for attached disks. | none | None | None |
| `licenses` | (Output) Output only. Any valid publicly visible licenses. | none | None | None |
| `mode` | The mode in which to attach this disk, either READ_WRITE or READ_ONLY. If not specified, the default is to attach the disk in READ_WRITE mode. | false | None | None |
| `source` | Specifies a valid partial or full URL to an existing Persistent Disk resource. | false | None | None |
| `type` | Specifies the type of the disk, either SCRATCH or PERSISTENT. If not specified, the default is PERSISTENT. | false | None | None |

### initialize_params Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `description` | Provide this property when creating the disk. | false | None | None |
| `disk_name` | Specifies the disk name. If not specified, the default is to use the name of the instance. If the disk with the instance name exists already in the given zone/region, a new name will be automatically generated. | false | None | None |
| `disk_size_gb` | Specifies the size of the disk in base-2 GB. If not specified, the disk will be the same size as the image (usually 10GB). If specified, the size must be equal to or larger than 10GB. Default 100 GB. | false | None | None |
| `disk_type` | The type of the boot disk attached to this runtime, defaults to standard persistent disk. For valid values, see `https://cloud.google.com/vertex-ai/docs/workbench/ reference/rest/v1/projects.locations.runtimes#disktype` | false | None | None |
| `labels` | Labels to apply to this disk. These can be later modified by the disks.setLabels method. This field is only applicable for persistent disks. | false | None | None |

### container_images Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `repository` | The path to the container image repository. For example: gcr.io/{project_id}/{imageName} | true | None | None |
| `tag` | The tag of the container image. If not specified, this defaults to the latest tag. | false | None | None |

### encryption_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key` | The Cloud KMS resource identifier of the customer-managed encryption key used to protect a resource, such as a disks. It has the following format: `projects/{PROJECT_ID}/locations/{REGION}/keyRings/ {KEY_RING_NAME}/cryptoKeys/{KEY_NAME}` | false | None | None |

### shielded_instance_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_secure_boot` | Defines whether the instance has Secure Boot enabled.Secure Boot helps ensure that the system only runs authentic software by verifying the digital signature of all boot components, and halting the boot process if signature verification fails. Disabled by default. | false | None | None |
| `enable_vtpm` | Defines whether the instance has the vTPM enabled. Enabled by default. | false | None | None |
| `enable_integrity_monitoring` | Defines whether the instance has integrity monitoring enabled. Enables monitoring and attestation of the boot integrity of the instance. The attestation is performed against the integrity policy baseline. This baseline is initially derived from the implicitly trusted boot image when the instance is created. Enabled by default. | false | None | None |

### accelerator_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Accelerator model. For valid values, see `https://cloud.google.com/vertex-ai/docs/workbench/reference/ rest/v1/projects.locations.runtimes#AcceleratorType` | false | None | None |
| `core_count` | Count of cores of this accelerator. | false | None | None |

### kernels Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `repository` | The path to the container image repository. For example: gcr.io/{project_id}/{imageName} | true | None | None |
| `tag` | The tag of the container image. If not specified, this defaults to the latest tag. | false | None | None |
