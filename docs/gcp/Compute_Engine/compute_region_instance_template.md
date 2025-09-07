## 🛡️ Policy Deployment Engine: `compute_region_instance_template`

This section provides a concise policy evaluation for the `compute_region_instance_template` resource in GCP.

Reference: [Terraform Registry – compute_region_instance_template](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_instance_template)

---

## 1. Argument Reference

### `disk`
- Description: This can be specified multiple times for multiple disks. Structure is [documented below](#nested_disk).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: To create a machine with a [custom type](https://cloud.google.com/dataproc/docs/concepts/compute/custom-machine-types) (such as extended memory), format the value like `custom-VCPUS-MEM_IN_MB` like `custom-6-20480` for 6 vCPU and 20GB of RAM. - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: this blank, Terraform will auto-generate a unique name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name_prefix`
- Description: prefix. Conflicts with `name`. Max length is 54 characters. Prefixes with lengths longer than 37 characters will use a shortened UUID that will be more prone to collisions. Resulting name for a `name_prefix` <= 37 characters: `name_prefix` + YYYYmmddHHSSssss + 8 digit incremental counter Resulting name for a `name_prefix` 38 - 54 characters: `name_prefix` + YYmmdd + 3 digit incremental counter
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `can_ip_forward`
- Description: packets with non-matching source or destination IPs. This defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_description`
- Description: created from this template.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: created from this template. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field 'effective_labels' for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `terraform_labels`
- Description: The combination of labels configured directly on the resource and default labels configured on the provider.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effective_labels`
- Description: All of labels (key/value pairs) present on the resource in GCP, including the labels configured through Terraform, other clients and services.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata`
- Description: within instances created from this template.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata_startup_script`
- Description: startup-script metadata key, mostly to match the compute_instance resource. This replaces the startup-script metadata key on the created instance and thus the two mechanisms are not allowed to be used simultaneously.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_interface`
- Description: this template. This can be specified multiple times for multiple networks. Structure is [documented below](#nested_network_interface).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: If region is not provided, the provider region is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_manager_tags`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reservation_affinity`
- Description: Structure is [documented below](#nested_reservation_affinity).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scheduling`
- Description: this configuration option are [detailed below](#nested_scheduling).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `guest_accelerator`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_cpu_platform`
- Description: `Intel Haswell` or `Intel Skylake`. See the complete list [here](https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shielded_instance_config`
- Description: **Note**: [`shielded_instance_config`](#shielded_instance_config) can only be used with boot images with shielded vm support. See the complete list [here](https://cloud.google.com/compute/docs/images#shielded-images).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_display`
- Description: **Note**: [`allow_stopping_for_update`](#allow_stopping_for_update) must be set to true in order to update this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `partner_metadata`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_revocation_action_type`
- Description: <a name="nested_disk"></a>The `disk` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_delete`
- Description: This defaults to true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boot`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `device_name`
- Description: /dev/  tree of a Linux operating system running within the instance. If not specified, the server chooses a default device name to apply to this disk.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_name`
- Description: to the name of the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `provisioned_iops`
- Description: sets the number of I/O operations per second that the disk can handle. Values must be between 10,000 and 120,000. For more details, see the [Extreme persistent disk documentation](https://cloud.google.com/compute/docs/disks/extreme-persistent-disk).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_manager_tags`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `guest_os_features`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_image`
- Description: initialize this disk. This can be one of: the image's `self_link`, `projects/{project}/global/images/{image}`, `projects/{project}/global/images/family/{family}`, `global/images/{image}`, `global/images/family/{family}`, `family/{family}`, `{project}/{family}`, `{project}/{image}`, `{family}`, or `{image}`. ~> **Note:** Either `source`, `source_image`, or `source_snapshot` is **required** in a disk block unless the disk type is `local-ssd`. Check the API [docs](https://cloud.google.com/compute/docs/reference/rest/v1/instanceTemplates/insert) for details.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_image_encryption_key`
- Description: key of the source image. Required if the source image is protected by a customer-supplied encryption key. Instance templates do not store customer-supplied encryption keys, so you cannot create disks for instances in a managed instance group if the source images are encrypted with your own keys. Structure [documented below](#nested_source_image_encryption_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_snapshot`
- Description: ~> **Note:** Either `source`, `source_image`, or `source_snapshot` is **required** in a disk block unless the disk type is `local-ssd`. Check the API [docs](https://cloud.google.com/compute/docs/reference/rest/v1/instanceTemplates/insert) for details.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_snapshot_encryption_key`
- Description: key of the source snapshot. Structure [documented below](#nested_source_snapshot_encryption_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interface`
- Description: which is either SCSI or NVME. The default is SCSI. Persistent disks must always use SCSI and the request will fail if you attempt to attach a persistent disk in any other format than SCSI. Local SSDs can use either NVME or SCSI.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: or READ_ONLY. If you are attaching or creating a boot disk, this must read-write mode.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `architecture`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source`
- Description: of the disk (such as those managed by `google_compute_disk`) to attach. ~> **Note:** Either `source`, `source_image`, or `source_snapshot` is **required** in a disk block unless the disk type is `local-ssd`. Check the API [docs](https://cloud.google.com/compute/docs/reference/rest/v1/instanceTemplates/insert) for details.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_type`
- Description: `"pd-balanced"` or `"pd-standard"`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_size_gb`
- Description: specified, it will inherit the size of its base image. For SCRATCH disks, the size must be exactly 375GB.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: this template
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: `"PERSISTENT"`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_encryption_key`
- Description: If you are creating a new disk, this field encrypts the new disk using an encryption key that you provide. If you are attaching an existing disk that is already encrypted, this field decrypts the disk using the customer-supplied encryption key. If you encrypt a disk using a customer-supplied key, you must provide the same key again when you attempt to use this resource at a later time. For example, you must provide the key when you create a snapshot or an image from the disk or when you attach the disk to a virtual machine instance. If you do not provide an encryption key, then the disk will be encrypted using an automatically generated key and you do not need to provide a key to use the disk later. Instance templates do not store customer-supplied encryption keys, so you cannot use your own keys to encrypt disks in a managed instance group. Structure [documented below](#nested_access_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `raw_key`
- Description: (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption), encoded in [RFC 4648 base64](https://tools.ietf.org/html/rfc4648#section-4) to decrypt the given image. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rsa_encrypted_key`
- Description: (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption) to decrypt the given image. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_service_account`
- Description: encryption request for the given KMS key. If absent, the Compute Engine default service account is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_self_link`
- Description: stored in Google Cloud KMS. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set. <a name="nested_source_snapshot_encryption_key"></a>The `source_snapshot_encryption_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `raw_key`
- Description: (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption), encoded in [RFC 4648 base64](https://tools.ietf.org/html/rfc4648#section-4) to decrypt this snapshot. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rsa_encrypted_key`
- Description: (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption) to decrypt this snapshot. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_service_account`
- Description: encryption request for the given KMS key. If absent, the Compute Engine default service account is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_self_link`
- Description: stored in Google Cloud KMS. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set. <a name="nested_disk_encryption_key"></a>The `disk_encryption_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_service_account`
- Description: encryption request for the given KMS key. If absent, the Compute Engine default service account is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_self_link`
- Description: <a name="nested_network_interface"></a>The `network_interface` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: Use `network` attribute for Legacy or Auto subnetted networks and `subnetwork` for custom subnetted networks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork`
- Description: to. The subnetwork must exist in the same `region` this instance will be created in. Either `network` or `subnetwork` must be provided.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork_project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_ip`
- Description: empty, the address will be automatically assigned.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_config`
- Description: instance can be accessed via the Internet. Omit to ensure that the instance is not accessible from the Internet (this means that ssh provisioners will not work unless you are running Terraform can send traffic to the instance's network (e.g. via tunnel or because it is running on another cloud instance on that network). This block can be specified once per `network_interface`. Structure [documented below](#nested_access_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `alias_ip_range`
- Description: array of alias IP ranges for this network interface. Can only be specified for network interfaces on subnet-mode networks. Structure [documented below](#nested_alias_ip_range).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nic_type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `stack_type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ipv6_access_config`
- Description: Currently, only one IPv6 access config, DIRECT_IPV6, is supported. If there is no ipv6AccessConfig specified, then this instance will have no external IPv6 Internet access. Structure [documented below](#nested_ipv6_access_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `queue_count`
- Description: <a name="nested_access_config"></a>The `access_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nat_ip`
- Description: network ip. If not given, one will be generated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_tier`
- Description: this instance template. This field can take the following values: PREMIUM, STANDARD or FIXED_STANDARD. If this field is not specified, it is assumed to be PREMIUM. <a name="nested_ipv6_access_config"></a>The `ipv6_access_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_tier`
- Description: subnet has an external subnet. Only PREMIUM and STANDARD tier is valid for IPv6. <a name="nested_alias_ip_range"></a>The `alias_ip_range` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_cidr_range`
- Description: must belong to the specified subnetwork and cannot contain IP addresses reserved by system or used by other network interfaces. At the time of writing only a netmask (e.g. /24) may be supplied, with a CIDR format resulting in an API error.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork_range_name`
- Description: the secondary range from which to allocate the IP CIDR range for this alias IP range. If left unspecified, the primary range of the subnetwork will be used. <a name="nested_service_account"></a>The `service_account` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email`
- Description: default Google Compute Engine service account is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scopes`
- Description: short names are supported. To allow full access to all Cloud APIs, use the `cloud-platform` scope. See a complete list of scopes [here](https://cloud.google.com/sdk/gcloud/reference/alpha/compute/instances/set-scopes#--scopes). The [service accounts documentation](https://cloud.google.com/compute/docs/access/service-accounts#accesscopesiam) explains that access scopes are the legacy method of specifying permissions for your instance. To follow best practices you should create a dedicated service account with the minimum permissions the VM requires. To use a dedicated service account this field should be configured as a list containing the `cloud-platform` scope. See [Authenticate workloads using service accounts best practices](https://cloud.google.com/compute/docs/access/create-enable-service-accounts-for-instances#best_practices) and [Best practices for using service accounts](https://cloud.google.com/iam/docs/best-practices-service-accounts#single-purpose). <a name="nested_scheduling"></a>The `scheduling` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `automatic_restart`
- Description: automatically restarted if it is terminated by Compute Engine (not terminated by a user). This defaults to true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `on_host_maintenance`
- Description: instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preemptible`
- Description: false. Read more on this [here](https://cloud.google.com/compute/docs/instances/preemptible).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_affinities`
- Description: to determine which sole-tenant nodes your instances and managed instance groups will use as host systems. Read more on sole-tenant node creation [here](https://cloud.google.com/compute/docs/nodes/create-nodes). Structure [documented below](#nested_node_affinities).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `provisioning_model`
- Description: `preemptible` should be `true` and `automatic_restart` should be `false`. For more info about `SPOT`, read [here](https://cloud.google.com/compute/docs/instances/spot)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_termination_action`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `termination_time`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `availability_domain`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_error_timeout_seconds`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_run_duration`
- Description: <a name="nested_max_run_duration"></a>The `max_run_duration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_interval`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_ssd_recovery_timeout`
- Description: <a name="nested_local_ssd_recovery_timeout"></a>The `local_ssd_recovery_timeout` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `graceful_shutdown`
- Description: <a name="nested_graceful_shutdown"></a>The `graceful_shutdown` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: The value must be between 1 and 3600, which is 3,600 seconds (one hour).` <a name="nested_guest_accelerator"></a>The `guest_accelerator` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `specific_reservation`
- Description: Structure is documented below.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

---

## 2. `specific_reservation` Block

### `key`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `values`
- Description: <a name="nested_shielded_instance_config"></a>The `shielded_instance_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `total_egress_bandwidth_tier`
- Description: <a name="nested_advanced_machine_features"></a>The `advanced_machine_features` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_nested_virtualization`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `threads_per_core`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `turbo_mode`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `visible_core_count`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `performance_monitoring_unit`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_uefi_networking`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
