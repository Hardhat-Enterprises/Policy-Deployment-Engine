## 🛡️ Policy Deployment Engine: `firestore_backup_schedule`

This section provides a concise policy evaluation for the `firestore_backup_schedule` resource in GCP.

Reference: [Terraform Registry – firestore_backup_schedule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_backup_schedule)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `retention` | At what relative time in the future, compared to its creation time, the backup should be deleted, e.g. keep backups for 7 days. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". You can set this to a value up to 14 weeks. | true | None | None |
| `daily_recurrence` | For a schedule that runs daily. | false | None | None |
| `database` | The Firestore database id. Defaults to `"(default)"`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### weekly_recurrence Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `day` | The day of week to run. Possible values are: `DAY_OF_WEEK_UNSPECIFIED`, `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`. | false | None | None |
