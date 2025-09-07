## 🛡️ Policy Deployment Engine: `workstations_workstation_config`

This section provides a concise policy evaluation for the `workstations_workstation_config` resource in GCP.

Reference: [Terraform Registry – workstations_workstation_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workstations_workstation_config)

---

## 1. Argument Reference

### `workstation_config_id`
- Description: (Required) The ID to be assigned to the workstation cluster config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workstation_cluster_id`
- Description: (Required) The ID of the parent workstation cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location where the workstation cluster config should reside.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Human-readable name for this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Client-specified labels that are applied to the resource and that are also propagated to the underlying Compute Engine resources. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Client-specified annotations. This is distinct from labels. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `idle_timeout`
- Description: (Optional) How long to wait before automatically stopping an instance that hasn't recently received any user traffic. A value of 0 indicates that this instance should never time out from idleness. Defaults to 20 minutes. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `running_timeout`
- Description: (Optional) How long to wait before automatically stopping a workstation after it was started. A value of 0 indicates that workstations using this configuration should never time out from running duration. Must be greater than 0 and less than 24 hours if `encryption_key` is set. Defaults to 12 hours. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replica_zones`
- Description: (Optional) Specifies the zones used to replicate the VM and disk resources within the region. If set, exactly two zones within the workstation cluster's region must be specified—for example, `['us-central1-a', 'us-central1-f']`. If this field is empty, two default zones within the region are used. Immutable after the workstation configuration is created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_audit_agent`
- Description: (Optional) Whether to enable Linux `auditd` logging on the workstation. When enabled, a service account must also be specified that has `logging.buckets.write` permission on the project. Operating system audit logging is distinct from Cloud Audit Logs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host`
- Description: (Optional) Runtime host for a workstation. Structure is [documented below](#nested_host).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `persistent_directories`
- Description: (Optional) Directories to persist across workstation sessions. Structure is [documented below](#nested_persistent_directories).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ephemeral_directories`
- Description: (Optional) Ephemeral directories which won't persist across workstation sessions. Structure is [documented below](#nested_ephemeral_directories).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `container`
- Description: (Optional) Container that will be run for each workstation using this configuration when that workstation is started. Structure is [documented below](#nested_container).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_key`
- Description: (Optional) Encrypts resources of this workstation configuration using a customer-managed encryption key. If specified, the boot disk of the Compute Engine instance and the persistent disk are encrypted using this encryption key. If this field is not set, the disks are encrypted using a generated key. Customer-managed encryption keys do not protect disk metadata. If the customer-managed encryption key is rotated, when the workstation instance is stopped, the system attempts to recreate the persistent disk with the new version of the key. Be sure to keep older versions of the key until the persistent disk is recreated. Otherwise, data on the persistent disk will be lost. If the encryption key is revoked, the workstation session will automatically be stopped within 7 hours. Structure is [documented below](#nested_encryption_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `readiness_checks`
- Description: (Optional) Readiness checks to be performed on a workstation. Structure is [documented below](#nested_readiness_checks).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_tcp_connections`
- Description: (Optional) Disables support for plain TCP connections in the workstation. By default the service supports TCP connections via a websocket relay. Setting this option to true disables that relay, which prevents the usage of services that require plain tcp connections, such as ssh. When enabled, all communication must occur over https or wss.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_usable_workstations`
- Description: (Optional) Maximum number of workstations under this configuration a user can have workstations.workstation.use permission on. Only enforced on CreateWorkstation API calls on the user issuing the API request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_ports`
- Description: (Optional) A list of port ranges specifying single ports or ranges of ports that are externally accessible in the workstation. Allowed ports must be one of 22, 80, or within range 1024-65535. If not specified defaults to ports 22, 80, and ports 1024-65535. Structure is [documented below](#nested_allowed_ports).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_host"></a>The `host` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gce_instance`
- Description: (Optional) A runtime using a Compute Engine instance. Structure is [documented below](#nested_host_gce_instance). <a name="nested_host_gce_instance"></a>The `gce_instance` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: (Optional) The name of a Compute Engine machine type.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) Email address of the service account that will be used on VM instances used to support this config. This service account must have permission to pull the specified container image. If not set, VMs will run without a service account, in which case the image must be publicly accessible.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_scopes`
- Description: (Optional) Scopes to grant to the service_account. Various scopes are automatically added based on feature usage. When specified, users of workstations under this configuration must have `iam.serviceAccounts.actAs` on the service account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pool_size`
- Description: (Optional) Number of instances to pool for faster workstation startup.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot_disk_size_gb`
- Description: (Optional) Size of the boot disk in GB.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) Network tags to add to the Compute Engine machines backing the Workstations.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_public_ip_addresses`
- Description: (Optional) Whether instances have no public IP address.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_ssh`
- Description: (Optional) Whether to disable SSH access to the VM.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_nested_virtualization`
- Description: (Optional) Whether to enable nested virtualization on the Compute Engine VMs backing the Workstations. See https://cloud.google.com/workstations/docs/reference/rest/v1beta/projects.locations.workstationClusters.workstationConfigs#GceInstance.FIELDS.enable_nested_virtualization
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shielded_instance_config`
- Description: (Optional) A set of Compute Engine Shielded instance options. Structure is [documented below](#nested_host_gce_instance_shielded_instance_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `confidential_instance_config`
- Description: (Optional) A set of Compute Engine Confidential VM instance options. Structure is [documented below](#nested_host_gce_instance_confidential_instance_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerators`
- Description: (Optional) An accelerator card attached to the instance. Structure is [documented below](#nested_host_gce_instance_accelerators).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boost_configs`
- Description: (Optional) A list of the boost configurations that workstations created using this workstation configuration are allowed to use. Structure is [documented below](#nested_host_gce_instance_boost_configs).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vm_tags`
- Description: (Optional) Resource manager tags to be bound to the VM instances backing the Workstations. Tag keys and values have the same definition as https://cloud.google.com/resource-manager/docs/tags/tags-overview Keys must be in the format `tagKeys/{tag_key_id}`, and values are in the format `tagValues/456`. <a name="nested_host_gce_instance_shielded_instance_config"></a>The `shielded_instance_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_secure_boot`
- Description: (Optional) Whether the instance has Secure Boot enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_vtpm`
- Description: (Optional) Whether the instance has the vTPM enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_integrity_monitoring`
- Description: (Optional) Whether the instance has integrity monitoring enabled. <a name="nested_host_gce_instance_confidential_instance_config"></a>The `confidential_instance_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_confidential_compute`
- Description: (Optional) Whether the instance has confidential compute enabled. <a name="nested_host_gce_instance_accelerators"></a>The `accelerators` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) Type of accelerator resource to attach to the instance, for example, "nvidia-tesla-p100".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `count`
- Description: (Required) Number of accelerator cards exposed to the instance. <a name="nested_host_gce_instance_boost_configs"></a>The `boost_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id`
- Description: (Required) The id to be used for the boost config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: (Optional) The type of machine that boosted VM instances will use—for example, e2-standard-4. For more information about machine types that Cloud Workstations supports, see the list of available machine types https://cloud.google.com/workstations/docs/available-machine-types. Defaults to e2-standard-4.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot_disk_size_gb`
- Description: (Optional) Size of the boot disk in GB. The minimum boot disk size is `30` GB. Defaults to `50` GB.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_nested_virtualization`
- Description: (Optional) Whether to enable nested virtualization on the Compute Engine VMs backing boosted Workstations. See https://cloud.google.com/workstations/docs/reference/rest/v1beta/projects.locations.workstationClusters.workstationConfigs#GceInstance.FIELDS.enable_nested_virtualization
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `pool_size`
- Description: (Optional) Number of instances to pool for faster workstation boosting.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `accelerators`
- Description: (Optional) An accelerator card attached to the boost instance. Structure is [documented below](#nested_host_gce_instance_boost_configs_boost_configs_accelerators). <a name="nested_host_gce_instance_boost_configs_boost_configs_accelerators"></a>The `accelerators` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) Type of accelerator resource to attach to the instance, for example, "nvidia-tesla-p100".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `count`
- Description: (Required) Number of accelerator cards exposed to the instance. <a name="nested_persistent_directories"></a>The `persistent_directories` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mount_path`
- Description: (Optional) Location of this directory in the running workstation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gce_pd`
- Description: (Optional) A directory to persist across workstation sessions, backed by a Compute Engine regional persistent disk. Can only be updated if not empty during creation. Structure is [documented below](#nested_persistent_directories_persistent_directories_gce_pd). <a name="nested_persistent_directories_persistent_directories_gce_pd"></a>The `gce_pd` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fs_type`
- Description: (Optional) Type of file system that the disk should be formatted with. The workstation image must support this file system type. Must be empty if `sourceSnapshot` is set. Defaults to `ext4`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_type`
- Description: (Optional) The type of the persistent disk for the home directory. Defaults to `pd-standard`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `size_gb`
- Description: (Optional) The GB capacity of a persistent home directory for each workstation created with this configuration. Must be empty if `sourceSnapshot` is set. Valid values are `10`, `50`, `100`, `200`, `500`, or `1000`. Defaults to `200`. If less than `200` GB, the `diskType` must be `pd-balanced` or `pd-ssd`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reclaim_policy`
- Description: (Optional) Whether the persistent disk should be deleted when the workstation is deleted. Valid values are `DELETE` and `RETAIN`. Defaults to `DELETE`. Possible values are: `DELETE`, `RETAIN`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_snapshot`
- Description: (Optional) Name of the snapshot to use as the source for the disk. This can be the snapshot's `self_link`, `id`, or a string in the format of `projects/{project}/global/snapshots/{snapshot}`. If set, `sizeGb` and `fsType` must be empty. Can only be updated if it has an existing value. <a name="nested_ephemeral_directories"></a>The `ephemeral_directories` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mount_path`
- Description: (Optional) Location of this directory in the running workstation.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `gce_pd`
- Description: (Optional) An EphemeralDirectory backed by a Compute Engine persistent disk. Structure is [documented below](#nested_ephemeral_directories_ephemeral_directories_gce_pd). <a name="nested_ephemeral_directories_ephemeral_directories_gce_pd"></a>The `gce_pd` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_type`
- Description: (Optional) Type of the disk to use. Defaults to `"pd-standard"`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_snapshot`
- Description: (Optional) Name of the snapshot to use as the source for the disk. Must be empty if `sourceImage` is set. Must be empty if `read_only` is false. Updating `source_snapshot` will update content in the ephemeral directory after the workstation is restarted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_image`
- Description: (Optional) Name of the disk image to use as the source for the disk. Must be empty `sourceSnapshot` is set. Updating `sourceImage` will update content in the ephemeral directory after the workstation is restarted.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `read_only`
- Description: (Optional) Whether the disk is read only. If true, the disk may be shared by multiple VMs and `sourceSnapshot` must be set. <a name="nested_container"></a>The `container` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image`
- Description: (Optional) Docker image defining the container. This image must be accessible by the config's service account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `command`
- Description: (Optional) If set, overrides the default ENTRYPOINT specified by the image.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `args`
- Description: (Optional) Arguments passed to the entrypoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `working_dir`
- Description: (Optional) If set, overrides the default DIR specified by the image.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `env`
- Description: (Optional) Environment variables passed to the container. The elements are of the form "KEY=VALUE" for the environment variable "KEY" being given the value "VALUE".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `run_as_user`
- Description: (Optional) If set, overrides the USER specified in the image with the given uid. <a name="nested_encryption_key"></a>The `encryption_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key`
- Description: (Required) The name of the Google Cloud KMS encryption key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_service_account`
- Description: (Required) The service account to use with the specified KMS key. <a name="nested_readiness_checks"></a>The `readiness_checks` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `path`
- Description: (Required) Path to which the request should be sent.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Required) Port to which the request should be sent. <a name="nested_allowed_ports"></a>The `allowed_ports` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `first`
- Description: (Optional) Starting port number for the current range of ports. Valid ports are 22, 80, and ports within the range 1024-65535.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `last`
- Description: (Optional) Ending port number for the current range of ports. Valid ports are 22, 80, and ports within the range 1024-65535.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
