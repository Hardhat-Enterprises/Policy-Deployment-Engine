## 🛡️ Policy Deployment Engine: `compute_instance`

This section provides a concise policy evaluation for the `compute_instance` resource in GCP.

Reference: [Terraform Registry – compute_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `machine_type` | **Note:** If you want to update this value (resize the VM) after initial creation, you must set [`allow_stopping_for_update`](#allow_stopping_for_update) to `true`. [Custom machine types](https://cloud.google.com/dataproc/docs/concepts/compute/custom-machine-types) can be formatted as `custom-NUMBER_OF_CPUS-AMOUNT_OF_MEMORY_MB`, e.g. `custom-6-20480` for 6 vCPU and 20GB of RAM. Because of current API limitations some custom machine types may get converted to different machine types (such as an equivalent standard type) and cause non-empty plans in your configuration. Use `lifecycle.ignore_changes` on `machine_type` in these cases. There is a limit of 6.5 GB per CPU unless you add [extended memory](https://cloud.google.com/compute/docs/instances/creating-instance-with-custom-machine-type#extendedmemory). You must do this explicitly by adding the suffix `-ext`, e.g. `custom-2-15360-ext` for 2 vCPU and 15 GB of memory. | none | None | None |
| `name` | Changing this forces a new resource to be created. | none | None | None |
| `zone` |  | none | None | None |
| `allow_stopping_for_update` | If you try to update a property that requires stopping the instance without setting this field, the update will fail. | none | None | None |
| `can_ip_forward` | packets with non-matching source or destination IPs. This defaults to false. | none | None | None |
| `description` |  | none | None | None |
| `desired_status` | `"RUNNING"`, `"SUSPENDED"` or `"TERMINATED"`. | none | None | None |
| `deletion_protection` | **Note:** you must disable deletion protection before removing the resource (e.g., via `terraform destroy`), or the instance cannot be deleted and the Terraform run will not complete successfully. | none | None | None |
| `hostname` | Valid format is a series of labels 1-63 characters long matching the regular expression `[a-z]([-a-z0-9]*[a-z0-9])`, concatenated with periods. The entire hostname must not exceed 253 characters. Changing this forces a new resource to be created. | none | None | None |
| `guest_accelerator` | **Note:** GPU accelerators can only be used with [`on_host_maintenance`](#on_host_maintenance) option set to TERMINATE. **Note**: As of 6.0.0, [argument syntax](https://developer.hashicorp.com/terraform/language/syntax/configuration#arguments) is no longer supported for this field in favor of [block syntax](https://developer.hashicorp.com/terraform/language/syntax/configuration#blocks). To dynamically set a list of guest accelerators, use [dynamic blocks](https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks). To set an empty list, use a single `guest_accelerator` block with `count = 0`. | none | None | None |
| `labels` | **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field 'effective_labels' for all of the labels present on the resource. | none | None | None |
| `terraform_labels` | The combination of labels configured directly on the resource and default labels configured on the provider. | none | None | None |
| `effective_labels` | All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services. | none | None | None |
| `metadata` | within the instance. Ssh keys attached in the Cloud Console will be removed. Add them to your config in order to keep them attached to your instance. A list of predefined metadata keys (e.g. ssh-keys) can be found [here](https://cloud.google.com/compute/docs/metadata/predefined-metadata-keys) -> Depending on the OS you choose for your instance, some metadata keys have special functionality.  Most linux-based images will run the content of `metadata.startup-script` in a shell on every boot.  At a minimum, Debian, CentOS, RHEL, SLES, Container-Optimized OS, and Ubuntu images support this key.  Windows instances require other keys depending on the format of the script and the time you would like it to run - see [this table](https://cloud.google.com/compute/docs/startupscript#providing_a_startup_script_for_windows_instances). For the convenience of the users of `metadata.startup-script`, we provide a special attribute, `metadata_startup_script`, which is documented below. | none | None | None |
| `metadata_startup_script` | startup-script metadata key, except this one forces the instance to be recreated (thus re-running the script) if it is changed. This replaces the startup-script metadata key on the created instance and thus the two mechanisms are not allowed to be used simultaneously.  Users are free to use either mechanism - the only distinction is that this separate attribute will cause a recreate on modification.  On import, `metadata_startup_script` will not be set - if you choose to specify it you will see a diff immediately after import causing a destroy/recreate operation. If importing an instance and specifying this value is desired, you will need to modify your state file manually using `terraform state` commands. | none | None | None |
| `min_cpu_platform` | `Intel Haswell` or `Intel Skylake`. See the complete list [here](https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform). **Note**: [`allow_stopping_for_update`](#allow_stopping_for_update) must be set to true or your instance must have a `desired_status` of `TERMINATED` in order to update this field. | none | None | None |
| `params` | . | none | None | None |
| `project` | is not provided, the provider project is used. | none | None | None |
| `tags` |  | none | None | None |
| `shielded_instance_config` | **Note**: [`shielded_instance_config`](#shielded_instance_config) can only be used with boot images with shielded vm support. See the complete list [here](https://cloud.google.com/compute/docs/images#shielded-images). **Note**: [`allow_stopping_for_update`](#allow_stopping_for_update) must be set to true or your instance must have a `desired_status` of `TERMINATED` in order to update this field. | none | None | None |
| `enable_display` | **Note**: [`allow_stopping_for_update`](#allow_stopping_for_update) must be set to true or your instance must have a `desired_status` of `TERMINATED` in order to update this field. * `resource_policies` (Optional) -- A list of self_links of resource policies to attach to the instance. Modifying this list will cause the instance to recreate. Currently a max of 1 resource policy is supported. | none | None | None |
| `partner_metadata` |  | none | None | None |
| `key_revocation_action_type` |  | none | None | None |
| `node_affinities` |  | none | None | None |
| `confidential_instance_config` |  | none | None | None |

### boot_disk Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `auto_delete` | is deleted. Defaults to true. | none | None | None |
| `device_name` | On the instance, this device will be `/dev/disk/by-id/google-{{device_name}}`. | none | None | None |
| `mode` | or `READ_ONLY`. If not specified, the default is to attach the disk in `READ_WRITE` mode. | none | None | None |
| `guest_os_features` |  | none | None | None |
| `disk_encryption_key_raw` | (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption), encoded in [RFC 4648 base64](https://tools.ietf.org/html/rfc4648#section-4) to encrypt this disk. Only one of `kms_key_self_link`, `disk_encryption_key_rsa` and `disk_encryption_key_raw` may be set. | none | None | None |
| `disk_encryption_key_rsa` | (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption) to encrypt this disk. Only one of `kms_key_self_link`, `disk_encryption_key_rsa` and `disk_encryption_key_raw` | none | None | None |
| `kms_key_self_link` | stored in Google Cloud KMS to encrypt this disk. Only one of `kms_key_self_link`, `disk_encryption_key_rsa` and `disk_encryption_key_raw` may be set. | none | None | None |
| `disk_encryption_service_account` |  | none | None | None |
| `initialize_params` | alongside the new instance. Either `initialize_params` or `source` must be set. Structure is [documented below](#nested_initialize_params). | none | None | None |
| `source` | `google_compute_disk`) or disk image. To create an instance from a snapshot, first create a `google_compute_disk` from a snapshot and reference it here. | none | None | None |
| `force_attach` | disk even if it's currently attached to another instance. If you try to force attach a zonal disk to an instance, you will receive an error. Setting this parameter cause VM recreation. | none | None | None |

### network_interface Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network` | Either `network` or `subnetwork` must be provided. If network isn't provided it will be inferred from the subnetwork. | none | None | None |
| `subnetwork` | interface to. Either `network` or `subnetwork` must be provided. If network isn't provided it will be inferred from the subnetwork. The subnetwork must exist in the same region this instance will be created in. If the network resource is in [legacy](https://cloud.google.com/vpc/docs/legacy) mode, do not specify this field. If the network is in auto subnet mode, specifying the subnetwork is optional. If the network is in custom subnet mode, specifying the subnetwork is required. | none | None | None |
| `subnetwork_project` | If the `subnetwork` is a self_link, this field is set to the project defined in the subnetwork self_link. If the `subnetwork` is a name and this field is not provided, the provider project is used. | none | None | None |
| `network_ip` | empty, the address will be automatically assigned. | none | None | None |
| `access_config` | instance can be accessed via the Internet. Omit to ensure that the instance is not accessible from the Internet. If omitted, ssh provisioners will not work unless Terraform can send traffic to the instance's network (e.g. via tunnel or because it is running on another cloud instance on that network). This block can be specified once per `network_interface`. Structure [documented below](#nested_access_config). | none | None | None |
| `alias_ip_range` | array of alias IP ranges for this network interface. Can only be specified for network interfaces on subnet-mode networks. Structure [documented below](#nested_alias_ip_range). | none | None | None |
| `nic_type` |  | none | None | None |
| `network_attachment` |  | none | None | None |
| `stack_type` |  | none | None | None |
| `ipv6_access_config` | Currently, only one IPv6 access config, DIRECT_IPV6, is supported. If there is no ipv6AccessConfig specified, then this instance will have no external IPv6 Internet access. Structure [documented below](#nested_ipv6_access_config). | none | None | None |
| `queue_count` |  | none | None | None |
| `security_policy` |  | none | None | None |

### attached_disk Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `source` |  | none | None | None |
| `device_name` | under `/dev/disk/by-id/google-*` | none | None | None |
| `mode` | If you have a persistent disk with data that you want to share between multiple instances, detach it from any read-write instances and attach it to one or more instances in read-only mode. | none | None | None |
| `disk_encryption_key_raw` | (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption), encoded in [RFC 4648 base64](https://tools.ietf.org/html/rfc4648#section-4) to encrypt this disk. Only one of `kms_key_self_link`, `disk_encryption_key_rsa` and `disk_encryption_key_raw` may be set. | none | None | None |
| `disk_encryption_key_rsa` | (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption) to encrypt this disk. Only one of `kms_key_self_link`, `disk_encryption_key_rsa` and `disk_encryption_key_raw` may be set. | none | None | None |
| `kms_key_self_link` | stored in Google Cloud KMS to encrypt this disk. Only one of `kms_key_self_link`, `disk_encryption_key_rsa` and `disk_encryption_key_raw` may be set. | none | None | None |
| `disk_encryption_service_account` |  | none | None | None |

### scheduling Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `preemptible` | If this field is set to true, then `automatic_restart` must be set to false.  Defaults to false. | none | None | None |
| `on_host_maintenance` | instance. Can be MIGRATE or TERMINATE, for more info, read [here](https://cloud.google.com/compute/docs/instances/setting-instance-scheduling-options). | none | None | None |
| `automatic_restart` | restarted if it was terminated by Compute Engine (not a user). Defaults to true. | none | None | None |
| `node_affinities` | to determine which sole-tenant nodes your instances and managed instance groups will use as host systems. Read more on sole-tenant node creation [here](https://cloud.google.com/compute/docs/nodes/create-nodes). Structure [documented below](#nested_node_affinities). | none | None | None |
| `min_node_cpus` |  | none | None | None |
| `provisioning_model` | `preemptible` should be `true` and `automatic_restart` should be `false`. For more info about `SPOT`, read [here](https://cloud.google.com/compute/docs/instances/spot) | none | None | None |
| `instance_termination_action` |  | none | None | None |
| `termination_time` |  | none | None | None |
| `availability_domain` |  | none | None | None |
| `max_run_duration` |  | none | None | None |
| `on_instance_stop_action` |  | none | None | None |
| `host_error_timeout_seconds` |  | none | None | None |
| `maintenance_interval` |  | none | None | None |
| `local_ssd_recovery_timeout` |  | none | None | None |
| `graceful_shutdown` |  | none | None | None |

### scratch_disk Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `interface` |  | none | None | None |

### service_account Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `email` | **Note**: [`allow_stopping_for_update`](#allow_stopping_for_update) must be set to true or your instance must have a `desired_status` of `TERMINATED` in order to update this field. | none | None | None |
| `scopes` | short names are supported. To allow full access to all Cloud APIs, use the `cloud-platform` scope. See a complete list of scopes [here](https://cloud.google.com/sdk/gcloud/reference/alpha/compute/instances/set-scopes#--scopes). **Note**: [`allow_stopping_for_update`](#allow_stopping_for_update) must be set to true or your instance must have a `desired_status` of `TERMINATED` in order to update this field. | none | None | None |

### reservation_affinity Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` |  | none | None | None |
| `specific_reservation` | Structure is [documented below](#nested_specific_reservation). | none | None | None |

### instance_encryption_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key_self_link` | stored in Google Cloud KMS to encrypt the data on this instance. | none | None | None |
| `kms_key_service_account` |  | none | None | None |

### initialize_params Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `size` | will inherit the size of its base image. | none | None | None |
| `type` |  | none | None | None |
| `image` | one of: the image's `self_link`, `projects/{project}/global/images/{image}`, `projects/{project}/global/images/family/{family}`, `global/images/{image}`, `global/images/family/{family}`, `family/{family}`, `{project}/{family}`, `{project}/{image}`, `{family}`, or `{image}`. If referred by family, the images names must include the family name. If they don't, use the [google_compute_image data source](/docs/providers/google/d/compute_image.html). For instance, the image `centos-6-v20180104` includes its family name `centos-6`. These images can be referred by family name here. | none | None | None |
| `labels` | field is only applicable for persistent disks. | none | None | None |
| `source_image_encryption_key` |  | none | None | None |
| `snapshot` |  | none | None | None |
| `source_snapshot_encryption_key` |  | none | None | None |
| `architecture` |  | none | None | None |
| `resource_manager_tags` |  | none | None | None |
| `resource_policies` |  | none | None | None |
| `provisioned_iops` | This sets the number of I/O operations per second that the disk can handle. For more details,see the [Hyperdisk documentation](https://cloud.google.com/compute/docs/disks/hyperdisks). Note: Updating currently is only supported for hyperdisk skus via disk update api/gcloud without the need to delete and recreate the disk, hyperdisk allows for an update of IOPS every 4 hours. To update your hyperdisk more frequently, you'll need to manually delete and recreate it. | none | None | None |
| `provisioned_throughput` | This sets the number of throughput mb per second that the disk can handle. For more details,see the [Hyperdisk documentation](https://cloud.google.com/compute/docs/disks/hyperdisks). Note: Updating currently is only supported for hyperdisk skus via disk update api/gcloud without the need to delete and recreate the disk, hyperdisk allows for an update of throughput every 4 hours. To update your hyperdisk more frequently, you'll need to manually delete and recreate it. | none | None | None |
| `enable_confidential_compute` | Note: Only supported on hyperdisk skus, disk_encryption_key is required when setting to true. | none | None | None |
| `storage_pool` | For example: * https://www.googleapis.com/compute/v1/projects/{project}/zones/{zone}/storagePools/{storagePool} * /projects/{project}/zones/{zone}/storagePools/{storagePool} * /zones/{zone}/storagePools/{storagePool} * /{storagePool} | none | None | None |

### source_snapshot_encryption_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `raw_key` | (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption), encoded in [RFC 4648 base64](https://tools.ietf.org/html/rfc4648#section-4) to decrypt the given snapshot. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set. | none | None | None |
| `rsa_encrypted_key` | (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption) to decrypt the given snapshot. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set. | none | None | None |
| `kms_key_self_link` | stored in Google Cloud KMS to decrypt the given image. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set. | none | None | None |
| `kms_key_service_account` |  | none | None | None |
| `force_attach` | disk even if it's currently attached to another instance. If you try to force attach a zonal disk to an instance, you will receive an error. Setting this parameter cause VM recreation. | none | None | None |

### network_performance_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `total_egress_bandwidth_tier` | Possible values: TIER_1, DEFAULT | none | None | None |

### access_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `nat_ip` | network ip. If not given, one will be generated. | none | None | None |
| `public_ptr_domain_name` | To set this field on an instance, you must be verified as the owner of the domain. See [the docs](https://cloud.google.com/compute/docs/instances/create-ptr-record) for how to become verified as a domain owner. | none | None | None |
| `network_tier` | This field can take the following values: PREMIUM, FIXED_STANDARD or STANDARD. If this field is not specified, it is assumed to be PREMIUM. | none | None | None |

### ipv6_access_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `external_ipv6` | with this instance, prefix length is stored in externalIpv6PrefixLength in ipv6AccessConfig. To use a static external IP address, it must be unused and in the same region as the instance's zone. If not specified, Google Cloud will automatically assign an external IPv6 address from the instance's subnetwork. | none | None | None |
| `external_ipv6_prefix_length` |  | none | None | None |
| `name` | is "External IPv6". | none | None | None |
| `network_tier` | subnet has an external subnet. Only PREMIUM or STANDARD tier is valid for IPv6. | none | None | None |
| `public_ptr_domain_name` | records for the external IPv6 ranges.. | none | None | None |

### alias_ip_range Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip_cidr_range` | must belong to the specified subnetwork and cannot contain IP addresses reserved by system or used by other network interfaces. This range may be a single IP address (e.g. 10.2.3.4), a netmask (e.g. /24) or a CIDR format string (e.g. 10.1.2.0/24). | none | None | None |
| `subnetwork_range_name` | the secondary range from which to allocate the IP CIDR range for this alias IP range. If left unspecified, the primary range of the subnetwork will be used. | none | None | None |

### graceful_shutdown Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | * `max_duration` (Optional) The time allotted for the instance to gracefully shut down. If the graceful shutdown isn't complete after this time, then the instance transitions to the STOPPING state. Structure is documented below: | none | None | None |
| `nanos` | resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive. | none | None | None |
| `seconds` | The value must be between 1 and 3600, which is 3,600 seconds (one hour).` | none | None | None |

### local_ssd_recovery_timeout Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `nanos` | resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive. | none | None | None |
| `seconds` | 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years. | none | None | None |

### max_run_duration Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `nanos` | resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive. | none | None | None |
| `seconds` | 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years. | none | None | None |

### on_instance_stop_action Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `discard_local_ssd` |  | none | None | None |

### advanced_machine_features Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_nested_virtualization` |  | none | None | None |
| `threads_per_core` |  | none | None | None |
| `turbo_mode` |  | none | None | None |
| `visible_core_count` |  | none | None | None |
| `performance_monitoring_unit` |  | none | None | None |
| `enable_uefi_networking` |  | none | None | None |

### specific_reservation Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` |  | none | None | None |
| `values` |  | none | None | None |
