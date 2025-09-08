## 🛡️ Policy Deployment Engine: `backup_dr_backup_vault`

This section provides a concise policy evaluation for the `backup_dr_backup_vault` resource in GCP.

Reference: [Terraform Registry – backup_dr_backup_vault](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/backup_dr_backup_vault)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `backup_minimum_enforced_retention_duration` | Required. The default and minimum enforced retention for each backup within the backup vault. The enforced retention for each backup can be extended. | true | None | None |
| `location` | The GCP location for the backup vault. | true | None | None |
| `backup_vault_id` | Required. ID of the requesting object. | true | None | None |
| `description` | Optional. The description of the BackupVault instance (2048 characters or less). | false | None | None |
| `labels` | Optional. Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `effective_time` | Optional. Time after which the BackupVault resource is locked. | false | None | None |
| `annotations` | Optional. User annotations. See https://google.aip.dev/128#annotations Stores small amounts of arbitrary data. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource. | false | None | None |
| `access_restriction` | Access restriction for the backup vault. Default value is `WITHIN_ORGANIZATION` if not provided during creation. Default value is `WITHIN_ORGANIZATION`. Possible values are: `ACCESS_RESTRICTION_UNSPECIFIED`, `WITHIN_PROJECT`, `WITHIN_ORGANIZATION`, `UNRESTRICTED`, `WITHIN_ORG_BUT_UNRESTRICTED_FOR_BA`. | false | None | None |
| `backup_retention_inheritance` | How a backup's enforced retention end time is inherited. Default value is `INHERIT_VAULT_RETENTION` if not provided during creation. Possible values are: `BACKUP_RETENTION_INHERITANCE_UNSPECIFIED`, `INHERIT_VAULT_RETENTION`, `MATCH_BACKUP_EXPIRE_TIME`. | false | None | None |
| `force_update` | If set, allow update to extend the minimum enforced retention for backup vault. This overrides the restriction against conflicting retention periods. This conflict may occur when the expiration schedule defined by the associated backup plan is shorter than the minimum retention set by the backup vault. | false | None | None |
| `force_delete` | , Deprecated) If set, the following restrictions against deletion of the backup vault instance can be overridden: * deletion of a backup vault instance containing no backups, but still containing empty datasources. * deletion of a backup vault instance that is being referenced by an active backup plan. ~> **Warning:** `force_delete` is deprecated and will be removed in a future major release. Use `ignore_inactive_datasources` instead. | false | None | None |
| `ignore_inactive_datasources` | If set, the following restrictions against deletion of the backup vault instance can be overridden: * deletion of a backup vault instance containing no backups, but still containing empty datasources. | false | None | None |
| `ignore_backup_plan_references` | If set, the following restrictions against deletion of the backup vault instance can be overridden: * deletion of a backup vault instance that is being referenced by an active backup plan. | false | None | None |
| `allow_missing` | Allow idempotent deletion of backup vault. The request will still succeed in case the backup vault does not exist. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
