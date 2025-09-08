## 🛡️ Policy Deployment Engine: `netapp_backup_policy`

This section provides a concise policy evaluation for the `netapp_backup_policy` resource in GCP.

Reference: [Terraform Registry – netapp_backup_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_backup_policy)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `daily_backup_limit` | Number of daily backups to keep. Note that the minimum daily backup limit is 2. | true | None | None |
| `weekly_backup_limit` | Number of weekly backups to keep. Note that the sum of daily, weekly and monthly backups should be greater than 1. | true | None | None |
| `monthly_backup_limit` | Number of monthly backups to keep. Note that the sum of daily, weekly and monthly backups should be greater than 1. | true | None | None |
| `location` | Name of the region for the policy to apply to. | true | None | None |
| `name` | The name of the backup policy. Needs to be unique per location. | true | None | None |
| `labels` | Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `description` | An optional description of this resource. | false | None | None |
| `enabled` | If enabled, make backups automatically according to the schedules. This will be applied to all volumes that have this policy attached and enforced on volume level. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
