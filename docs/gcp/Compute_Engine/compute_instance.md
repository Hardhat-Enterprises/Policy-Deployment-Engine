## 🛡️ Policy Deployment Engine: `compute_instance`

This section provides a concise policy evaluation for the `compute_instance` resource in GCP.

Reference: [Terraform Registry – compute_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance)

---

## 1. Argument Reference

### `boot_disk`
- Description: Structure is [documented below](#nested_boot_disk).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `machine_type`
- Description: **Note:** If you want to update this value (resize the VM) after initial creation, you must set [`allow_stopping_for_update`](#allow_stopping_for_update) to `true`. [Custom machine types](https://cloud.google.com/dataproc/docs/concepts/compute/custom-machine-types) can be formatted as `custom-NUMBER_OF_CPUS-AMOUNT_OF_MEMORY_MB`, e.g. `custom-6-20480` for 6 vCPU and 20GB of RAM. Because of current API limitations some custom machine types may get converted to different machine types (such as an equivalent standard type) and cause non-empty plans in your configuration. Use `lifecycle.ignore_changes` on `machine_type` in these cases. There is a limit of 6.5 GB per CPU unless you add [extended memory](https://cloud.google.com/compute/docs/instances/creating-instance-with-custom-machine-type#extendedmemory). You must do this explicitly by adding the suffix `-ext`, e.g. `custom-2-15360-ext` for 2 vCPU and 15 GB of memory.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: Changing this forces a new resource to be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_interface`
- Description: be specified multiple times. Structure is [documented below](#nested_network_interface). - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_stopping_for_update`
- Description: If you try to update a property that requires stopping the instance without setting this field, the update will fail.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `attached_disk`
- Description: 
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

### `desired_status`
- Description: `"RUNNING"`, `"SUSPENDED"` or `"TERMINATED"`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: **Note:** you must disable deletion protection before removing the resource (e.g., via `terraform destroy`), or the instance cannot be deleted and the Terraform run will not complete successfully.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hostname`
- Description: Valid format is a series of labels 1-63 characters long matching the regular expression `[a-z]([-a-z0-9]*[a-z0-9])`, concatenated with periods. The entire hostname must not exceed 253 characters. Changing this forces a new resource to be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `guest_accelerator`
- Description: **Note:** GPU accelerators can only be used with [`on_host_maintenance`](#on_host_maintenance) option set to TERMINATE. **Note**: As of 6.0.0, [argument syntax](https://developer.hashicorp.com/terraform/language/syntax/configuration#arguments) is no longer supported for this field in favor of [block syntax](https://developer.hashicorp.com/terraform/language/syntax/configuration#blocks). To dynamically set a list of guest accelerators, use [dynamic blocks](https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks). To set an empty list, use a single `guest_accelerator` block with `count = 0`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field 'effective_labels' for all of the labels present on the resource.
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
- Description: within the instance. Ssh keys attached in the Cloud Console will be removed. Add them to your config in order to keep them attached to your instance. A list of predefined metadata keys (e.g. ssh-keys) can be found [here](https://cloud.google.com/compute/docs/metadata/predefined-metadata-keys) -> Depending on the OS you choose for your instance, some metadata keys have special functionality.  Most linux-based images will run the content of `metadata.startup-script` in a shell on every boot.  At a minimum, Debian, CentOS, RHEL, SLES, Container-Optimized OS, and Ubuntu images support this key.  Windows instances require other keys depending on the format of the script and the time you would like it to run - see [this table](https://cloud.google.com/compute/docs/startupscript#providing_a_startup_script_for_windows_instances). For the convenience of the users of `metadata.startup-script`, we provide a special attribute, `metadata_startup_script`, which is documented below.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `metadata_startup_script`
- Description: startup-script metadata key, except this one forces the instance to be recreated (thus re-running the script) if it is changed. This replaces the startup-script metadata key on the created instance and thus the two mechanisms are not allowed to be used simultaneously.  Users are free to use either mechanism - the only distinction is that this separate attribute will cause a recreate on modification.  On import, `metadata_startup_script` will not be set - if you choose to specify it you will see a diff immediately after import causing a destroy/recreate operation. If importing an instance and specifying this value is desired, you will need to modify your state file manually using `terraform state` commands.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_cpu_platform`
- Description: `Intel Haswell` or `Intel Skylake`. See the complete list [here](https://cloud.google.com/compute/docs/instances/specify-min-cpu-platform). **Note**: [`allow_stopping_for_update`](#allow_stopping_for_update) must be set to true or your instance must have a `desired_status` of `TERMINATED` in order to update this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `params`
- Description: .
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scheduling`
- Description: this configuration option are [detailed below](#nested_scheduling).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scratch_disk`
- Description: specified multiple times for multiple scratch disks. Structure is [documented below](#nested_scratch_disk).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: Structure is [documented below](#nested_service_account). **Note**: [`allow_stopping_for_update`](#allow_stopping_for_update) must be set to true or your instance must have a `desired_status` of `TERMINATED` in order to update this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `shielded_instance_config`
- Description: **Note**: [`shielded_instance_config`](#shielded_instance_config) can only be used with boot images with shielded vm support. See the complete list [here](https://cloud.google.com/compute/docs/images#shielded-images). **Note**: [`allow_stopping_for_update`](#allow_stopping_for_update) must be set to true or your instance must have a `desired_status` of `TERMINATED` in order to update this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_display`
- Description: **Note**: [`allow_stopping_for_update`](#allow_stopping_for_update) must be set to true or your instance must have a `desired_status` of `TERMINATED` in order to update this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reservation_affinity`
- Description: Structure is [documented below](#nested_reservation_affinity).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `partner_metadata`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_revocation_action_type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_encryption_key`
- Description: --- <a name="nested_boot_disk"></a>The `boot_disk` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_delete`
- Description: is deleted. Defaults to true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `device_name`
- Description: On the instance, this device will be `/dev/disk/by-id/google-{{device_name}}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: or `READ_ONLY`. If not specified, the default is to attach the disk in `READ_WRITE` mode.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `guest_os_features`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_encryption_key_raw`
- Description: (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption), encoded in [RFC 4648 base64](https://tools.ietf.org/html/rfc4648#section-4) to encrypt this disk. Only one of `kms_key_self_link`, `disk_encryption_key_rsa` and `disk_encryption_key_raw` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_encryption_key_rsa`
- Description: (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption) to encrypt this disk. Only one of `kms_key_self_link`, `disk_encryption_key_rsa` and `disk_encryption_key_raw`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_self_link`
- Description: stored in Google Cloud KMS to encrypt this disk. Only one of `kms_key_self_link`, `disk_encryption_key_rsa` and `disk_encryption_key_raw` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_encryption_service_account`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `initialize_params`
- Description: alongside the new instance. Either `initialize_params` or `source` must be set. Structure is [documented below](#nested_initialize_params).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source`
- Description: `google_compute_disk`) or disk image. To create an instance from a snapshot, first create a `google_compute_disk` from a snapshot and reference it here.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `force_attach`
- Description: disk even if it's currently attached to another instance. If you try to force attach a zonal disk to an instance, you will receive an error. Setting this parameter cause VM recreation. <a name="nested_initialize_params"></a>The `initialize_params` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `size`
- Description: will inherit the size of its base image.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `image`
- Description: one of: the image's `self_link`, `projects/{project}/global/images/{image}`, `projects/{project}/global/images/family/{family}`, `global/images/{image}`, `global/images/family/{family}`, `family/{family}`, `{project}/{family}`, `{project}/{image}`, `{family}`, or `{image}`. If referred by family, the images names must include the family name. If they don't, use the [google_compute_image data source](/docs/providers/google/d/compute_image.html). For instance, the image `centos-6-v20180104` includes its family name `centos-6`. These images can be referred by family name here.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: field is only applicable for persistent disks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_image_encryption_key`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `snapshot`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_snapshot_encryption_key`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `architecture`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_manager_tags`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `resource_policies`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `provisioned_iops`
- Description: This sets the number of I/O operations per second that the disk can handle. For more details,see the [Hyperdisk documentation](https://cloud.google.com/compute/docs/disks/hyperdisks). Note: Updating currently is only supported for hyperdisk skus via disk update api/gcloud without the need to delete and recreate the disk, hyperdisk allows for an update of IOPS every 4 hours. To update your hyperdisk more frequently, you'll need to manually delete and recreate it.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `provisioned_throughput`
- Description: This sets the number of throughput mb per second that the disk can handle. For more details,see the [Hyperdisk documentation](https://cloud.google.com/compute/docs/disks/hyperdisks). Note: Updating currently is only supported for hyperdisk skus via disk update api/gcloud without the need to delete and recreate the disk, hyperdisk allows for an update of throughput every 4 hours. To update your hyperdisk more frequently, you'll need to manually delete and recreate it.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_confidential_compute`
- Description: Note: Only supported on hyperdisk skus, disk_encryption_key is required when setting to true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_pool`
- Description: For example: * https://www.googleapis.com/compute/v1/projects/{project}/zones/{zone}/storagePools/{storagePool} * /projects/{project}/zones/{zone}/storagePools/{storagePool} * /zones/{zone}/storagePools/{storagePool} * /{storagePool} <a name="nested_scratch_disk"></a>The `scratch_disk` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `interface`
- Description: <a name="nested_attached_disk"></a>The `attached_disk` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `device_name`
- Description: under `/dev/disk/by-id/google-*`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mode`
- Description: If you have a persistent disk with data that you want to share between multiple instances, detach it from any read-write instances and attach it to one or more instances in read-only mode.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_encryption_key_raw`
- Description: (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption), encoded in [RFC 4648 base64](https://tools.ietf.org/html/rfc4648#section-4) to encrypt this disk. Only one of `kms_key_self_link`, `disk_encryption_key_rsa` and `disk_encryption_key_raw` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_encryption_key_rsa`
- Description: (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption) to encrypt this disk. Only one of `kms_key_self_link`, `disk_encryption_key_rsa` and `disk_encryption_key_raw` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_self_link`
- Description: stored in Google Cloud KMS to encrypt this disk. Only one of `kms_key_self_link`, `disk_encryption_key_rsa` and `disk_encryption_key_raw` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disk_encryption_service_account`
- Description: <a name="nested_source_image_encryption_key"></a>The `source_snapshot_encryption_key` block supports:
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

### `kms_key_self_link`
- Description: stored in Google Cloud KMS to decrypt the given image. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_service_account`
- Description: <a name="nested_source_snapshot_encryption_key"></a>The `source_snapshot_encryption_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `raw_key`
- Description: (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption), encoded in [RFC 4648 base64](https://tools.ietf.org/html/rfc4648#section-4) to decrypt the given snapshot. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rsa_encrypted_key`
- Description: (https://cloud.google.com/compute/docs/disks/customer-supplied-encryption) to decrypt the given snapshot. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_self_link`
- Description: stored in Google Cloud KMS to decrypt the given image. Only one of `kms_key_self_link`, `rsa_encrypted_key` and `raw_key` may be set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_service_account`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `force_attach`
- Description: disk even if it's currently attached to another instance. If you try to force attach a zonal disk to an instance, you will receive an error. Setting this parameter cause VM recreation. <a name="nested_network_performance_config"></a>The `network_performance_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `total_egress_bandwidth_tier`
- Description: Possible values: TIER_1, DEFAULT <a name="nested_network_interface"></a>The `network_interface` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: Either `network` or `subnetwork` must be provided. If network isn't provided it will be inferred from the subnetwork. *  `subnetwork` - (Optional) The name or self_link of the subnetwork to attach this interface to. Either `network` or `subnetwork` must be provided. If network isn't provided it will be inferred from the subnetwork. The subnetwork must exist in the same region this instance will be created in. If the network resource is in [legacy](https://cloud.google.com/vpc/docs/legacy) mode, do not specify this field. If the network is in auto subnet mode, specifying the subnetwork is optional. If the network is in custom subnet mode, specifying the subnetwork is required. *  `subnetwork_project` - (Optional) The project in which the subnetwork belongs. If the `subnetwork` is a self_link, this field is set to the project defined in the subnetwork self_link. If the `subnetwork` is a name and this field is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_ip`
- Description: empty, the address will be automatically assigned.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_config`
- Description: instance can be accessed via the Internet. Omit to ensure that the instance is not accessible from the Internet. If omitted, ssh provisioners will not work unless Terraform can send traffic to the instance's network (e.g. via tunnel or because it is running on another cloud instance on that network). This block can be specified once per `network_interface`. Structure [documented below](#nested_access_config).
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

### `network_attachment`
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
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_policy`
- Description: <a name="nested_access_config"></a>The `access_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nat_ip`
- Description: network ip. If not given, one will be generated.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `public_ptr_domain_name`
- Description: To set this field on an instance, you must be verified as the owner of the domain. See [the docs](https://cloud.google.com/compute/docs/instances/create-ptr-record) for how to become verified as a domain owner.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_tier`
- Description: This field can take the following values: PREMIUM, FIXED_STANDARD or STANDARD. If this field is not specified, it is assumed to be PREMIUM. <a name="nested_ipv6_access_config"></a>The `ipv6_access_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_ipv6`
- Description: with this instance, prefix length is stored in externalIpv6PrefixLength in ipv6AccessConfig. To use a static external IP address, it must be unused and in the same region as the instance's zone. If not specified, Google Cloud will automatically assign an external IPv6 address from the instance's subnetwork.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `external_ipv6_prefix_length`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: is "External IPv6".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network_tier`
- Description: subnet has an external subnet. Only PREMIUM or STANDARD tier is valid for IPv6.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `public_ptr_domain_name`
- Description: records for the external IPv6 ranges.. <a name="nested_alias_ip_range"></a>The `alias_ip_range` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_cidr_range`
- Description: must belong to the specified subnetwork and cannot contain IP addresses reserved by system or used by other network interfaces. This range may be a single IP address (e.g. 10.2.3.4), a netmask (e.g. /24) or a CIDR format string (e.g. 10.1.2.0/24).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subnetwork_range_name`
- Description: the secondary range from which to allocate the IP CIDR range for this alias IP range. If left unspecified, the primary range of the subnetwork will be used. <a name="nested_service_account"></a>The `service_account` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email`
- Description: **Note**: [`allow_stopping_for_update`](#allow_stopping_for_update) must be set to true or your instance must have a `desired_status` of `TERMINATED` in order to update this field.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scopes`
- Description: short names are supported. To allow full access to all Cloud APIs, use the `cloud-platform` scope. See a complete list of scopes [here](https://cloud.google.com/sdk/gcloud/reference/alpha/compute/instances/set-scopes#--scopes). **Note**: [`allow_stopping_for_update`](#allow_stopping_for_update) must be set to true or your instance must have a `desired_status` of `TERMINATED` in order to update this field. <a name="nested_instance_encryption_key"></a>The `instance_encryption_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_self_link`
- Description: stored in Google Cloud KMS to encrypt the data on this instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_service_account`
- Description: <a name="nested_scheduling"></a>The `scheduling` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `preemptible`
- Description: If this field is set to true, then `automatic_restart` must be set to false.  Defaults to false.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `on_host_maintenance`
- Description: instance. Can be MIGRATE or TERMINATE, for more info, read [here](https://cloud.google.com/compute/docs/instances/setting-instance-scheduling-options).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `automatic_restart`
- Description: restarted if it was terminated by Compute Engine (not a user). Defaults to true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_affinities`
- Description: to determine which sole-tenant nodes your instances and managed instance groups will use as host systems. Read more on sole-tenant node creation [here](https://cloud.google.com/compute/docs/nodes/create-nodes). Structure [documented below](#nested_node_affinities).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_node_cpus`
- Description: 
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

### `max_run_duration`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `on_instance_stop_action`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host_error_timeout_seconds`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `maintenance_interval`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `local_ssd_recovery_timeout`
- Description: 
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
- Description: The value must be between 1 and 3600, which is 3,600 seconds (one hour).` <a name="nested_local_ssd_recovery_timeout"></a>The `local_ssd_recovery_timeout` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years. <a name="nested_max_run_duration"></a>The `max_run_duration` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nanos`
- Description: resolution. Durations less than one second are represented with a 0 `seconds` field and a positive `nanos` field. Must be from 0 to 999,999,999 inclusive.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `seconds`
- Description: 315,576,000,000 inclusive. Note: these bounds are computed from: 60 sec/min * 60 min/hr * 24 hr/day * 365.25 days/year * 10000 years. <a name="nested_on_instance_stop_action"></a>The `on_instance_stop_action` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `discard_local_ssd`
- Description: <a name="nested_guest_accelerator"></a>The `guest_accelerator` block supports:
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
- Description: <a name="nested_reservation_affinity"></a>The `reservation_affinity` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `specific_reservation`
- Description: Structure is [documented below](#nested_specific_reservation). <a name="nested_specific_reservation"></a>The `specific_reservation` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `values`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
