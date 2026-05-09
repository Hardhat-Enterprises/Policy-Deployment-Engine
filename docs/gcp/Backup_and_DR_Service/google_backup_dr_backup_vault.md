## 🛡️ Policy Deployment Engine: `google_backup_dr_backup_vault`

This section provides a concise policy evaluation for the `google_backup_dr_backup_vault` resource in GCP.

Reference: [Terraform Registry – google_backup_dr_backup_vault](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_backup_dr_backup_vault)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `backup_minimum_enforced_retention_duration` | Required. Minimum enforced retention duration for backups stored in the backup vault. Minimum enforced retention duration should be at least 100000s | true | true | Minimum enforced retention needs security policy because it can be enforced through a simple minimum or range-based rule to reduce early deletion risk. | ['300000s'] | ['1000s'] |
| `location` | Required. The GCP location for the backup vault should be on approved region. | true | true | Location determines physical hosting region and data residency. Location has security policy because it can be enforced through an approved-region whitelist for governance and data residency. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1'] |
| `backup_vault_id` | Required. ID of the requesting object. | true | false | Backup vault ID is an identifier and does not have any security implications. | None | None |
| `description` | Optional. The description of the BackupVault instance (2048 characters or less). | false | false | Description has no impact on the security of the resource or data contained. | None | None |
| `labels` | Optional. Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Labels have no impact on the security of the resource or data contained. | None | None |
| `effective_time` | Optional. It is the time after which the BackupVault resource is locked. | false | false | Effective time has no impact on the security of the resource or data contained. | None | None |
| `annotations` | Optional. User annotations. See https://google.aip.dev/128#annotations Stores small amounts of arbitrary data. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Annotations have no impact on the security of the resource or data contained. | None | None |
| `access_restriction` | Optional. Specifies the access restriction level for the backup vault. Restricted WITHIN_ORGANIZATION only | false | true | Access restriction has security impact because it can be enforced through a whitelist of approved restrictive values to limit exposure. | ['WITHIN_ORGANIZATION'] | ['UNRESTRICTED'] |
| `backup_retention_inheritance` | Optional. How a backup's enforced retention end time is inherited. Default value is `INHERIT_VAULT_RETENTION` if not provided during creation. Possible values are: `BACKUP_RETENTION_INHERITANCE_UNSPECIFIED`, `INHERIT_VAULT_RETENTION`, `MATCH_BACKUP_EXPIRE_TIME`. | false | false | This affects retention behavior, but it is service-specific and better handled through custom validation rather than an explicit security control. | None | None |
| `encryption_config` | Optional. Encryption configuration for the backup vault. | false | false | This is a container block. Controls apply to specific fields inside it. | None | None |
| `force_update` | Optional. If set, allow update to extend the minimum enforced retention for backup vault. This overrides the restriction against conflicting retention periods. This conflict may occur when the expiration schedule defined by the associated backup plan is shorter than the minimum retention set by the backup vault. | false | true | Force updates may override protective measures and result in unwanted changes to configuration or data. | [False] | [True] |
| `force_delete` | Optional. Overrides deletion safeguards and allows forced deletion of a backup vault. | false | true | Forcing deletion of a backup vault can result in permanent loss of backup data, but it is deprecated | [False] | [True] |
| `ignore_inactive_datasources` | Optional. If set, the following restrictions against deletion of the backup vault instance can be overridden: * deletion of a backup vault instance containing no backups, but still containing empty datasources. | false | false | Deletion behavior option; not enforced by policy. | None | None |
| `ignore_backup_plan_references` | Optional. If set, the following restrictions against deletion of the backup vault instance can be overridden: * deletion of a backup vault instance that is being referenced by an active backup plan. | false | false | Deletion behavior option; not enforced by policy. | None | None |
| `allow_missing` | Optional. Allow idempotent deletion of backup vault. The request will still succeed in case the backup vault does not exist. | false | false | Idempotent delete behavior; not enforced by policy. | None | None |
| `project` | Optional. If it is not provided, the provider project is used. | false | false | Project is an administrative scoping field used to determine where the resource is created. It does not directly define or enforce a generic explicit security control for the vault itself. | None | None |

### encryption_config Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `kms_key_name` | Optional. The Resource name of the Cloud KMS key to be used to encrypt new backups. The key must be in the same location as the backup vault. The key must be a Cloud KMS CryptoKey. | false | true | KMS-based encryption has security impacts, although the exact key validation is usually organization-specific, but not writing a policy in T1/26 | ['projects/my-project-4418-1743628379470/locations/australia-southeast1/keyRings/ring1/cryptoKeys/key1'] | ['projects/my-project-4418-1743628379470/locations/us-central1/keyRings/ring1/cryptoKeys/key1'] |
