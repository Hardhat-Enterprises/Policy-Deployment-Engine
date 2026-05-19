## 🛡️ Policy Deployment Engine: `workstations_workstation_config`

This section provides a concise policy evaluation for the `workstations_workstation_config` resource in GCP.

Reference: [Terraform Registry – workstations_workstation_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/workstations_workstation_config)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `workstation_config_id` | The ID to be assigned to the workstation cluster config. | true | true | Workstation configuration IDs should follow an approved naming standard so that configurations can be clearly identified, audited, and managed consistently. | The workstation config uses an approved workstation_config_id, such as workstation-config. | The workstation config uses an unapproved workstation_config_id, such as wrong-config. |
| `workstation_cluster_id` | The ID of the parent workstation cluster. | true | true | Workstation configs should only be linked to approved workstation clusters so that they remain under trusted infrastructure and approved network boundaries. | The workstation config is linked to an approved workstation_cluster_id, such as workstation-cluster. | The workstation config is linked to an unapproved workstation_cluster_id, such as wrong-cluster. |
| `location` | The location where the workstation cluster config should reside. | true | true | Workstation configs should be created only in approved regions to meet organisational, compliance, and data governance requirements. | The workstation config is deployed in an approved location, such as us-central1. | The workstation config is deployed in an unapproved location, such as us-east1. |
| `display_name` | Human-readable name for this resource. | false | false | Display name is mainly used as a human-readable identifier and does not directly control workstation config security settings. | None | None |
| `labels` | Client-specified labels that are applied to the resource and that are also propagated to the underlying Compute Engine resources. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Labels are mainly used for organisation, ownership, and cost tracking. This policy set does not validate workstation config label values. | None | None |
| `annotations` | Client-specified annotations. This is distinct from labels. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Annotations provide extra metadata about the resource, but this policy set does not use annotations to enforce security controls. | None | None |
| `idle_timeout` | How long to wait before automatically stopping an instance that hasn't recently received any user traffic. A value of 0 indicates that this instance should never time out from idleness. Defaults to 20 minutes. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | false | Idle timeout can affect resource usage and session duration, but this policy set does not validate idle timeout values. | None | None |
| `running_timeout` | How long to wait before automatically stopping a workstation after it was started. A value of 0 indicates that workstations using this configuration should never time out from running duration. Must be greater than 0 and less than 24 hours if `encryption_key` is set. Defaults to 12 hours. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | false | Running timeout can affect workstation lifetime and resource usage, but this policy set does not validate running timeout values. | None | None |
| `replica_zones` | Specifies the zones used to replicate the VM and disk resources within the region. If set, exactly two zones within the workstation cluster's region must be specified—for example, `['us-central1-a', 'us-central1-f']`. If this field is empty, two default zones within the region are used. Immutable after the workstation configuration is created. | false | false | Replica zones affect availability and placement, but this policy set does not validate approved replica zones. | None | None |
| `enable_audit_agent` | Whether to enable Linux `auditd` logging on the workstation. When enabled, a service account must also be specified that has `logging.buckets.write` permission on the project. Operating system audit logging is distinct from Cloud Audit Logs. | false | false | Audit logging can improve visibility, but this policy set does not validate audit agent configuration. | None | None |
| `host` | Runtime host for a workstation. Structure is [documented below](#nested_host). | false | true | The host block controls the runtime environment for workstations, including Compute Engine settings that can affect exposure and resource configuration. | The host configuration uses approved GCE instance settings. | The host configuration uses unapproved GCE instance settings. |
| `persistent_directories` | Directories to persist across workstation sessions. Structure is [documented below](#nested_persistent_directories). | false | false | None | None | None |
| `ephemeral_directories` | Ephemeral directories which won't persist across workstation sessions. Structure is [documented below](#nested_ephemeral_directories). | false | false | None | None | None |
| `container` | Container that will be run for each workstation using this configuration when that workstation is started. Structure is [documented below](#nested_container). | false | false | None | None | None |
| `encryption_key` | Encrypts resources of this workstation configuration using a customer-managed encryption key. If specified, the boot disk of the Compute Engine instance and the persistent disk are encrypted using this encryption key. If this field is not set, the disks are encrypted using a generated key. Customer-managed encryption keys do not protect disk metadata. If the customer-managed encryption key is rotated, when the workstation instance is stopped, the system attempts to recreate the persistent disk with the new version of the key. Be sure to keep older versions of the key until the persistent disk is recreated. Otherwise, data on the persistent disk will be lost. If the encryption key is revoked, the workstation session will automatically be stopped within 7 hours. Structure is [documented below](#nested_encryption_key). | false | false | Customer-managed encryption can improve control over disk encryption, but this policy set does not validate encryption key configuration. | None | None |
| `readiness_checks` | Readiness checks to be performed on a workstation. Structure is [documented below](#nested_readiness_checks). | false | false | None | None | None |
| `disable_tcp_connections` | Disables support for plain TCP connections in the workstation. By default the service supports TCP connections via a websocket relay. Setting this option to true disables that relay, which prevents the usage of services that require plain tcp connections, such as ssh. When enabled, all communication must occur over https or wss. | false | false | None | None | None |
| `max_usable_workstations` | Maximum number of workstations under this configuration a user can have workstations.workstation.use permission on. Only enforced on CreateWorkstation API calls on the user issuing the API request. | false | false | None | None | None |
| `allowed_ports` | A list of port ranges specifying single ports or ranges of ports that are externally accessible in the workstation. Allowed ports must be one of 22, 80, or within range 1024-65535. If not specified defaults to ports 22, 80, and ports 1024-65535. Structure is [documented below](#nested_allowed_ports). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `gce_instance` |  | false | false | None | None | None |
| `shielded_instance_config` |  | false | false | None | None | None |
| `confidential_instance_config` |  | false | false | None | None | None |
| `accelerators` |  | false | false | None | None | None |
| `boost_configs` |  | false | false | None | None | None |
| `gce_pd` |  | false | false | None | None | None |

### host Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `gce_instance` | A runtime using a Compute Engine instance. Structure is [documented below](#nested_host_gce_instance). | false | true | GCE instance settings define the machine type and network exposure of the workstation runtime. | The GCE instance uses approved settings, such as machine_type e2-standard-4 and disable_public_ip_addresses set to true. | The GCE instance uses unapproved settings, such as an unapproved machine type or public IP addresses enabled. |

### persistent_directories Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `mount_path` | Location of this directory in the running workstation. | false | false | None | None | None |
| `gce_pd` | A directory to persist across workstation sessions, backed by a Compute Engine regional persistent disk. Can only be updated if not empty during creation. Structure is [documented below](#nested_persistent_directories_persistent_directories_gce_pd). | false | false | None | None | None |

### ephemeral_directories Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `mount_path` | Location of this directory in the running workstation. | false | false | None | None | None |
| `gce_pd` | An EphemeralDirectory backed by a Compute Engine persistent disk. Structure is [documented below](#nested_ephemeral_directories_ephemeral_directories_gce_pd). | false | false | None | None | None |

### container Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `image` | Docker image defining the container. This image must be accessible by the config's service account. | false | false | None | None | None |
| `command` | If set, overrides the default ENTRYPOINT specified by the image. | false | false | None | None | None |
| `args` | Arguments passed to the entrypoint. | false | false | None | None | None |
| `working_dir` | If set, overrides the default DIR specified by the image. | false | false | None | None | None |
| `env` | Environment variables passed to the container. The elements are of the form "KEY=VALUE" for the environment variable "KEY" being given the value "VALUE". | false | false | None | None | None |
| `run_as_user` | If set, overrides the USER specified in the image with the given uid. | false | false | None | None | None |

### encryption_key Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kms_key` | The name of the Google Cloud KMS encryption key. | true | false | None | None | None |
| `kms_key_service_account` | The service account to use with the specified KMS key. | true | false | None | None | None |

### readiness_checks Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `path` | Path to which the request should be sent. | true | false | None | None | None |
| `port` | Port to which the request should be sent. | true | false | None | None | None |

### allowed_ports Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `first` | Starting port number for the current range of ports. Valid ports are 22, 80, and ports within the range 1024-65535. | false | false | None | None | None |
| `last` | Ending port number for the current range of ports. Valid ports are 22, 80, and ports within the range 1024-65535. | false | false | None | None | None |

### gce_instance Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `machine_type` | The name of a Compute Engine machine type. | false | false | None | None | None |
| `service_account` | Email address of the service account that will be used on VM instances used to support this config. This service account must have permission to pull the specified container image. If not set, VMs will run without a service account, in which case the image must be publicly accessible. | false | false | None | None | None |
| `service_account_scopes` | Scopes to grant to the service_account. Various scopes are automatically added based on feature usage. When specified, users of workstations under this configuration must have `iam.serviceAccounts.actAs` on the service account. | false | false | None | None | None |
| `pool_size` | Number of instances to pool for faster workstation startup. | false | false | None | None | None |
| `boot_disk_size_gb` | Size of the boot disk in GB. | false | false | None | None | None |
| `tags` | Network tags to add to the Compute Engine machines backing the Workstations. | false | false | None | None | None |
| `disable_public_ip_addresses` | Whether instances have no public IP address. | false | true | Public IP addresses can expose workstation instances to external networks. Disabling public IP addresses helps keep workstation instances within approved private network access paths. | disable_public_ip_addresses is set to true. | disable_public_ip_addresses is set to false. |
| `disable_ssh` | Whether to disable SSH access to the VM. | false | false | None | None | None |
| `enable_nested_virtualization` | Whether to enable nested virtualization on the Compute Engine VMs backing the Workstations. See https://cloud.google.com/workstations/docs/reference/rest/v1beta/projects.locations.workstationClusters.workstationConfigs#GceInstance.FIELDS.enable_nested_virtualization | false | false | None | None | None |
| `shielded_instance_config` | A set of Compute Engine Shielded instance options. Structure is [documented below](#nested_host_gce_instance_shielded_instance_config). | false | false | None | None | None |
| `confidential_instance_config` | A set of Compute Engine Confidential VM instance options. Structure is [documented below](#nested_host_gce_instance_confidential_instance_config). | false | false | None | None | None |
| `accelerators` | An accelerator card attached to the instance. Structure is [documented below](#nested_host_gce_instance_accelerators). | false | false | None | None | None |
| `boost_configs` | A list of the boost configurations that workstations created using this workstation configuration are allowed to use. Structure is [documented below](#nested_host_gce_instance_boost_configs). | false | false | None | None | None |
| `vm_tags` | Resource manager tags to be bound to the VM instances backing the Workstations. Tag keys and values have the same definition as https://cloud.google.com/resource-manager/docs/tags/tags-overview Keys must be in the format `tagKeys/{tag_key_id}`, and values are in the format `tagValues/456`. | false | false | None | None | None |

### shielded_instance_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enable_secure_boot` | Whether the instance has Secure Boot enabled. | false | false | None | None | None |
| `enable_vtpm` | Whether the instance has the vTPM enabled. | false | false | None | None | None |
| `enable_integrity_monitoring` | Whether the instance has integrity monitoring enabled. | false | false | None | None | None |

### confidential_instance_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enable_confidential_compute` | Whether the instance has confidential compute enabled. | false | false | None | None | None |

### accelerators Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | Type of accelerator resource to attach to the instance, for example, "nvidia-tesla-p100". | true | false | None | None | None |
| `count` | Number of accelerator cards exposed to the instance. | true | false | None | None | None |

### boost_configs Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `id` | The id to be used for the boost config. | true | false | None | None | None |
| `machine_type` | The type of machine that boosted VM instances will use—for example, e2-standard-4. For more information about machine types that Cloud Workstations supports, see the list of available machine types https://cloud.google.com/workstations/docs/available-machine-types. Defaults to e2-standard-4. | false | false | None | None | None |
| `boot_disk_size_gb` | Size of the boot disk in GB. The minimum boot disk size is `30` GB. Defaults to `50` GB. | false | false | None | None | None |
| `enable_nested_virtualization` | Whether to enable nested virtualization on the Compute Engine VMs backing boosted Workstations. See https://cloud.google.com/workstations/docs/reference/rest/v1beta/projects.locations.workstationClusters.workstationConfigs#GceInstance.FIELDS.enable_nested_virtualization | false | false | None | None | None |
| `pool_size` | Number of instances to pool for faster workstation boosting. | false | false | None | None | None |
| `accelerators` | An accelerator card attached to the boost instance. Structure is [documented below](#nested_host_gce_instance_boost_configs_boost_configs_accelerators). | false | false | None | None | None |

### gce_pd Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `fs_type` | Type of file system that the disk should be formatted with. The workstation image must support this file system type. Must be empty if `sourceSnapshot` is set. Defaults to `ext4`. | false | false | None | None | None |
| `disk_type` | Type of the disk to use. Defaults to `"pd-standard"`. | false | false | None | None | None |
| `size_gb` | The GB capacity of a persistent home directory for each workstation created with this configuration. Must be empty if `sourceSnapshot` is set. Valid values are `10`, `50`, `100`, `200`, `500`, or `1000`. Defaults to `200`. If less than `200` GB, the `diskType` must be `pd-balanced` or `pd-ssd`. | false | false | None | None | None |
| `reclaim_policy` | Whether the persistent disk should be deleted when the workstation is deleted. Valid values are `DELETE` and `RETAIN`. Defaults to `DELETE`. Possible values are: `DELETE`, `RETAIN`. | false | false | None | None | None |
| `source_snapshot` | Name of the snapshot to use as the source for the disk. Must be empty if `sourceImage` is set. Must be empty if `read_only` is false. Updating `source_snapshot` will update content in the ephemeral directory after the workstation is restarted. | false | false | None | None | None |
| `source_image` | Name of the disk image to use as the source for the disk. Must be empty `sourceSnapshot` is set. Updating `sourceImage` will update content in the ephemeral directory after the workstation is restarted. | false | false | None | None | None |
| `read_only` | Whether the disk is read only. If true, the disk may be shared by multiple VMs and `sourceSnapshot` must be set. | false | false | None | None | None |
