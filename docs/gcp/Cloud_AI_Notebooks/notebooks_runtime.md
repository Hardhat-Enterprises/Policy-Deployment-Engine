## 🛡️ Policy Deployment Engine: `notebooks_runtime`

This section provides a concise policy evaluation for the `notebooks_runtime` resource in GCP.

Reference: [Terraform Registry – notebooks_runtime](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/notebooks_runtime)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name specified for the Notebook runtime.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) A reference to the zone where the machine resides.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `virtual_machine`
- Description: (Optional) Use a Compute Engine VM image to start the managed notebook instance. Structure is [documented below](#nested_virtual_machine).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_config`
- Description: (Optional) The config settings for accessing runtime. Structure is [documented below](#nested_access_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `software_config`
- Description: (Optional) The config settings for software inside the runtime. Structure is [documented below](#nested_software_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels to associate with this runtime. Label **keys** must contain 1 to 63 characters, and must conform to [RFC 1035] (https://www.ietf.org/rfc/rfc1035.txt). Label **values** may be empty, but, if present, must contain 1 to 63 characters, and must conform to [RFC 1035](https://www.ietf.org/rfc/rfc1035.txt). No more than 32 labels can be associated with a cluster. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_virtual_machine"></a>The `virtual_machine` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_name`
- Description: (Output) The user-friendly name of the Managed Compute Engine instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_id`
- Description: (Output) The unique identifier of the Managed Compute Engine instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `virtual_machine_config`
- Description: (Optional) Virtual Machine configuration settings. Structure is [documented below](#nested_virtual_machine_virtual_machine_config). <a name="nested_virtual_machine_virtual_machine_config"></a>The `virtual_machine_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Output) The zone where the virtual machine is located.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: (Required) The Compute Engine machine type used for runtimes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_disk`
- Description: (Required) Data disk option configuration settings. Structure is [documented below](#nested_virtual_machine_virtual_machine_config_data_disk).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container_images`
- Description: (Optional) Use a list of container images to start the notebook instance. Structure is [documented below](#nested_virtual_machine_virtual_machine_config_container_images).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_config`
- Description: (Optional) Encryption settings for virtual machine data disk. Structure is [documented below](#nested_virtual_machine_virtual_machine_config_encryption_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shielded_instance_config`
- Description: (Optional) Shielded VM Instance configuration settings. Structure is [documented below](#nested_virtual_machine_virtual_machine_config_shielded_instance_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerator_config`
- Description: (Optional) The Compute Engine accelerator configuration for this runtime. Structure is [documented below](#nested_virtual_machine_virtual_machine_config_accelerator_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional) The Compute Engine network to be used for machine communications. Cannot be specified with subnetwork. If neither `network` nor `subnet` is specified, the "default" network of the project is used, if it exists. A full URL or partial URI. Examples:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnet`
- Description: (Optional) The Compute Engine subnetwork to be used for machine communications. Cannot be specified with network. A full URL or partial URI are valid. Examples:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `internal_ip_only`
- Description: (Optional) If true, runtime will only have internal IP addresses. By default, runtimes are not restricted to internal IP addresses, and will have ephemeral external IP addresses assigned to each vm. This `internal_ip_only` restriction can only be enabled for subnetwork enabled networks, and all dependencies must be configured to be accessible without external IP addresses.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) The Compute Engine tags to add to runtime (see [Tagging instances] (https://cloud.google.com/compute/docs/ label-or-tag-resources#tags)).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `guest_attributes`
- Description: (Output) The Compute Engine guest attributes. (see [Project and instance guest attributes](https://cloud.google.com/compute/docs/ storing-retrieving-metadata#guest_attributes)).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: (Optional) The Compute Engine metadata entries to add to virtual machine. (see [Project and instance metadata](https://cloud.google.com /compute/docs/storing-retrieving-metadata#project_and_instance _metadata)).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The labels to associate with this runtime. Label **keys** must contain 1 to 63 characters, and must conform to [RFC 1035] (https://www.ietf.org/rfc/rfc1035.txt). Label **values** may be empty, but, if present, must contain 1 to 63 characters, and must conform to [RFC 1035](https://www.ietf.org/rfc/rfc1035.txt). No more than 32 labels can be associated with a cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nic_type`
- Description: (Optional) The type of vNIC to be used on this interface. This may be gVNIC or VirtioNet. Possible values are: `UNSPECIFIED_NIC_TYPE`, `VIRTIO_NET`, `GVNIC`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reserved_ip_range`
- Description: (Optional) Reserved IP Range name is used for VPC Peering. The subnetwork allocation will use the range *name* if it's assigned. <a name="nested_virtual_machine_virtual_machine_config_data_disk"></a>The `data_disk` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_delete`
- Description: (Output) Optional. Specifies whether the disk will be auto-deleted when the instance is deleted (but not when the disk is detached from the instance).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot`
- Description: (Output) Optional. Indicates that this is a boot disk. The virtual machine will use the first partition of the disk for its root filesystem.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `device_name`
- Description: (Output) Optional. Specifies a unique device name of your choice that is reflected into the /dev/disk/by-id/google-* tree of a Linux operating system running within the instance. This name can be used to reference the device for mounting, resizing, and so on, from within the instance. If not specified, the server chooses a default device name to apply to this disk, in the form persistent-disk-x, where x is a number assigned by Google Compute Engine. This field is only applicable for persistent disks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `guest_os_features`
- Description: (Output) Indicates a list of features to enable on the guest operating system. Applicable only for bootable images. To see a list of available features, read `https://cloud.google.com/compute/docs/ images/create-delete-deprecate-private-images#guest-os-features` options. ``
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `index`
- Description: (Output) Output only. A zero-based index to this disk, where 0 is reserved for the boot disk. If you have many disks attached to an instance, each disk would have a unique index number.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `initialize_params`
- Description: (Optional) Input only. Specifies the parameters for a new disk that will be created alongside the new instance. Use initialization parameters to create boot disks or local SSDs attached to the new instance. This property is mutually exclusive with the source property; you can only define one or the other, but not both. Structure is [documented below](#nested_virtual_machine_virtual_machine_config_data_disk_initialize_params).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interface`
- Description: (Optional) "Specifies the disk interface to use for attaching this disk, which is either SCSI or NVME. The default is SCSI. Persistent disks must always use SCSI and the request will fail if you attempt to attach a persistent disk in any other format than SCSI. Local SSDs can use either NVME or SCSI. For performance characteristics of SCSI over NVMe, see Local SSD performance. Valid values: * NVME * SCSI".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kind`
- Description: (Output) Type of the resource. Always compute#attachedDisk for attached disks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `licenses`
- Description: (Output) Output only. Any valid publicly visible licenses.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: (Optional) The mode in which to attach this disk, either READ_WRITE or READ_ONLY. If not specified, the default is to attach the disk in READ_WRITE mode.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source`
- Description: (Optional) Specifies a valid partial or full URL to an existing Persistent Disk resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) Specifies the type of the disk, either SCRATCH or PERSISTENT. If not specified, the default is PERSISTENT. <a name="nested_virtual_machine_virtual_machine_config_data_disk_initialize_params"></a>The `initialize_params` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Provide this property when creating the disk.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_name`
- Description: (Optional) Specifies the disk name. If not specified, the default is to use the name of the instance. If the disk with the instance name exists already in the given zone/region, a new name will be automatically generated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_size_gb`
- Description: (Optional) Specifies the size of the disk in base-2 GB. If not specified, the disk will be the same size as the image (usually 10GB). If specified, the size must be equal to or larger than 10GB. Default 100 GB.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_type`
- Description: (Optional) The type of the boot disk attached to this runtime, defaults to standard persistent disk. For valid values, see `https://cloud.google.com/vertex-ai/docs/workbench/ reference/rest/v1/projects.locations.runtimes#disktype`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels to apply to this disk. These can be later modified by the disks.setLabels method. This field is only applicable for persistent disks. <a name="nested_virtual_machine_virtual_machine_config_container_images"></a>The `container_images` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository`
- Description: (Required) The path to the container image repository. For example: gcr.io/{project_id}/{imageName}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag`
- Description: (Optional) The tag of the container image. If not specified, this defaults to the latest tag. <a name="nested_virtual_machine_virtual_machine_config_encryption_config"></a>The `encryption_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Optional) The Cloud KMS resource identifier of the customer-managed encryption key used to protect a resource, such as a disks. It has the following format: `projects/{PROJECT_ID}/locations/{REGION}/keyRings/ {KEY_RING_NAME}/cryptoKeys/{KEY_NAME}` <a name="nested_virtual_machine_virtual_machine_config_shielded_instance_config"></a>The `shielded_instance_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_secure_boot`
- Description: (Optional) Defines whether the instance has Secure Boot enabled.Secure Boot helps ensure that the system only runs authentic software by verifying the digital signature of all boot components, and halting the boot process if signature verification fails. Disabled by default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_vtpm`
- Description: (Optional) Defines whether the instance has the vTPM enabled. Enabled by default.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_integrity_monitoring`
- Description: (Optional) Defines whether the instance has integrity monitoring enabled. Enables monitoring and attestation of the boot integrity of the instance. The attestation is performed against the integrity policy baseline. This baseline is initially derived from the implicitly trusted boot image when the instance is created. Enabled by default. <a name="nested_virtual_machine_virtual_machine_config_accelerator_config"></a>The `accelerator_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) Accelerator model. For valid values, see `https://cloud.google.com/vertex-ai/docs/workbench/reference/ rest/v1/projects.locations.runtimes#AcceleratorType`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `core_count`
- Description: (Optional) Count of cores of this accelerator. <a name="nested_access_config"></a>The `access_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_type`
- Description: (Optional) The type of access mode this instance. For valid values, see `https://cloud.google.com/vertex-ai/docs/workbench/reference/ rest/v1/projects.locations.runtimes#RuntimeAccessType`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `runtime_owner`
- Description: (Optional) The owner of this runtime after creation. Format: `alias@example.com`. Currently supports one owner only.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `proxy_uri`
- Description: (Output) The proxy endpoint that is used to access the runtime. <a name="nested_software_config"></a>The `software_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `notebook_upgrade_schedule`
- Description: (Optional) Cron expression in UTC timezone for schedule instance auto upgrade. Please follow the [cron format](https://en.wikipedia.org/wiki/Cron).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_health_monitoring`
- Description: (Optional) Verifies core internal services are running. Default: True.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `idle_shutdown`
- Description: (Optional) Runtime will automatically shutdown after idle_shutdown_time. Default: True
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `idle_shutdown_timeout`
- Description: (Optional) Time in minutes to wait before shuting down runtime. Default: 180 minutes
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `install_gpu_driver`
- Description: (Optional) Install Nvidia Driver automatically.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `upgradeable`
- Description: (Output) Bool indicating whether an newer image is available in an image family.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `custom_gpu_driver_path`
- Description: (Optional) Specify a custom Cloud Storage path where the GPU driver is stored. If not specified, we'll automatically choose from official GPU drivers.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `post_startup_script`
- Description: (Optional) Path to a Bash script that automatically runs after a notebook instance fully boots up. The path must be a URL or Cloud Storage path (gs://path-to-file/file-name).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `post_startup_script_behavior`
- Description: (Optional) Behavior for the post startup script. Possible values are: `POST_STARTUP_SCRIPT_BEHAVIOR_UNSPECIFIED`, `RUN_EVERY_START`, `DOWNLOAD_AND_RUN_EVERY_START`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kernels`
- Description: (Optional) Use a list of container images to use as Kernels in the notebook instance. Structure is [documented below](#nested_software_config_kernels). <a name="nested_software_config_kernels"></a>The `kernels` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `repository`
- Description: (Required) The path to the container image repository. For example: gcr.io/{project_id}/{imageName}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tag`
- Description: (Optional) The tag of the container image. If not specified, this defaults to the latest tag.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
