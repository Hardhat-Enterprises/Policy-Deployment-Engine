## 🛡️ Policy Deployment Engine: `netapp_volume`

This section provides a concise policy evaluation for the `netapp_volume` resource in GCP.

Reference: [Terraform Registry – netapp_volume](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_volume)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `share_name` | Share name (SMB) or export path (NFS) of the volume. Needs to be unique per location. | true | None | None |
| `storage_pool` | Name of the storage pool to create the volume in. Pool needs enough spare capacity to accommodate the volume. | true | None | None |
| `capacity_gib` | Capacity of the volume (in GiB). | true | None | None |
| `protocols` | The protocol of the volume. Allowed combinations are `['NFSV3']`, `['NFSV4']`, `['SMB']`, `['NFSV3', 'NFSV4']`, `['SMB', 'NFSV3']` and `['SMB', 'NFSV4']`. Each value may be one of: `NFSV3`, `NFSV4`, `SMB`. | true | None | None |
| `location` | Name of the pool location. Usually a region name, expect for some STANDARD service level pools which require a zone name. | true | None | None |
| `name` | The name of the volume. Needs to be unique per location. | true | None | None |
| `smb_settings` | Settings for volumes with SMB access. Each value may be one of: `ENCRYPT_DATA`, `BROWSABLE`, `CHANGE_NOTIFY`, `NON_BROWSABLE`, `OPLOCKS`, `SHOW_SNAPSHOT`, `SHOW_PREVIOUS_VERSIONS`, `ACCESS_BASED_ENUMERATION`, `CONTINUOUSLY_AVAILABLE`. | false | None | None |
| `unix_permissions` | Unix permission the mount point will be created with. Default is 0770. Applicable for UNIX security style volumes only. | false | None | None |
| `labels` | Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `snapshot_directory` | If enabled, a NFS volume will contain a read-only .snapshot directory which provides access to each of the volume's snapshots. Will enable "Previous Versions" support for SMB. | false | None | None |
| `security_style` | Security Style of the Volume. Use UNIX to use UNIX or NFSV4 ACLs for file permissions. Use NTFS to use NTFS ACLs for file permissions. Can only be set for volumes which use SMB together with NFS as protocol. Possible values are: `NTFS`, `UNIX`. | false | None | None |
| `kerberos_enabled` | Flag indicating if the volume is a kerberos volume or not, export policy rules control kerberos security modes (krb5, krb5i, krb5p). | false | None | None |
| `restricted_actions` | List of actions that are restricted on this volume. Each value may be one of: `DELETE`. | false | None | None |
| `large_capacity` | Optional. Flag indicating if the volume will be a large capacity volume or a regular volume. | false | None | None |
| `multiple_endpoints` | Optional. Flag indicating if the volume will have an IP address per node for volumes supporting multiple IP endpoints. Only the volume with largeCapacity will be allowed to have multiple endpoints. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
| `deletion_policy` | Volumes may have nested snapshot resources. Deleting such a volume will fail. Setting this parameter to FORCE will delete volumes including nested snapshots. Possible values: DEFAULT, FORCE. | none | None | None |

### export_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `rules` | Export rules (up to 5) control NFS volume access. Structure is [documented below](#nested_export_policy_rules). | true | None | None |

### restore_parameters Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `source_snapshot` | Full name of the snapshot to use for creating this volume. `source_snapshot` and `source_backup` cannot be used simultaneously. Format: `projects/{{project}}/locations/{{location}}/volumes/{{volume}}/snapshots/{{snapshot}}`. | false | None | None |
| `source_backup` | Full name of the backup to use for creating this volume. `source_snapshot` and `source_backup` cannot be used simultaneously. Format: `projects/{{project}}/locations/{{location}}/backupVaults/{{backupVaultId}}/backups/{{backup}}`. | false | None | None |

### snapshot_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Enables automated snapshot creation according to defined schedule. Default is false. To disable automatic snapshot creation you have to remove the whole snapshot_policy block. | false | None | None |
| `hourly_schedule` | Hourly schedule policy. Structure is [documented below](#nested_snapshot_policy_hourly_schedule). | false | None | None |
| `daily_schedule` | Daily schedule policy. Structure is [documented below](#nested_snapshot_policy_daily_schedule). | false | None | None |
| `weekly_schedule` | Weekly schedule policy. Structure is [documented below](#nested_snapshot_policy_weekly_schedule). | false | None | None |
| `monthly_schedule` | Monthly schedule policy. Structure is [documented below](#nested_snapshot_policy_monthly_schedule). | false | None | None |

### backup_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `backup_policies` | Specify a single backup policy ID for scheduled backups. Format: `projects/{{projectId}}/locations/{{location}}/backupPolicies/{{backupPolicyName}}` | false | None | None |
| `backup_vault` | ID of the backup vault to use. A backup vault is reqired to create manual or scheduled backups. Format: `projects/{{projectId}}/locations/{{location}}/backupVaults/{{backupVaultName}}` | false | None | None |
| `scheduled_backup_enabled` | When set to true, scheduled backup is enabled on the volume. Omit if no backup_policy is specified. | false | None | None |

### tiering_policy Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `cooling_threshold_days` | Optional. Time in days to mark the volume's data block as cold and make it eligible for tiering, can be range from 2-183. Default is 31. | false | None | None |
| `tier_action` | Optional. Flag indicating if the volume has tiering policy enable/pause. Default is PAUSED. Default value is `PAUSED`. Possible values are: `ENABLED`, `PAUSED`. | false | None | None |
| `hot_tier_bypass_mode_enabled` | , [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Optional. Flag indicating that the hot tier bypass mode is enabled. Default is false. Only applicable to Flex service level. | false | None | None |

### hybrid_replication_parameters Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `replication` | Required. Desired name for the replication of this volume. | false | None | None |
| `peer_volume_name` | Required. Name of the user's local source volume to be peered with the destination volume. | false | None | None |
| `peer_cluster_name` | Required. Name of the user's local source cluster to be peered with the destination cluster. | false | None | None |
| `peer_svm_name` | Required. Name of the user's local source vserver svm to be peered with the destination vserver svm. | false | None | None |
| `peer_ip_addresses` | Required. List of node ip addresses to be peered with. | false | None | None |
| `cluster_location` | Optional. Name of source cluster location associated with the Hybrid replication. This is a free-form field for the display purpose only. | false | None | None |
| `description` | Optional. Description of the replication. | false | None | None |
| `labels` | Optional. Labels to be added to the replication as the key value pairs. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. | false | None | None |

### rules Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allowed_clients` | Defines the client ingress specification (allowed clients) as a comma separated list with IPv4 CIDRs or IPv4 host addresses. | false | None | None |
| `has_root_access` | If enabled, the root user (UID = 0) of the specified clients doesn't get mapped to nobody (UID = 65534). This is also known as no_root_squash. | false | None | None |
| `access_type` | Defines the access type for clients matching the `allowedClients` specification. Possible values are: `READ_ONLY`, `READ_WRITE`, `READ_NONE`. | false | None | None |
| `nfsv3` | Enable to apply the export rule to NFSV3 clients. | false | None | None |
| `nfsv4` | Enable to apply the export rule to NFSV4.1 clients. | false | None | None |
| `kerberos5_read_only` | If enabled (true) the rule defines a read only access for clients matching the 'allowedClients' specification. It enables nfs clients to mount using 'authentication' kerberos security mode. | false | None | None |
| `kerberos5_read_write` | If enabled (true) the rule defines read and write access for clients matching the 'allowedClients' specification. It enables nfs clients to mount using 'authentication' kerberos security mode. The 'kerberos5ReadOnly' value is ignored if this is enabled. | false | None | None |
| `kerberos5i_read_only` | If enabled (true) the rule defines a read only access for clients matching the 'allowedClients' specification. It enables nfs clients to mount using 'integrity' kerberos security mode. | false | None | None |
| `kerberos5i_read_write` | If enabled (true) the rule defines read and write access for clients matching the 'allowedClients' specification. It enables nfs clients to mount using 'integrity' kerberos security mode. The 'kerberos5iReadOnly' value is ignored if this is enabled. | false | None | None |
| `kerberos5p_read_only` | If enabled (true) the rule defines a read only access for clients matching the 'allowedClients' specification. It enables nfs clients to mount using 'privacy' kerberos security mode. | false | None | None |
| `kerberos5p_read_write` | If enabled (true) the rule defines read and write access for clients matching the 'allowedClients' specification. It enables nfs clients to mount using 'privacy' kerberos security mode. The 'kerberos5pReadOnly' value is ignored if this is enabled. | false | None | None |

### hourly_schedule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `snapshots_to_keep` | The maximum number of snapshots to keep for the hourly schedule. | true | None | None |
| `minute` | Set the minute of the hour to create the snapshot (0-59), defaults to the top of the hour (0). | false | None | None |

### daily_schedule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `snapshots_to_keep` | The maximum number of snapshots to keep for the daily schedule. | true | None | None |
| `minute` | Set the minute of the hour to create the snapshot (0-59), defaults to the top of the hour (0). | false | None | None |
| `hour` | Set the hour to create the snapshot (0-23), defaults to midnight (0). | false | None | None |

### weekly_schedule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `snapshots_to_keep` | The maximum number of snapshots to keep for the weekly schedule. | true | None | None |
| `minute` | Set the minute of the hour to create the snapshot (0-59), defaults to the top of the hour (0). | false | None | None |
| `hour` | Set the hour to create the snapshot (0-23), defaults to midnight (0). | false | None | None |
| `day` | Set the day or days of the week to make a snapshot. Accepts a comma separated days of the week. Defaults to 'Sunday'. | false | None | None |

### monthly_schedule Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `snapshots_to_keep` | The maximum number of snapshots to keep for the monthly schedule | true | None | None |
| `minute` | Set the minute of the hour to create the snapshot (0-59), defaults to the top of the hour (0). | false | None | None |
| `hour` | Set the hour to create the snapshot (0-23), defaults to midnight (0). | false | None | None |
| `days_of_month` | Set the day or days of the month to make a snapshot (1-31). Accepts a comma separated number of days. Defaults to '1'. | false | None | None |
