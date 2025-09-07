## 🛡️ Policy Deployment Engine: `netapp_backup_policy`

This section provides a concise policy evaluation for the `netapp_backup_policy` resource in GCP.

Reference: [Terraform Registry – netapp_backup_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_backup_policy)

---

## 1. Argument Reference

### `daily_backup_limit`
- Description: (Required) Number of daily backups to keep. Note that the minimum daily backup limit is 2.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `weekly_backup_limit`
- Description: (Required) Number of weekly backups to keep. Note that the sum of daily, weekly and monthly backups should be greater than 1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `monthly_backup_limit`
- Description: (Required) Number of monthly backups to keep. Note that the sum of daily, weekly and monthly backups should be greater than 1.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Name of the region for the policy to apply to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the backup policy. Needs to be unique per location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of this resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) If enabled, make backups automatically according to the schedules. This will be applied to all volumes that have this policy attached and enforced on volume level.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
