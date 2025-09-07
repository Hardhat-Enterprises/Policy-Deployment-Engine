## 🛡️ Policy Deployment Engine: `netapp_backup_vault`

This section provides a concise policy evaluation for the `netapp_backup_vault` resource in GCP.

Reference: [Terraform Registry – netapp_backup_vault](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_backup_vault)

---

## 1. Argument Reference

### `location`
- Description: (Required) Location (region) of the backup vault.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The resource name of the backup vault. Needs to be unique per location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_vault_type`
- Description: (Optional) Type of the backup vault to be created. Default is IN_REGION. Possible values are: `BACKUP_VAULT_TYPE_UNSPECIFIED`, `IN_REGION`, `CROSS_REGION`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_region`
- Description: (Optional) Region in which backup is stored.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_retention_policy`
- Description: (Optional) Backup retention policy defining the retention of the backups. Structure is [documented below](#nested_backup_retention_policy).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_backup_retention_policy"></a>The `backup_retention_policy` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `backup_minimum_enforced_retention_days`
- Description: (Required) Minimum retention duration in days for backups in the backup vault.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `daily_backup_immutable`
- Description: (Optional) Indicates if the daily backups are immutable. At least one of daily_backup_immutable, weekly_backup_immutable, monthly_backup_immutable and manual_backup_immutable must be true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weekly_backup_immutable`
- Description: (Optional) Indicates if the weekly backups are immutable. At least one of daily_backup_immutable, weekly_backup_immutable, monthly_backup_immutable and manual_backup_immutable must be true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `monthly_backup_immutable`
- Description: (Optional) Indicates if the monthly backups are immutable. At least one of daily_backup_immutable, weekly_backup_immutable, monthly_backup_immutable and manual_backup_immutable must be true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `manual_backup_immutable`
- Description: (Optional) Indicates if the manual backups are immutable. At least one of daily_backup_immutable, weekly_backup_immutable, monthly_backup_immutable and manual_backup_immutable must be true.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
