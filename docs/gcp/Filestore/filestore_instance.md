## 🛡️ Policy Deployment Engine: `filestore_instance`

This section provides a concise policy evaluation for the `filestore_instance` resource in GCP.

Reference: [Terraform Registry – filestore_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/filestore_instance)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The resource name of the instance. | true | None | None |
| `tier` | The service tier of the instance. Possible values include: STANDARD, PREMIUM, BASIC_HDD, BASIC_SSD, HIGH_SCALE_SSD, ZONAL, REGIONAL and ENTERPRISE | true | None | None |
| `description` | A description of the instance. | false | None | None |
| `protocol` | Either NFSv3, for using NFS version 3 as file sharing protocol, or NFSv4.1, for using NFS version 4.1 as file sharing protocol. NFSv4.1 can be used with HIGH_SCALE_SSD, ZONAL, REGIONAL and ENTERPRISE. The default is NFSv3. Default value is `NFS_V3`. Possible values are: `NFS_V3`, `NFS_V4_1`. | false | None | None |
| `labels` | Resource labels to represent user-provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `kms_key_name` | KMS key name used for data encryption. | false | None | None |
| `deletion_protection_enabled` | Indicates whether the instance is protected against deletion. | false | None | None |
| `deletion_protection_reason` | The reason for enabling deletion protection. | false | None | None |
| `tags` | A map of resource manager tags. Resource manager tag keys and values have the same definition as resource manager tags. Keys must be in the format tagKeys/{tag_key_id}, and values are in the format tagValues/456. The field is ignored when empty. The field is immutable and causes resource replacement when mutated. This field is only set at create time and modifying this field after creation will trigger recreation. To apply tags to an existing resource, see the `google_tags_tag_value` resource. | false | None | None |
| `zone` | , Deprecated) The name of the Filestore zone of the instance. ~> **Warning:** `zone` is deprecated and will be removed in a future major release. Use `location` instead. | false | None | None |
| `location` | The name of the location of the instance. This can be a region for ENTERPRISE tier instances. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### file_shares Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the fileshare (16 characters or less) | true | None | None |
| `capacity_gb` | File share capacity in GiB. This must be at least 1024 GiB for the standard tier, or 2560 GiB for the premium tier. | true | None | None |
| `source_backup` | The resource name of the backup, in the format projects/{projectId}/locations/{locationId}/backups/{backupId}, that this file share has been restored from. | false | None | None |
| `nfs_export_options` | Nfs Export Options. There is a limit of 10 export options per file share. Structure is [documented below](#nested_file_shares_file_shares_nfs_export_options). | false | None | None |

### networks Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `network` | The name of the GCE VPC network to which the instance is connected. | true | None | None |
| `modes` | IP versions for which the instance has IP addresses assigned. Each value may be one of: `ADDRESS_MODE_UNSPECIFIED`, `MODE_IPV4`, `MODE_IPV6`. | true | None | None |
| `reserved_ip_range` | A /29 CIDR block that identifies the range of IP addresses reserved for this instance. | false | None | None |
| `ip_addresses` | (Output) A list of IPv4 or IPv6 addresses. | none | None | None |
| `connect_mode` | The network connect mode of the Filestore instance. If not provided, the connect mode defaults to DIRECT_PEERING. Default value is `DIRECT_PEERING`. Possible values are: `DIRECT_PEERING`, `PRIVATE_SERVICE_ACCESS`, `PRIVATE_SERVICE_CONNECT`. | false | None | None |
| `psc_config` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Private Service Connect configuration. Should only be set when connect_mode is PRIVATE_SERVICE_CONNECT. Structure is [documented below](#nested_networks_networks_psc_config). | false | None | None |

### performance_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `iops_per_tb` | The instance provisioned IOPS will change dynamically based on the capacity of the instance. Structure is [documented below](#nested_performance_config_iops_per_tb). | false | None | None |
| `fixed_iops` | The instance will have a fixed provisioned IOPS value, which will remain constant regardless of instance capacity. Structure is [documented below](#nested_performance_config_fixed_iops). | false | None | None |

### initial_replication Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `role` | The replication role. Default value is `STANDBY`. Possible values are: `ROLE_UNSPECIFIED`, `ACTIVE`, `STANDBY`. | false | None | None |
| `replicas` | The replication role. Structure is [documented below](#nested_initial_replication_replicas). | false | None | None |

### directory_services Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ldap` | Configuration for LDAP servers. Structure is [documented below](#nested_directory_services_ldap). | false | None | None |

### nfs_export_options Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ip_ranges` | List of either IPv4 addresses, or ranges in CIDR notation which may mount the file share. Overlapping IP ranges are not allowed, both within and across NfsExportOptions. An error will be returned. The limit is 64 IP ranges/addresses for each FileShareConfig among all NfsExportOptions. | false | None | None |
| `access_mode` | Either READ_ONLY, for allowing only read requests on the exported directory, or READ_WRITE, for allowing both read and write requests. The default is READ_WRITE. Default value is `READ_WRITE`. Possible values are: `READ_ONLY`, `READ_WRITE`. | false | None | None |
| `squash_mode` | Either NO_ROOT_SQUASH, for allowing root access on the exported directory, or ROOT_SQUASH, for not allowing root access. The default is NO_ROOT_SQUASH. Default value is `NO_ROOT_SQUASH`. Possible values are: `NO_ROOT_SQUASH`, `ROOT_SQUASH`. | false | None | None |
| `anon_uid` | An integer representing the anonymous user id with a default value of 65534. Anon_uid may only be set with squashMode of ROOT_SQUASH. An error will be returned if this field is specified for other squashMode settings. | false | None | None |
| `anon_gid` | An integer representing the anonymous group id with a default value of 65534. Anon_gid may only be set with squashMode of ROOT_SQUASH. An error will be returned if this field is specified for other squashMode settings. | false | None | None |
| `network` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) The source VPC network for `ip_ranges`. Required for instances using Private Service Connect, optional otherwise. | false | None | None |

### psc_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `endpoint_project` | Consumer service project in which the Private Service Connect endpoint would be set up. This is optional, and only relevant in case the network is a shared VPC. If this is not specified, the endpoint would be set up in the VPC host project. | false | None | None |

### iops_per_tb Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_iops_per_tb` | The instance max IOPS will be calculated by multiplying the capacity of the instance (TB) by max_iops_per_tb, and rounding to the nearest 1000. The instance max IOPS will be changed dynamically based on the instance capacity. | false | None | None |

### fixed_iops Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `max_iops` | The number of IOPS to provision for the instance. max_iops must be in multiple of 1000. | false | None | None |

### replicas Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `peer_instance` | The peer instance. | true | None | None |

### ldap Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `domain` | The LDAP domain name in the format of `my-domain.com`. | true | None | None |
| `servers` | The servers names are used for specifying the LDAP servers names. The LDAP servers names can come with two formats: 1. DNS name, for example: `ldap.example1.com`, `ldap.example2.com`. 2. IP address, for example: `10.0.0.1`, `10.0.0.2`, `10.0.0.3`. All servers names must be in the same format: either all DNS names or all IP addresses. | true | None | None |
| `users_ou` | The users Organizational Unit (OU) is optional. This parameter is a hint to allow faster lookup in the LDAP namespace. In case that this parameter is not provided, Filestore instance will query the whole LDAP namespace. | false | None | None |
| `groups_ou` | The groups Organizational Unit (OU) is optional. This parameter is a hint to allow faster lookup in the LDAP namespace. In case that this parameter is not provided, Filestore instance will query the whole LDAP namespace. | false | None | None |
