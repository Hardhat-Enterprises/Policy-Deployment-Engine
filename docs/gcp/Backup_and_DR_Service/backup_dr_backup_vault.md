## 🛡️ Policy Deployment Engine: `backup_dr_backup_vault`

This section provides a concise policy evaluation for the `backup_dr_backup_vault` resource in GCP.

Reference: [Terraform Registry – backup_dr_backup_vault](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/backup_dr_backup_vault)

---

## 1. Argument Reference

### `backup_minimum_enforced_retention_duration`
- Description: (Required) Required. The default and minimum enforced retention for each backup within the backup vault. The enforced retention for each backup can be extended.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The GCP location for the backup vault.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_vault_id`
- Description: (Required) Required. ID of the requesting object.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Optional. The description of the BackupVault instance (2048 characters or less).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional. Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `effective_time`
- Description: (Optional) Optional. Time after which the BackupVault resource is locked.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `annotations`
- Description: (Optional) Optional. User annotations. See https://google.aip.dev/128#annotations Stores small amounts of arbitrary data. **Note**: This field is non-authoritative, and will only manage the annotations present in your configuration. Please refer to the field `effective_annotations` for all of the annotations present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_restriction`
- Description: (Optional) Access restriction for the backup vault. Default value is `WITHIN_ORGANIZATION` if not provided during creation. Default value is `WITHIN_ORGANIZATION`. Possible values are: `ACCESS_RESTRICTION_UNSPECIFIED`, `WITHIN_PROJECT`, `WITHIN_ORGANIZATION`, `UNRESTRICTED`, `WITHIN_ORG_BUT_UNRESTRICTED_FOR_BA`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_retention_inheritance`
- Description: (Optional) How a backup's enforced retention end time is inherited. Default value is `INHERIT_VAULT_RETENTION` if not provided during creation. Possible values are: `BACKUP_RETENTION_INHERITANCE_UNSPECIFIED`, `INHERIT_VAULT_RETENTION`, `MATCH_BACKUP_EXPIRE_TIME`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `force_update`
- Description: (Optional) If set, allow update to extend the minimum enforced retention for backup vault. This overrides the restriction against conflicting retention periods. This conflict may occur when the expiration schedule defined by the associated backup plan is shorter than the minimum retention set by the backup vault.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `force_delete`
- Description: (Optional, Deprecated) If set, the following restrictions against deletion of the backup vault instance can be overridden: * deletion of a backup vault instance containing no backups, but still containing empty datasources. * deletion of a backup vault instance that is being referenced by an active backup plan. ~> **Warning:** `force_delete` is deprecated and will be removed in a future major release. Use `ignore_inactive_datasources` instead.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignore_inactive_datasources`
- Description: (Optional) If set, the following restrictions against deletion of the backup vault instance can be overridden: * deletion of a backup vault instance containing no backups, but still containing empty datasources.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ignore_backup_plan_references`
- Description: (Optional) If set, the following restrictions against deletion of the backup vault instance can be overridden: * deletion of a backup vault instance that is being referenced by an active backup plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_missing`
- Description: (Optional) Allow idempotent deletion of backup vault. The request will still succeed in case the backup vault does not exist.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
