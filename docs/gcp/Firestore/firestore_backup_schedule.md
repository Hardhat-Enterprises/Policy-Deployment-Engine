## 🛡️ Policy Deployment Engine: `firestore_backup_schedule`

This section provides a concise policy evaluation for the `firestore_backup_schedule` resource in GCP.

Reference: [Terraform Registry – firestore_backup_schedule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/firestore_backup_schedule)

---

## 1. Argument Reference

### `retention`
- Description: (Required) At what relative time in the future, compared to its creation time, the backup should be deleted, e.g. keep backups for 7 days. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". You can set this to a value up to 14 weeks.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `daily_recurrence`
- Description: (Optional) For a schedule that runs daily.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weekly_recurrence`
- Description: (Optional) For a schedule that runs weekly on a specific day. Structure is [documented below](#nested_weekly_recurrence).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database`
- Description: (Optional) The Firestore database id. Defaults to `"(default)"`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_weekly_recurrence"></a>The `weekly_recurrence` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `day`
- Description: (Optional) The day of week to run. Possible values are: `DAY_OF_WEEK_UNSPECIFIED`, `MONDAY`, `TUESDAY`, `WEDNESDAY`, `THURSDAY`, `FRIDAY`, `SATURDAY`, `SUNDAY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
