## 🛡️ Policy Deployment Engine: `netapp_volume`

This section provides a concise policy evaluation for the `netapp_volume` resource in GCP.

Reference: [Terraform Registry – netapp_volume](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_volume)

---

## 1. Argument Reference

### `share_name`
- Description: (Required) Share name (SMB) or export path (NFS) of the volume. Needs to be unique per location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `storage_pool`
- Description: (Required) Name of the storage pool to create the volume in. Pool needs enough spare capacity to accommodate the volume.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `capacity_gib`
- Description: (Required) Capacity of the volume (in GiB).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `protocols`
- Description: (Required) The protocol of the volume. Allowed combinations are `['NFSV3']`, `['NFSV4']`, `['SMB']`, `['NFSV3', 'NFSV4']`, `['SMB', 'NFSV3']` and `['SMB', 'NFSV4']`. Each value may be one of: `NFSV3`, `NFSV4`, `SMB`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Name of the pool location. Usually a region name, expect for some STANDARD service level pools which require a zone name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the volume. Needs to be unique per location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `export_policy`
- Description: (Optional) Export policy of the volume for NFSV3 and/or NFSV4.1 access. Structure is [documented below](#nested_export_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `smb_settings`
- Description: (Optional) Settings for volumes with SMB access. Each value may be one of: `ENCRYPT_DATA`, `BROWSABLE`, `CHANGE_NOTIFY`, `NON_BROWSABLE`, `OPLOCKS`, `SHOW_SNAPSHOT`, `SHOW_PREVIOUS_VERSIONS`, `ACCESS_BASED_ENUMERATION`, `CONTINUOUSLY_AVAILABLE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `unix_permissions`
- Description: (Optional) Unix permission the mount point will be created with. Default is 0770. Applicable for UNIX security style volumes only.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `snapshot_directory`
- Description: (Optional) If enabled, a NFS volume will contain a read-only .snapshot directory which provides access to each of the volume's snapshots. Will enable "Previous Versions" support for SMB.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_style`
- Description: (Optional) Security Style of the Volume. Use UNIX to use UNIX or NFSV4 ACLs for file permissions. Use NTFS to use NTFS ACLs for file permissions. Can only be set for volumes which use SMB together with NFS as protocol. Possible values are: `NTFS`, `UNIX`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kerberos_enabled`
- Description: (Optional) Flag indicating if the volume is a kerberos volume or not, export policy rules control kerberos security modes (krb5, krb5i, krb5p).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `restore_parameters`
- Description: (Optional) Used to create this volume from a snapshot (= cloning) or an backup. Structure is [documented below](#nested_restore_parameters).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `restricted_actions`
- Description: (Optional) List of actions that are restricted on this volume. Each value may be one of: `DELETE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `snapshot_policy`
- Description: (Optional) Snapshot policy defines the schedule for automatic snapshot creation. To disable automatic snapshot creation you have to remove the whole snapshot_policy block. Structure is [documented below](#nested_snapshot_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_config`
- Description: (Optional) Backup configuration for the volume. Structure is [documented below](#nested_backup_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `large_capacity`
- Description: (Optional) Optional. Flag indicating if the volume will be a large capacity volume or a regular volume.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `multiple_endpoints`
- Description: (Optional) Optional. Flag indicating if the volume will have an IP address per node for volumes supporting multiple IP endpoints. Only the volume with largeCapacity will be allowed to have multiple endpoints.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tiering_policy`
- Description: (Optional) Tiering policy for the volume. Structure is [documented below](#nested_tiering_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hybrid_replication_parameters`
- Description: (Optional) The Hybrid Replication parameters for the volume. Structure is [documented below](#nested_hybrid_replication_parameters).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_policy`
- Description: Volumes may have nested snapshot resources. Deleting such a volume will fail. Setting this parameter to FORCE will delete volumes including nested snapshots. Possible values: DEFAULT, FORCE. <a name="nested_export_policy"></a>The `export_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rules`
- Description: (Required) Export rules (up to 5) control NFS volume access. Structure is [documented below](#nested_export_policy_rules). <a name="nested_export_policy_rules"></a>The `rules` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_clients`
- Description: (Optional) Defines the client ingress specification (allowed clients) as a comma separated list with IPv4 CIDRs or IPv4 host addresses.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `has_root_access`
- Description: (Optional) If enabled, the root user (UID = 0) of the specified clients doesn't get mapped to nobody (UID = 65534). This is also known as no_root_squash.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_type`
- Description: (Optional) Defines the access type for clients matching the `allowedClients` specification. Possible values are: `READ_ONLY`, `READ_WRITE`, `READ_NONE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nfsv3`
- Description: (Optional) Enable to apply the export rule to NFSV3 clients.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `nfsv4`
- Description: (Optional) Enable to apply the export rule to NFSV4.1 clients.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kerberos5_read_only`
- Description: (Optional) If enabled (true) the rule defines a read only access for clients matching the 'allowedClients' specification. It enables nfs clients to mount using 'authentication' kerberos security mode.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kerberos5_read_write`
- Description: (Optional) If enabled (true) the rule defines read and write access for clients matching the 'allowedClients' specification. It enables nfs clients to mount using 'authentication' kerberos security mode. The 'kerberos5ReadOnly' value is ignored if this is enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kerberos5i_read_only`
- Description: (Optional) If enabled (true) the rule defines a read only access for clients matching the 'allowedClients' specification. It enables nfs clients to mount using 'integrity' kerberos security mode.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kerberos5i_read_write`
- Description: (Optional) If enabled (true) the rule defines read and write access for clients matching the 'allowedClients' specification. It enables nfs clients to mount using 'integrity' kerberos security mode. The 'kerberos5iReadOnly' value is ignored if this is enabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kerberos5p_read_only`
- Description: (Optional) If enabled (true) the rule defines a read only access for clients matching the 'allowedClients' specification. It enables nfs clients to mount using 'privacy' kerberos security mode.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kerberos5p_read_write`
- Description: (Optional) If enabled (true) the rule defines read and write access for clients matching the 'allowedClients' specification. It enables nfs clients to mount using 'privacy' kerberos security mode. The 'kerberos5pReadOnly' value is ignored if this is enabled. <a name="nested_restore_parameters"></a>The `restore_parameters` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_snapshot`
- Description: (Optional) Full name of the snapshot to use for creating this volume. `source_snapshot` and `source_backup` cannot be used simultaneously. Format: `projects/{{project}}/locations/{{location}}/volumes/{{volume}}/snapshots/{{snapshot}}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_backup`
- Description: (Optional) Full name of the backup to use for creating this volume. `source_snapshot` and `source_backup` cannot be used simultaneously. Format: `projects/{{project}}/locations/{{location}}/backupVaults/{{backupVaultId}}/backups/{{backup}}`. <a name="nested_snapshot_policy"></a>The `snapshot_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Enables automated snapshot creation according to defined schedule. Default is false. To disable automatic snapshot creation you have to remove the whole snapshot_policy block.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hourly_schedule`
- Description: (Optional) Hourly schedule policy. Structure is [documented below](#nested_snapshot_policy_hourly_schedule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `daily_schedule`
- Description: (Optional) Daily schedule policy. Structure is [documented below](#nested_snapshot_policy_daily_schedule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weekly_schedule`
- Description: (Optional) Weekly schedule policy. Structure is [documented below](#nested_snapshot_policy_weekly_schedule).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `monthly_schedule`
- Description: (Optional) Monthly schedule policy. Structure is [documented below](#nested_snapshot_policy_monthly_schedule). <a name="nested_snapshot_policy_hourly_schedule"></a>The `hourly_schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `snapshots_to_keep`
- Description: (Required) The maximum number of snapshots to keep for the hourly schedule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minute`
- Description: (Optional) Set the minute of the hour to create the snapshot (0-59), defaults to the top of the hour (0). <a name="nested_snapshot_policy_daily_schedule"></a>The `daily_schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `snapshots_to_keep`
- Description: (Required) The maximum number of snapshots to keep for the daily schedule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minute`
- Description: (Optional) Set the minute of the hour to create the snapshot (0-59), defaults to the top of the hour (0).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hour`
- Description: (Optional) Set the hour to create the snapshot (0-23), defaults to midnight (0). <a name="nested_snapshot_policy_weekly_schedule"></a>The `weekly_schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `snapshots_to_keep`
- Description: (Required) The maximum number of snapshots to keep for the weekly schedule.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minute`
- Description: (Optional) Set the minute of the hour to create the snapshot (0-59), defaults to the top of the hour (0).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hour`
- Description: (Optional) Set the hour to create the snapshot (0-23), defaults to midnight (0).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day`
- Description: (Optional) Set the day or days of the week to make a snapshot. Accepts a comma separated days of the week. Defaults to 'Sunday'. <a name="nested_snapshot_policy_monthly_schedule"></a>The `monthly_schedule` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `snapshots_to_keep`
- Description: (Required) The maximum number of snapshots to keep for the monthly schedule
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `minute`
- Description: (Optional) Set the minute of the hour to create the snapshot (0-59), defaults to the top of the hour (0).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hour`
- Description: (Optional) Set the hour to create the snapshot (0-23), defaults to midnight (0).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `days_of_month`
- Description: (Optional) Set the day or days of the month to make a snapshot (1-31). Accepts a comma separated number of days. Defaults to '1'. <a name="nested_backup_config"></a>The `backup_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_policies`
- Description: (Optional) Specify a single backup policy ID for scheduled backups. Format: `projects/{{projectId}}/locations/{{location}}/backupPolicies/{{backupPolicyName}}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_vault`
- Description: (Optional) ID of the backup vault to use. A backup vault is reqired to create manual or scheduled backups. Format: `projects/{{projectId}}/locations/{{location}}/backupVaults/{{backupVaultName}}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scheduled_backup_enabled`
- Description: (Optional) When set to true, scheduled backup is enabled on the volume. Omit if no backup_policy is specified. <a name="nested_tiering_policy"></a>The `tiering_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cooling_threshold_days`
- Description: (Optional) Optional. Time in days to mark the volume's data block as cold and make it eligible for tiering, can be range from 2-183. Default is 31.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tier_action`
- Description: (Optional) Optional. Flag indicating if the volume has tiering policy enable/pause. Default is PAUSED. Default value is `PAUSED`. Possible values are: `ENABLED`, `PAUSED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hot_tier_bypass_mode_enabled`
- Description: (Optional, [Beta](https://terraform.io/docs/providers/google/guides/provider_versions.html)) Optional. Flag indicating that the hot tier bypass mode is enabled. Default is false. Only applicable to Flex service level. <a name="nested_hybrid_replication_parameters"></a>The `hybrid_replication_parameters` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `replication`
- Description: (Optional) Required. Desired name for the replication of this volume.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peer_volume_name`
- Description: (Optional) Required. Name of the user's local source volume to be peered with the destination volume.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peer_cluster_name`
- Description: (Optional) Required. Name of the user's local source cluster to be peered with the destination cluster.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peer_svm_name`
- Description: (Optional) Required. Name of the user's local source vserver svm to be peered with the destination vserver svm.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `peer_ip_addresses`
- Description: (Optional) Required. List of node ip addresses to be peered with.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cluster_location`
- Description: (Optional) Optional. Name of source cluster location associated with the Hybrid replication. This is a free-form field for the display purpose only.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. Description of the replication.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional. Labels to be added to the replication as the key value pairs. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
