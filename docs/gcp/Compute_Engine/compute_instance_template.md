## 🛡️ Policy Deployment Engine: `compute_instance_template`

This section provides a concise policy evaluation for the `compute_instance_template` resource in GCP.

Reference: [Terraform Registry – compute_instance_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_template)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `machine_type` | To create a machine with a [custom type](https://cloud.google.com/dataproc/docs/concepts/compute/custom-machine-types) (such as extended memory), format the value like `custom-VCPUS-MEM_IN_MB` like `custom-6-20480` for 6 vCPU and 20GB of RAM. More advanced machine types like [z3](https://cloud.google.com/compute/docs/storage-optimized-machines) will create disks that cannot be managed by Terraform by default. You can account for that by using `lifecycle.ignore_changes` or adding these disks into your config. - - - | none | None | None |
| `name` | this blank, Terraform will auto-generate a unique name. | none | None | None |
| `name_prefix` | prefix. Conflicts with `name`. Max length is 54 characters. Prefixes with lengths longer than 37 characters will use a shortened UUID that will be more prone to collisions. Resulting name for a `name_prefix` <= 37 characters: `name_prefix` + YYYYmmddHHSSssss + 8 digit incremental counter Resulting name for a `name_prefix` 38 - 54 characters: `name_prefix` + YYmmdd + 3 digit incremental counter | none | None | None |
| `can_ip_forward` | packets with non-matching source or destination IPs. This defaults to false. | none | None | None |
| `description` |  | none | None | None |
| `instance_description` | created from this template. | none | None | None |
| `labels` | created from this template. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field 'effective_labels' for all of the labels present on the resource. | none | None | None |
| `terraform_labels` | The combination of labels configured directly on the resource and default labels configured on the provider. | none | None | None |
| `effective_labels` | All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services. | none | None | None |
| `metadata` | within instances created from this template. | none | None | None |
| `metadata_startup_script` | startup-script metadata key, mostly to match the compute_instance resource. This replaces the startup-script metadata key on the created instance and thus the two mechanisms are not allowed to be used simultaneously. | none | None | None |
| `project` | is not provided, the provider project is used. | none | None | None |
| `region` | bound to a zone or a region. However, you can still specify some regional resources in an instance template, which restricts the template to the region where that resource resides. For example, a custom `subnetwork` resource is tied to a specific region. Defaults to the region of the Provider if no value is given. * `resource_policies` (Optional) -- A list of self_links of resource policies to attach to the instance. Modifying this list will cause the instance to recreate. Currently a max of 1 resource policy is supported. | none | None | None |
| `resource_manager_tags` |  | none | None | None |
| `tags` |  | none | None | None |
| `guest_accelerator` |  | none | None | None |
| `min_cpu_platform` | `Intel Haswell` or `Intel Skylake`. See the complete list [here](https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform). | none | None | None |
| `shielded_instance_config` | **Note**: [`shielded_instance_config`](#shielded_instance_config) can only be used with boot images with shielded vm support. See the complete list [here](https://cloud.google.com/compute/docs/images#shielded-images). | none | None | None |
| `enable_display` | **Note**: [`allow_stopping_for_update`](#allow_stopping_for_update) must be set to true in order to update this field. * `confidential_instance_config` (Optional) - Enable [Confidential Mode](https://cloud.google.com/compute/confidential-vm/docs/about-cvm) on this VM. Structure is [documented below](#nested_confidential_instance_config) * `advanced_machine_features` (Optional) - Configure Nested Virtualisation and Simultaneous Hyper Threading on this VM. Structure is [documented below](#nested_advanced_machine_features) | none | None | None |
| `partner_metadata` |  | none | None | None |
| `key_revocation_action_type` |  | none | None | None |
| `node_affinities` |  | none | None | None |
| `confidential_instance_config` |  | none | None | None |

### disk Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `auto_delete` | This defaults to true. | none | None | None |
| `boot` |  | none | None | None |
| `device_name` | /dev/  tree of a Linux operating system running within the instance. If not specified, the server chooses a default device name to apply to this disk. | none | None | None |
| `disk_name` | to the name of the instance. | none | None | None |
| `provisioned_iops` | sets the number of I/O operations per second that the disk can handle. Values must be between 10,000 and 120,000. For more details, see the [Extreme persistent disk documentation](https://cloud.google.com/compute/docs/disks/extreme-persistent-disk). | none | None | None |
| `resource_manager_tags` |  | none | None | None |
| `guest_os_features` |  | none | None | None |
| `source_image` | initialize this disk. This can be one of: the image's `self_link`, `projects/{project}/global/images/{image}`, `projects/{project}/global/images/family/{family}`, `global/images/{image}`, `global/images/family/{family}`, `family/{family}`, `{project}/{family}`, `{project}/{image}`, `{family}`, or `{image}`. ~> **Note:** Either `source`, `source_image`, or `source_snapshot` is **required** in a disk block unless the disk type is `local-ssd`. Check the API [docs](https://cloud.google.com/compute/docs/reference/rest/v1/instanceTemplates/insert) for details. | none | None | None |
| `source_image_encryption_key` | key of the source image. Required if the source image is protected by a customer-supplied encryption key. Instance templates do not store customer-supplied encryption keys, so you cannot create disks for instances in a managed instance group if the source images are encrypted with your own keys. Structure [documented below](#nested_source_image_encryption_key). | none | None | None |
| `source_snapshot` | ~> **Note:** Either `source`, `source_image`, or `source_snapshot` is **required** in a disk block unless the disk type is `local-ssd`. Check the API [docs](https://cloud.google.com/compute/docs/reference/rest/v1/instanceTemplates/insert) for details. | none | None | None |
| `source_snapshot_encryption_key` | key of the source snapshot. Structure [documented below](#nested_source_snapshot_encryption_key). | none | None | None |
| `interface` | which is either SCSI or NVME. The default is SCSI. Persistent disks must always use SCSI and the request will fail if you attempt to attach a persistent disk in any other format than SCSI. Local SSDs can use either NVME or SCSI. | none | None | None |
| `mode` | or READ_ONLY. If you are attaching or creating a boot disk, this must read-write mode. | none | None | None |
| `architecture` |  | none | None | None |
| `source` | of the disk (such as those managed by `google_compute_disk`) to attach. ~> **Note:** Either `source`, `source_image`, or `source_snapshot` is **required** in a disk block unless the disk type is `local-ssd`. Check the API [docs](https://cloud.google.com/compute/docs/reference/rest/v1/instanceTemplates/insert) for details. | none | None | None |
| `disk_type` | `"pd-balanced"` or `"pd-standard"`, `"hyperdisk-balanced"`, `"hyperdisk-throughput"` or `"hyperdisk-extreme"`. | none | None | None |
| `disk_size_gb` | specified, it will inherit the size of its base image. For SCRATCH disks, the size must be exactly 375GB. | none | None | None |
| `labels` | this template | none | None | None |
| `type` | `"PERSISTENT"`. | none | None | None |
| `disk_encryption_key` | If you are creating a new disk, this field encrypts the new disk using an encryption key that you provide. If you are attaching an existing disk that is already encrypted, this field decrypts the disk using the customer-supplied encryption key. If you encrypt a disk using a customer-supplied key, you must provide the same key again when you attempt to use this resource at a later time. For example, you must provide the key when you create a snapshot or an image from the disk or when you attach the disk to a virtual machine instance. If you do not provide an encryption key, then the disk will be encrypted using an automatically generated key and you do not need to provide a key to use the disk later. Instance templates do not store customer-supplied encryption keys, so you cannot use your own keys to encrypt disks in a managed instance group. Structure [documented below](#nested_access_config). * `resource_policies` (Optional) -- A list (short name or id) of resource policies to attach to this disk for automatic snapshot creations. Currently a max of 1 resource policy is supported. | none | None | None |

### network_interface Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network` | Use `network` attribute for Legacy or Auto subnetted networks and `subnetwork` for custom subnetted networks. | none | None | None |
| `subnetwork` | to. The subnetwork must exist in the same `region` this instance will be created in. Either `network` or `subnetwork` must be provided. | none | None | None |
| `network_attachment` |  | none | None | None |
| `subnetwork_project` | If it is not provided, the provider project is used. | none | None | None |
| `network_ip` | empty, the address will be automatically assigned. | none | None | None |
| `access_config` | instance can be accessed via the Internet. Omit to ensure that the instance is not accessible from the Internet (this means that ssh provisioners will not work unless you are running Terraform can send traffic to the instance's network (e.g. via tunnel or because it is running on another cloud instance on that network). This block can be specified once per `network_interface`. Structure [documented below](#nested_access_config). | none | None | None |
| `alias_ip_range` | array of alias IP ranges for this network interface. Can only be specified for network interfaces on subnet-mode networks. Structure [documented below](#nested_alias_ip_range). | none | None | None |
| `nic_type` |  | none | None | None |
| `stack_type` |  | none | None | None |
| `ipv6_access_config` | Currently, only one IPv6 access config, DIRECT_IPV6, is supported. If there is no ipv6AccessConfig specified, then this instance will have no external IPv6 Internet access. Structure [documented below](#nested_ipv6_access_config). | none | None | None |
| `queue_count` |  | none | None | None |

### reservation_affinity Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` |  | none | None | None |
| `specific_reservation` | Structure is documented below. | none | None | None |

### scheduling Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `automatic_restart` | automatically restarted if it is terminated by Compute Engine (not terminated by a user). This defaults to true. | none | None | None |
| `on_host_maintenance` | instance. | none | None | None |
| `preemptible` | false. Read more on this [here](https://cloud.google.com/compute/docs/instances/preemptible). | none | None | None |
| `node_affinities` | to determine which sole-tenant nodes your instances and managed instance groups will use as host systems. Read more on sole-tenant node creation [here](https://cloud.google.com/compute/docs/nodes/create-nodes). Structure [documented below](#nested_node_affinities). | none | None | None |
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

### service_account Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `email` | default Google Compute Engine service account is used. | none | None | None |
| `scopes` | short names are supported. To allow full access to all Cloud APIs, use the `cloud-platform` scope. See a complete list of scopes [here](https://cloud.google.com/sdk/gcloud/reference/alpha/compute/instances/set-scopes#--scopes). The [service accounts documentation](https://cloud.google.com/compute/docs/access/service-accounts#accesscopesiam) explains that access scopes are the legacy method of specifying permissions for your instance. To follow best practices you should create a dedicated service account with the minimum permissions the VM requires. To use a dedicated service account this field should be configured as a list containing the `cloud-platform` scope. See [Authenticate workloads using service accounts best practices](https://cloud.google.com/compute/docs/access/create-enable-service-accounts-for-instances#best_practices) and [Best practices for using service accounts](https://cloud.google.com/iam/docs/best-practices-service-accounts#single-purpose). | none | None | None |

### source_image_encryption_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `raw_key` | (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption), encoded in [RFC 4648 base64](https://tools.ietf.org/html/rfc4648#section-4) to decrypt the given image. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set. | none | None | None |
| `rsa_encrypted_key` | (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption) to decrypt the given image. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set. | none | None | None |
| `kms_key_service_account` | encryption request for the given KMS key. If absent, the Compute Engine default service account is used. | none | None | None |
| `kms_key_self_link` | stored in Google Cloud KMS. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set. | none | None | None |

### source_snapshot_encryption_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `raw_key` | (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption), encoded in [RFC 4648 base64](https://tools.ietf.org/html/rfc4648#section-4) to decrypt this snapshot. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set. | none | None | None |
| `rsa_encrypted_key` | (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption) to decrypt this snapshot. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set. | none | None | None |
| `kms_key_service_account` | encryption request for the given KMS key. If absent, the Compute Engine default service account is used. | none | None | None |
| `kms_key_self_link` | stored in Google Cloud KMS. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set. | none | None | None |

### disk_encryption_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `kms_key_service_account` | encryption request for the given KMS key. If absent, the Compute Engine default service account is used. | none | None | None |
| `kms_key_self_link` |  | none | None | None |

### access_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `nat_ip` | network ip. If not given, one will be generated. | none | None | None |
| `network_tier` | this instance template. This field can take the following values: PREMIUM, STANDARD or FIXED_STANDARD. If this field is not specified, it is assumed to be PREMIUM. | none | None | None |

### ipv6_access_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network_tier` | subnet has an external subnet. Only PREMIUM and STANDARD tier is valid for IPv6. | none | None | None |

### alias_ip_range Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip_cidr_range` | must belong to the specified subnetwork and cannot contain IP addresses reserved by system or used by other network interfaces. At the time of writing only a netmask (e.g. /24) may be supplied, with a CIDR format resulting in an API error. | none | None | None |
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

### specific_reservation Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` |  | none | None | None |
| `values` |  | none | None | None |

### network_performance_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `total_egress_bandwidth_tier` |  | none | None | None |

### advanced_machine_features Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enable_nested_virtualization` |  | none | None | None |
| `threads_per_core` |  | none | None | None |
| `turbo_mode` |  | none | None | None |
| `visible_core_count` |  | none | None | None |
| `performance_monitoring_unit` |  | none | None | None |
| `enable_uefi_networking` |  | none | None | None |
