## 🛡️ Policy Deployment Engine: `backup_dr_backup_vault`

This section provides a concise policy evaluation for the `backup_dr_backup_vault` resource in GCP.

Reference: [Terraform Registry – backup_dr_backup_vault](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/backup_dr_backup_vault)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `backup_minimum_enforced_retention_duration` | Required. Minimum enforced retention duration for backups stored in the backup vault. Minimum enforced retention duration should be at least 100000s | true | true | Prevents premature deletion of backups and supports recovery and retention requirements. | ['100000s'] | ['1000s'] |
| `location` | Required. The GCP location for the backup vault should be on approved region. | true | true | Location determines physical hosting region and data residency. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1'] |
| `backup_vault_id` | Required. ID of the requesting object. | true | false |  This field is an identifier used for referencing the backup vault. | None | None |
| `description` | Optional. The description of the BackupVault instance (2048 characters or less). | false | false | Description has no impact on the security of the resource or data contained. | None | None |
| `labels` | Optional. Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Labels have no impact on the security of the resource or data contained. | None | None |
| `effective_time` | Optional. Time after which the BackupVault resource is locked. | false | false | Effective time has no impact on the security of the resource or data contained. | None | None |
| `annotations` | Optional. User annotations. See https://google.aip.dev/128#annotations Stores small amounts of arbitrary data. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | false | Annotations have no impact on the security of the resource or data contained. | None | None |
| `access_restriction` | Required. Specifies the access restriction level for the backup vault. Restricted WITHIN_ORGANIZATION only | true | true | Controls where backup data can be accessed from. Unrestricted access increases threats | ['WITHIN_ORGANIZATION'] | ['UNRESTRICTED'] |
| `backup_retention_inheritance` | How a backup's enforced retention end time is inherited. Default value is `INHERIT_VAULT_RETENTION` if not provided during creation. Possible values are: `BACKUP_RETENTION_INHERITANCE_UNSPECIFIED`, `INHERIT_VAULT_RETENTION`, `MATCH_BACKUP_EXPIRE_TIME`. | true | true | Inheritance ensures retention policies defined at the backup vault level are consistently enforced. | None | None |
| `force_update` | Required. Forces updates to the backup vault configuration even if they might disrupt operations. | true | true | Force updates may override protective measures and result in unwanted changes to configuration or data. | [False] | [True] |
| `force_delete` | Overrides deletion safeguards and allows forced deletion of a backup vault. | true | true | Forcing deletion of a backup vault can result in permanent loss of backup data. | None | None |
| `ignore_inactive_datasources` | If set, the following restrictions against deletion of the backup vault instance can be overridden: * deletion of a backup vault instance containing no backups, but still containing empty datasources. | false | false | Deletion behavior option; not enforced by policy. | None | None |
| `ignore_backup_plan_references` | If set, the following restrictions against deletion of the backup vault instance can be overridden: * deletion of a backup vault instance that is being referenced by an active backup plan. | false | false | Deletion behavior option; not enforced by policy. | None | None |
| `allow_missing` | Allow idempotent deletion of backup vault. The request will still succeed in case the backup vault does not exist. | false | false | Idempotent delete behavior; not enforced by policy. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | even without manual ID configuration ID will be automatically generated. | None | None |
