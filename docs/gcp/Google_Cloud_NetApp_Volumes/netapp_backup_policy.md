## 🛡️ Policy Deployment Engine: `netapp_backup_policy`

This section provides a concise policy evaluation for the `netapp_backup_policy` resource in GCP.

Reference: [Terraform Registry – netapp_backup_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_backup_policy)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `daily_backup_limit` | Number of daily backups to retain (minimum 2). | true | true | Defines baseline retention to support recovery objectives. | 7 | 1 |
| `weekly_backup_limit` | Number of weekly backups to keep. Note that the sum of daily, weekly and monthly backups should be greater than 1. | true | false | None | None | None |
| `monthly_backup_limit` | Number of monthly backups to keep. Note that the sum of daily, weekly and monthly backups should be greater than 1. | true | false | None | None | None |
| `location` | Region where this backup policy applies. | true | true | Backups must remain within approved jurisdictions. | australia-southeast2 | us-central1 |
| `name` | The name of the backup policy. Needs to be unique per location. | true | false | None | None | None |
| `labels` | Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `description` | An optional description of this resource. | false | false | None | None | None |
| `enabled` | If enabled, make backups automatically according to the schedules. This will be applied to all volumes that have this policy attached and enforced on volume level. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
