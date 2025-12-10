## 🛡️ Policy Deployment Engine: `netapp_backup_vault`

This section provides a concise policy evaluation for the `netapp_backup_vault` resource in GCP.

Reference: [Terraform Registry – netapp_backup_vault](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_backup_vault)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `location` | Region where the backup vault is created. | true | true | Controls data residency and compliance for where backups are stored. | australia-southeast2 | us-central1 |
| `name` | The resource name of the backup vault. Needs to be unique per location. | true | false | None | None | None |
| `description` | An optional description of this resource. | false | false | None | None | None |
| `labels` | Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `backup_vault_type` | Type of the backup vault to be created. Default is IN_REGION. Possible values are: `BACKUP_VAULT_TYPE_UNSPECIFIED`, `IN_REGION`, `CROSS_REGION`. | false | false | None | None | None |
| `backup_region` | Region in which backup is stored. | false | false | None | None | None |
| `backup_retention_policy` | Backup retention policy defining the retention of the backups. Structure is [documented below](#nested_backup_retention_policy). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |

### backup_retention_policy Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `backup_minimum_enforced_retention_days` | Minimum retention duration in days for backups in the backup vault. | true | false | None | None | None |
| `daily_backup_immutable` | Indicates if the daily backups are immutable. At least one of daily_backup_immutable, weekly_backup_immutable, monthly_backup_immutable and manual_backup_immutable must be true. | false | false | None | None | None |
| `weekly_backup_immutable` | Indicates if the weekly backups are immutable. At least one of daily_backup_immutable, weekly_backup_immutable, monthly_backup_immutable and manual_backup_immutable must be true. | false | false | None | None | None |
| `monthly_backup_immutable` | Indicates if the monthly backups are immutable. At least one of daily_backup_immutable, weekly_backup_immutable, monthly_backup_immutable and manual_backup_immutable must be true. | false | false | None | None | None |
| `manual_backup_immutable` | Indicates if the manual backups are immutable. At least one of daily_backup_immutable, weekly_backup_immutable, monthly_backup_immutable and manual_backup_immutable must be true. | false | false | None | None | None |
