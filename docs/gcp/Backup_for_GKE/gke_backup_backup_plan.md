## 🛡️ Policy Deployment Engine: `gke_backup_backup_plan`

This section provides a concise policy evaluation for the `gke_backup_backup_plan` resource in GCP.

Reference: [Terraform Registry – gke_backup_backup_plan](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_backup_backup_plan)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The full name of the BackupPlan Resource. | true | false | Resource identification has no direct security impact but is essential for governance and operational management. | production-backup-plan | plan123 |
| `cluster` | The source cluster from which Backups will be created via this BackupPlan. | true | true | Defines which cluster's data will be backed up. Must reference approved production clusters to ensure backup policies apply to correct workloads. | projects/fluent-coder-468700-h4/locations/australia-southeast1/clusters/prod-cluster | projects/external-project/locations/us-central1/clusters/unknown-cluster |
| `location` | The region of the Backup Plan. | true | true | Determines data residency for backup operations. Must align with approved regions for compliance with data protection regulations. | australia-southeast1 | us-central1 |
| `retention_policy` | RetentionPolicy governs lifecycle of Backups created under this plan. Structure is [documented below](#nested_retention_policy). | false | true | Critical for data protection and compliance. Proper retention ensures backup availability for disaster recovery while meeting regulatory requirements for data lifecycle management. | Refer to child arguments | Refer to child arguments |
| `backup_config` | Defines the configuration of Backups created via this BackupPlan. Structure is [documented below](#nested_backup_config). | false | true | Controls what data is backed up and how it's protected. Critical for ensuring sensitive data is properly encrypted and backup scope meets security requirements. | Refer to child arguments | Refer to child arguments |
| `labels` | Description: A set of custom labels supplied by the user. A list of key->value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | true | Essential for governance, security classification, and policy enforcement. Proper labeling enables automated security controls and compliance auditing. | {"environment": "production", "security-level": "high", "backup-tier": "critical"} | {"env": "test"} |
| `project` | If it is not provided, the provider project is used. | false | false | Project context for resource creation, typically inherited from provider configuration. | fluent-coder-468700-h4 | None |

### retention_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `backup_delete_lock_days` | Minimum age for a Backup created via this BackupPlan (in days). Must be an integer value between 0-90 (inclusive). A Backup created under this BackupPlan will not be deletable until it reaches Backup's (create time + backup_delete_lock_days). Updating this field of a BackupPlan does not affect existing Backups. Backups created after a successful update will inherit this new value. | false | true | Prevents premature deletion of backups, ensuring minimum retention period for compliance and disaster recovery. Critical protection against accidental or malicious backup deletion. | 7 | 1 |
| `backup_retain_days` | The default maximum age of a Backup created via this BackupPlan. This field MUST be an integer value >= 0 and <= 365. If specified, a Backup created under this BackupPlan will be automatically deleted after its age reaches (createTime + backupRetainDays). If not specified, Backups created under this BackupPlan will NOT be subject to automatic deletion. Updating this field does NOT affect existing Backups under it. Backups created AFTER a successful update will automatically pick up the new value. NOTE: backupRetainDays must be >= backupDeleteLockDays. If cronSchedule is defined, then this must be <= 360 * the creation interval. If rpo_config is defined, then this must be <= 360 * targetRpoMinutes/(1440minutes/day) | false | true | Defines how long backup data is available for recovery operations. Must balance storage costs with recovery requirements and compliance obligations. | 30 | 7 |
| `locked` | This flag denotes whether the retention policy of this BackupPlan is locked. If set to True, no further update is allowed on this policy, including the locked field itself. | false | true | Prevents unauthorized modification of retention policies after implementation, ensuring compliance requirements cannot be circumvented. | true | false |

### backup_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `include_volume_data` | This flag specifies whether volume data should be backed up when PVCs are included in the scope of a Backup. | false | true | Determines if persistent volume data is included in backups. Critical for complete disaster recovery capability of stateful applications. | true | false |
| `include_secrets` | This flag specifies whether Kubernetes Secret resources should be included when they fall into the scope of Backups. | false | true | Controls whether sensitive configuration data (secrets) is backed up. Must balance complete recovery capability with security risk of backing up sensitive data. | true | false |
| `encryption_key` | This defines a customer managed encryption key that will be used to encrypt the "config" portion (the Kubernetes resources) of Backups created via this plan. Structure is [documented below](#nested_backup_config_encryption_key). | false | true | Encryption is mandatory for protecting backup data containing sensitive information. Customer-managed keys provide better security control than default encryption. | Refer to child arguments | null (no encryption configured) |
| `all_namespaces` | If True, include all namespaced resources. | false | true | Determines backup scope. Backing up all namespaces ensures complete recovery but may include sensitive or unnecessary data. Requires careful consideration. | true | None |

###   encryption_key Block
  | Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
  |----------|-------------|----------|-----------------|-----------|-----------|---------------|
  | `gcp_kms_encryption_key` | Google Cloud KMS encryption key. Format: projects/*/locations/*/keyRings/*/cryptoKeys/* | true | true | Must use approved KMS keys from the same region for encryption. Critical for data protection and compliance with encryption standards. | projects/fluent-coder-468700-h4/locations/australia-southeast1/keyRings/backup-ring/cryptoKeys/backup-key | projects/fluent-coder-468700-h4/locations/us-central1/keyRings/test-ring/cryptoKeys/test-key |
