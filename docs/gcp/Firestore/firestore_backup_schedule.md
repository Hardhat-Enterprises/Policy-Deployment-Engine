## 🛡️ Policy Deployment Engine: `firestore_backup_schedule`

This section provides a concise policy evaluation for the `firestore_backup_schedule` resource in GCP.

Reference: [Terraform Registry – firestore_backup_schedule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_backup_schedule)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `retention` | Firestore backup schedules must retain backups for at least 7 days (604800 seconds). | true | false | None | None | None |
| `daily_recurrence` | Firestore backup schedules must use daily_recurrence to ensure daily backups. | true | false | None | None | None |
| `weekly_recurrence` | For a schedule that runs weekly on a specific day. Structure is [documented below](#nested_weekly_recurrence).Firestore backup schedules must use weekly_recurrence to guarantee weekly backups. | true | false | None | None | None |
| `database` | The Firestore database id. Defaults to `"(default)"`. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |

### weekly_recurrence Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `day` | The day of week to run. Possible values are: `DAY_OF_WEEK_UNSPECIFIED`, `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | false | false | None | None | None |
