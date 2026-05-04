## 🛡️ Policy Deployment Engine: `google_backup_dr_restore_workload`

This section provides a concise policy evaluation for the `google_backup_dr_restore_workload` resource in GCP.

Reference: [Terraform Registry – google_backup_dr_restore_workload](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_backup_dr_restore_workload)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Required. The location for the backup vault. | true | true | Location is a clear generic security control because it can be enforced through an approved-region whitelist for governance and data residency. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1'] |
| `backup_vault_id` | Required. The ID of the backup vault. | true | false | This is a resource reference rather than a generic explicit security control. | None | None |
| `data_source_id` | Required. The ID of the data source. | true | false | This is a resource reference rather than a generic explicit security control. | None | None |
| `backup_id` | Required. The ID of the backup to restore from. | true | false | This identifies the backup source but is not itself a generic explicit security control. | None | None |
| `name` | Optional, deprecated. The resource name of the backup instance. | false | false | This is deprecated and acts as an identifier rather than a security control. | None | None |
| `request_id` | Optional. An optional request ID to identify requests. | false | false | This is an idempotency and request-tracking field, not a generic explicit security control. | None | None |
| `clear_overrides_field_mask` | Optional. A field mask used to clear server-side default values during restore. | false | false | This is operational restore behavior, not a generic explicit security control. | None | None |
| `delete_restored_instance` | Optional. If true (default), running terraform destroy will delete the live resource in GCP. | false | true | This is a clear generic safeguard because disabling automatic deletion reduces the risk of unintentionally removing restored resources during destroy operations. | [False] | [True] |
| `compute_instance_target_environment` | Optional. The destination environment for GCE VM restoration. | false | false | This is a container block. Security controls apply to specific fields inside it. | None | None |
| `disk_target_environment` | Optional. The destination environment for zonal disk restoration. | false | false | This is a container block. Security controls apply to specific fields inside it. | None | None |
| `region_disk_target_environment` | Optional. The destination environment for regional disk restoration. | false | false | This is a container block. Security controls apply to specific fields inside it. | None | None |
| `compute_instance_restore_properties` | Optional. Compute Engine instance properties to be overridden during restore. | false | false | This is a container block. Security controls apply to specific fields inside it. | None | None |
| `disk_restore_properties` | Optional. Disk properties to be overridden during restore. | false | false | This is a container block. Security controls apply to specific fields inside it. | None | None |

### compute_instance_target_environment Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project` | Required. Target project for the Compute Engine instance. | true | false | Project is an administrative scoping field rather than a direct generic explicit security control. | None | None |
| `zone` | Required. The zone of the Compute Engine instance. | true | false | Zone placement is operational context and is better handled by service-specific validation than a generic explicit security control. | None | None |

### disk_target_environment Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project` | Required. Target project for the disk. | true | false | Project is an administrative scoping field rather than a direct generic explicit security control. | None | None |
| `zone` | Required. Target zone for the disk. | true | false | Zone placement is operational context and is better handled by service-specific validation than a generic explicit security control. | None | None |

### region_disk_target_environment Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `project` | Required. Target project for the disk. | true | false | Project is an administrative scoping field rather than a direct generic explicit security control. | None | None |
| `region` | Required. Target region for the disk. | true | false | Region placement is operational context and is better handled by service-specific validation than a generic explicit security control. | None | None |
| `replica_zones` | Required. Target URLs of the replica zones for the disk. | true | false | This is restore placement logic rather than a generic explicit security control. | None | None |

### compute_instance_restore_properties Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Required. Name of the compute instance. | true | false | Name is an identifier and not a generic explicit security control. | None | None |
| `advanced_machine_features` | Optional. Controls for advanced machine-related behavior features. | false | false | Container block for machine behavior settings, not itself a generic explicit security control. | None | None |
| `can_ip_forward` | Optional. Allows this instance to send and receive packets with non-matching destination or source IPs. | false | true | IP forwarding is a clear generic security control because enabling it expands networking capability and exposure. | [False] | [True] |
| `confidential_instance_config` | Optional. Controls Confidential Compute options on the instance. | false | false | Container block. Security controls apply to fields inside it. | None | None |
| `deletion_protection` | Optional. Whether the resource should be protected against deletion. | false | true | Deletion protection is a clear explicit security control and can be enforced with a simple boolean rule. | [True] | [False] |
| `description` | Optional. An optional description of this resource. | false | false | Description does not affect security enforcement. | None | None |
| `disks` | Optional. Array of disks associated with this instance. | false | false | This is a complex container block and is better handled with custom validation than a generic explicit security control. | None | None |
| `display_device` | Optional. Enables display device for the instance. | false | false | Display enablement is not usually treated as a generic explicit security control in this context. | None | None |
| `guest_accelerators` | Optional. A list of accelerator cards attached to this instance. | false | false | Performance/hardware configuration rather than a generic explicit security control. | None | None |
| `hostname` | Optional. Specifies the hostname of the instance. | false | false | Identifier/operational field, not a generic explicit security control. | None | None |
| `instance_encryption_key` | Optional. Encrypts suspended data for an instance with a customer-managed encryption key. | false | false | This is a container block. Security controls apply to the specific encryption fields inside it rather than to the block itself. | None | None |
| `key_revocation_action_type` | Optional. KeyRevocationActionType of the instance. | false | false | This is conditional key-management behavior rather than a generic explicit security control. | None | None |
| `labels` | Optional. Labels to apply to this instance. | false | false | Labels are metadata rather than a generic explicit security control. | None | None |
| `machine_type` | Optional. Full or partial URL of the machine type resource. | false | false | Sizing/performance field, not a generic explicit security control. | None | None |
| `metadata` | Optional. Includes custom metadata and predefined keys. | false | false | Instance metadata can affect security posture, but the security relevance usually depends on specific metadata keys and values. It is therefore better handled through custom validation rather than as a generic explicit security control. | None | None |
| `min_cpu_platform` | Optional. Minimum CPU platform to use for this instance. | false | false | Hardware preference field, not a generic explicit security control. | None | None |
| `network_interfaces` | Optional. An array of network configurations for this instance. | false | false | This is a container block. Security controls apply to specific fields inside it. | None | None |
| `network_performance_config` | Optional. Configure network performance. | false | false | Performance configuration rather than a generic explicit security control. | None | None |
| `params` | Optional. Additional params passed with the request. | false | false | Container block for ancillary settings, not itself a generic explicit security control. | None | None |
| `private_ipv6_google_access` | Optional. The private IPv6 Google access type for the VM. | false | false | This is conditional networking behavior better handled through custom validation. | None | None |
| `allocation_affinity` | Optional. Specifies the reservations that this instance can consume from. | false | false | Reservation consumption policy is operational rather than a generic explicit security control. | None | None |
| `resource_policies` | Optional. Resource policies applied to this instance. | false | false | This is a resource reference list rather than a generic explicit security control. | None | None |
| `scheduling` | Optional. Sets the scheduling options for this instance. | false | false | Container block for scheduling behavior, not itself a generic explicit security control. | None | None |
| `service_accounts` | Optional. A list of service accounts with scopes. | false | false | This is a container block. Security controls apply to the specific service account and scope values inside it rather than to the block itself. | None | None |
| `shielded_instance_config` | Optional. Controls Shielded compute options on the instance. | false | false | Container block. Security controls apply to fields inside it. | None | None |
| `tags` | Optional. Tags to apply to this instance. | false | false | Tags are metadata rather than a generic explicit security control. | None | None |

###   advanced_machine_features Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `enable_nested_virtualization` | Optional. Whether to enable nested virtualization. | false | false | It does not have security impact. | None | None |
  | `threads_per_core` | Optional. The number of threads per physical core. | false | false | Performance tuning field, not a generic explicit security control. | None | None |
  | `visible_core_count` | Optional. The number of physical cores to expose to an instance. | false | false | Performance sizing field, not a generic explicit security control. | None | None |
  | `enable_uefi_networking` | Optional. Whether to enable UEFI networking for instance creation. | false | false | Boot/network compatibility setting rather than a generic explicit security control. | None | None |

###   confidential_instance_config Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `enable_confidential_compute` | Optional. Defines whether the instance should have confidential compute enabled. | false | true | Confidential Compute is a clear explicit security control and can be enforced with a simple boolean rule. | [True] | [False] |

###   instance_encryption_key Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `raw_key` | Optional. | false | false | Raw key presence is sensitive but better handled through custom validation than a generic explicit control. | None | None |
  | `rsa_encrypted_key` | Optional. | false | false | Key material field better handled through custom validation. | None | None |
  | `kms_key_name` | Optional. The resource name of the Cloud KMS key to use for encryption. | false | true | KMS-based encryption is security-relevant because it controls whether the restored instance uses customer-managed encryption keys for protected data but not writing a policy in T1/2026. | ['projects/my-project-4418-1743628379470/locations/australia-southeast1/keyRings/ring1/cryptoKeys/key1'] | ['projects/my-project-4418-1743628379470/locations/us-central1/keyRings/ring1/cryptoKeys/key1'] |
  | `kms_key_service_account` | Optional. | false | false | Service account selection needs custom validation rather than a simple generic control. | None | None |

###   network_interfaces Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `network` | Optional. URL of the VPC network resource. | false | true | Network attachment is a clear security control because it can be restricted to approved networks, but not writing a policy in T1/2026. | ['projects/my-project-4418-1743628379470/global/networks/approved-network'] | ['projects/my-project-4418-1743628379470/global/networks/default'] |
  | `subnetwork` | Optional. URL of the subnetwork resource. | false | true | Subnetwork attachment is a clear security control because it can be restricted to approved subnetworks, but not writing a policy in T1/2026. | ['projects/my-project-4418-1743628379470/regions/australia-southeast1/subnetworks/approved-subnet'] | ['projects/my-project-4418-1743628379470/regions/australia-southeast1/subnetworks/default'] |
  | `ip_address` | Optional. An IPv4 internal IP address. | false | false | Address selection is operational and better handled through custom validation. | None | None |
  | `ipv6_address` | Optional. An IPv6 internal network address. | false | false | Address selection is operational and better handled through custom validation. | None | None |
  | `internal_ipv6_prefix_length` | Optional. The prefix length of the primary internal IPv6 range. | false | false | Network sizing field, not a generic explicit security control. | None | None |
  | `access_configs` | Optional. | false | false | This is a container block. Security controls apply to the specific fields inside it. | None | None |
  | `ipv6_access_configs` | Optional. | false | true | IPv6 public access configuration is a clear generic security control because it can expose the instance externally, but not writing a policy in T1/2026. | ['Not set'] | ['EXTERNAL'] |
  | `alias_ip_ranges` | Optional. | false | false | Network address allocation logic is operational and better handled through custom validation. | None | None |
  | `stack_type` | Optional. | false | false | Protocol stack choice is generally operational rather than a generic explicit security control. | None | None |
  | `ipv6_access_type` | Optional. | false | false | Addressing mode is better handled through custom validation than a simple generic control. | None | None |
  | `queue_count` | Optional. | false | false | Performance tuning field, not a generic explicit security control. | None | None |
  | `nic_type` | Optional. | false | false | Hardware/network performance field, not a generic explicit security control. | None | None |
  | `network_attachment` | Optional. | false | true | Network attachment is a clear security control because it determines connectivity scope, but not writing a policy in T1/2026. | ['projects/my-project-4418-1743628379470/regions/australia-southeast1/networkAttachments/approved-attachment'] | ['projects/my-project-4418-1743628379470/regions/australia-southeast1/networkAttachments/unapproved-attachment'] |

###     access_configs Block

    | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
    |----------|-------------|----------|-----------------|-----------|-----------|---------------|
    | `type` | Optional. The type of configuration. | false | true | Access config type is a clear explicit security control because it governs external connectivity, but not writing a policy in T1/2026. | ['Not set'] | ['ONE_TO_ONE_NAT'] |
    | `name` | Optional. The name of this access configuration. | false | false | Identifier only. | None | None |
    | `external_ip` | Optional. | false | true | Assigning an external IP is a clear explicit security control because it exposes the instance publicly, but not writing a policy in T1/2026. | ['Not set'] | ['34.0.0.1'] |
    | `external_ipv6` | Optional. | false | true | Assigning an external IPv6 address is a clear explicit security control because it exposes the instance publicly, but not writing a policy in T1/2026. | ['Not set'] | ['2001:db8::1'] |
    | `external_ipv6_prefix_length` | Optional. | false | false | Address sizing field, not a generic explicit security control. | None | None |
    | `set_public_ptr` | Optional. | false | false | DNS pointer behavior is not usually enforced as a generic explicit security control here. | None | None |
    | `public_ptr_domain_name` | Optional. | false | false | DNS naming field, not a generic explicit security control. | None | None |
    | `network_tier` | Optional. | false | false | Networking service tier selection is operational rather than a generic explicit security control. | None | None |

###   service_accounts Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `email` | Optional. The service account email attached to the instance. | false | true | The service account email is security-relevant because it determines the workload identity used by the restored instance, but not writing a policy in T1/2026. | ['approved-sa@tamim-shahriar.iam.gserviceaccount.com'] | ['default-compute@developer.gserviceaccount.com'] |
  | `scopes` | Optional. The OAuth scopes assigned to the service account. | false | true | OAuth scopes are security-relevant because they affect the level of API access available to the attached service account, but not writing a policy in T1/2026. | ['https://www.googleapis.com/auth/logging.write', 'https://www.googleapis.com/auth/monitoring.write'] | ['https://www.googleapis.com/auth/cloud-platform'] |

###   shielded_instance_config Block

  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `enable_secure_boot` | Optional. | false | true | Secure Boot has security impact and can be enforced with a simple boolean rule. | [True] | [False] |
  | `enable_vtpm` | Optional. Enabling TPM (Trusted Platform Module) in Google Cloud is achieved through Shielded VMs, which provide a Virtual Trusted Platform Module (vTPM) 2.0 compliant device | false | true | vTPM is a clear explicit security control and can be enforced with a simple boolean rule. | [True] | [False] |
  | `enable_integrity_monitoring` | Optional. | false | true | Integrity monitoring is an explicit security control and can be enforced with a simple boolean rule. | [True] | [False] |

### disk_restore_properties Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | Required. Name of the disk. | true | false | Identifier only. | None | None |
| `description` | Optional. An optional description of this resource. | false | false | Description does not affect security enforcement. | None | None |
| `size_gb` | Required. The size of the disk in GB. | true | false | Capacity field, not a generic explicit security control. | None | None |
| `licenses` | Optional. A list of publicly available licenses applicable to this backup. | false | false | Licensing metadata rather than a generic explicit security control. | None | None |
| `guest_os_feature` | Optional. A list of features to enable in the guest operating system. | false | false | Feature compatibility/configuration rather than a generic explicit security control. | None | None |
| `disk_encryption_key` | Optional. Encrypts the disk using a customer-supplied encryption key. | false | false | Disk encryption key is a configuration only, does not inherently provide security. | None | None |
| `physical_block_size_bytes` | Optional. Physical block size of the persistent disk. | false | false | Performance/storage tuning field, not a generic explicit security control. | None | None |
| `provisioned_iops` | Optional. Indicates how many IOPS to provision for the disk. | false | false | Performance field, not a generic explicit security control. | None | None |
| `provisioned_throughput` | Optional. Indicates how much throughput to provision for the disk. | false | false | Performance field, not a generic explicit security control. | None | None |
| `enable_confidential_compute` | Optional. Indicates whether this disk is using confidential compute mode. | false | true | Confidential Compute is a clear explicit security control and can be enforced with a simple boolean rule. | [True] | [False] |
| `storage_pool` | Optional. The storage pool in which the new disk is created. | false | false | Placement/operational field rather than a generic explicit security control. | None | None |
| `access_mode` | Optional. The access mode of the disk. | false | true | Access mode is a clear explicit security control because it affects read/write sharing behavior. | ['READ_WRITE_SINGLE'] | ['READ_WRITE_MANY', 'READ_ONLY_MANY'] |
| `architecture` | Optional. The architecture of the source disk. | false | false | Compatibility field rather than a generic explicit security control. | None | None |
| `resource_policy` | Optional. Resource policies applied to this disk. | false | false | Resource reference rather than a generic explicit security control. | None | None |
| `type` | Required. URL of the disk type resource describing which disk type to use. | true | false | Disk type choice is usually performance/compatibility driven rather than a generic explicit security control. | None | None |
| `labels` | Optional. Labels to apply to this disk. | false | false | Labels are metadata rather than a generic explicit security control. | None | None |
| `resource_manager_tags` | Optional. Resource manager tags to be bound to the disk. | false | false | Tags are governance metadata but not a generic explicit security control by themselves in this schema. | None | None |
