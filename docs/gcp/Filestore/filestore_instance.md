## 🛡️ Policy Deployment Engine: `filestore_instance`

This section provides a concise policy evaluation for the `filestore_instance` resource in GCP.

Reference: [Terraform Registry – filestore_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/filestore_instance)

---

## 1. Argument Reference

### `name`
- Description: (Required) The resource name of the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tier`
- Description: (Required) The service tier of the instance. Possible values include: STANDARD, PREMIUM, BASIC_HDD, BASIC_SSD, HIGH_SCALE_SSD, ZONAL, REGIONAL and ENTERPRISE
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `file_shares`
- Description: (Required) File system shares on the instance. For this version, only a single file share is supported. Structure is [documented below](#nested_file_shares).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `networks`
- Description: (Required) VPC networks to which the instance is connected. For this version, only a single network is supported. Structure is [documented below](#nested_networks).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description of the instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `protocol`
- Description: (Optional) Either NFSv3, for using NFS version 3 as file sharing protocol, or NFSv4.1, for using NFS version 4.1 as file sharing protocol. NFSv4.1 can be used with HIGH_SCALE_SSD, ZONAL, REGIONAL and ENTERPRISE. The default is NFSv3. Default value is `NFS_V3`. Possible values are: `NFS_V3`, `NFS_V4_1`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Resource labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) KMS key name used for data encryption.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection_enabled`
- Description: (Optional) Indicates whether the instance is protected against deletion.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection_reason`
- Description: (Optional) The reason for enabling deletion protection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `performance_config`
- Description: (Optional) Performance configuration for the instance. If not provided, the default performance settings will be used. Structure is [documented below](#nested_performance_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: (Optional) A map of resource manager tags. Resource manager tag keys and values have the same definition as resource manager tags. Keys must be in the format tagKeys/{tag_key_id}, and values are in the format tagValues/456. The field is ignored when empty. The field is immutable and causes resource replacement when mutated. This field is only set at create time and modifying this field after creation will trigger recreation. To apply tags to an existing resource, see the `google_tags_tag_value` resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `initial_replication`
- Description: (Optional) Replication configuration, once set, this cannot be updated. Additionally this should be specified on the replica instance only, indicating the active as the peer_instance Structure is [documented below](#nested_initial_replication).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `directory_services`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Directory Services configuration. Should only be set if protocol is "NFS_V4_1". Structure is [documented below](#nested_directory_services).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `zone`
- Description: (Optional, Deprecated) The name of the Filestore zone of the instance. ~> **Warning:** `zone` is deprecated and will be removed in a future major release. Use `location` instead.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Optional) The name of the location of the instance. This can be a region for ENTERPRISE tier instances.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_file_shares"></a>The `file_shares` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the fileshare (16 characters or less)
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `capacity_gb`
- Description: (Required) File share capacity in GiB. This must be at least 1024 GiB for the standard tier, or 2560 GiB for the premium tier.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_backup`
- Description: (Optional) The resource name of the backup, in the format projects/{projectId}/locations/{locationId}/backups/{backupId}, that this file share has been restored from.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nfs_export_options`
- Description: (Optional) Nfs Export Options. There is a limit of 10 export options per file share. Structure is [documented below](#nested_file_shares_file_shares_nfs_export_options). <a name="nested_file_shares_file_shares_nfs_export_options"></a>The `nfs_export_options` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_ranges`
- Description: (Optional) List of either IPv4 addresses, or ranges in CIDR notation which may mount the file share. Overlapping IP ranges are not allowed, both within and across NfsExportOptions. An error will be returned. The limit is 64 IP ranges/addresses for each FileShareConfig among all NfsExportOptions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_mode`
- Description: (Optional) Either READ_ONLY, for allowing only read requests on the exported directory, or READ_WRITE, for allowing both read and write requests. The default is READ_WRITE. Default value is `READ_WRITE`. Possible values are: `READ_ONLY`, `READ_WRITE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `squash_mode`
- Description: (Optional) Either NO_ROOT_SQUASH, for allowing root access on the exported directory, or ROOT_SQUASH, for not allowing root access. The default is NO_ROOT_SQUASH. Default value is `NO_ROOT_SQUASH`. Possible values are: `NO_ROOT_SQUASH`, `ROOT_SQUASH`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `anon_uid`
- Description: (Optional) An integer representing the anonymous user id with a default value of 65534. Anon_uid may only be set with squashMode of ROOT_SQUASH. An error will be returned if this field is specified for other squashMode settings.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `anon_gid`
- Description: (Optional) An integer representing the anonymous group id with a default value of 65534. Anon_gid may only be set with squashMode of ROOT_SQUASH. An error will be returned if this field is specified for other squashMode settings.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The source VPC network for `ip_ranges`. Required for instances using Private Service Connect, optional otherwise. <a name="nested_networks"></a>The `networks` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `network`
- Description: (Required) The name of the GCE VPC network to which the instance is connected.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `modes`
- Description: (Required) IP versions for which the instance has IP addresses assigned. Each value may be one of: `ADDRESS_MODE_UNSPECIFIED`, `MODE_IPV4`, `MODE_IPV6`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reserved_ip_range`
- Description: (Optional) A /29 CIDR block that identifies the range of IP addresses reserved for this instance.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ip_addresses`
- Description: (Output) A list of IPv4 or IPv6 addresses.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `connect_mode`
- Description: (Optional) The network connect mode of the Filestore instance. If not provided, the connect mode defaults to DIRECT_PEERING. Default value is `DIRECT_PEERING`. Possible values are: `DIRECT_PEERING`, `PRIVATE_SERVICE_ACCESS`, `PRIVATE_SERVICE_CONNECT`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `psc_config`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Private Service Connect configuration. Should only be set when connect_mode is PRIVATE_SERVICE_CONNECT. Structure is [documented below](#nested_networks_networks_psc_config). <a name="nested_networks_networks_psc_config"></a>The `psc_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `endpoint_project`
- Description: (Optional) Consumer service project in which the Private Service Connect endpoint would be set up. This is optional, and only relevant in case the network is a shared VPC. If this is not specified, the endpoint would be set up in the VPC host project. <a name="nested_performance_config"></a>The `performance_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `iops_per_tb`
- Description: (Optional) The instance provisioned IOPS will change dynamically based on the capacity of the instance. Structure is [documented below](#nested_performance_config_iops_per_tb).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fixed_iops`
- Description: (Optional) The instance will have a fixed provisioned IOPS value, which will remain constant regardless of instance capacity. Structure is [documented below](#nested_performance_config_fixed_iops). <a name="nested_performance_config_iops_per_tb"></a>The `iops_per_tb` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_iops_per_tb`
- Description: (Optional) The instance max IOPS will be calculated by multiplying the capacity of the instance (TB) by max_iops_per_tb, and rounding to the nearest 1000. The instance max IOPS will be changed dynamically based on the instance capacity. <a name="nested_performance_config_fixed_iops"></a>The `fixed_iops` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_iops`
- Description: (Optional) The number of IOPS to provision for the instance. max_iops must be in multiple of 1000. <a name="nested_initial_replication"></a>The `initial_replication` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role`
- Description: (Optional) The replication role. Default value is `STANDBY`. Possible values are: `ROLE_UNSPECIFIED`, `ACTIVE`, `STANDBY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replicas`
- Description: (Optional) The replication role. Structure is [documented below](#nested_initial_replication_replicas). <a name="nested_initial_replication_replicas"></a>The `replicas` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peer_instance`
- Description: (Required) The peer instance. <a name="nested_directory_services"></a>The `directory_services` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ldap`
- Description: (Optional) Configuration for LDAP servers. Structure is [documented below](#nested_directory_services_ldap). <a name="nested_directory_services_ldap"></a>The `ldap` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain`
- Description: (Required) The LDAP domain name in the format of `my-domain.com`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `servers`
- Description: (Required) The servers names are used for specifying the LDAP servers names. The LDAP servers names can come with two formats: 1. DNS name, for example: `ldap.example1.com`, `ldap.example2.com`. 2. IP address, for example: `10.0.0.1`, `10.0.0.2`, `10.0.0.3`. All servers names must be in the same format: either all DNS names or all IP addresses.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `users_ou`
- Description: (Optional) The users Organizational Unit (OU) is optional. This parameter is a hint to allow faster lookup in the LDAP namespace. In case that this parameter is not provided, Filestore instance will query the whole LDAP namespace.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `groups_ou`
- Description: (Optional) The groups Organizational Unit (OU) is optional. This parameter is a hint to allow faster lookup in the LDAP namespace. In case that this parameter is not provided, Filestore instance will query the whole LDAP namespace.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
