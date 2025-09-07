## 🛡️ Policy Deployment Engine: `gke_backup_restore_channel`

This section provides a concise policy evaluation for the `gke_backup_restore_channel` resource in GCP.

Reference: [Terraform Registry – gke_backup_restore_channel](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gke_backup_restore_channel)

---

## 1. Argument Reference

### `name`
- Description: (Required) The full name of the RestoreChannel Resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_project`
- Description: (Required) The project where Backups will be restored. The format is `projects/{project}`. {project} can be project number or project id.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The region of the Restore Channel.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) User specified descriptive string for this RestoreChannel.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Description: A set of custom labels supplied by the user. A list of key->value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" }. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
