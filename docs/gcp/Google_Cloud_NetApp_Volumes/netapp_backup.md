## 🛡️ Policy Deployment Engine: `netapp_backup`

This section provides a concise policy evaluation for the `netapp_backup` resource in GCP.

Reference: [Terraform Registry – netapp_backup](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_backup)

---

## 1. Argument Reference

### `location`
- Description: (Required) Location of the backup.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `vault_name`
- Description: (Required) Name of the backup vault to store the backup in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The resource name of the backup. Needs to be unique per location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description of the backup with 2048 characters or less. Requests with longer descriptions will be rejected.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_volume`
- Description: (Optional) ID of volumes this backup belongs to. Format: `projects/{{projects_id}}/locations/{{location}}/volumes/{{name}}``
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `source_snapshot`
- Description: (Optional) If specified, backup will be created from the given snapshot. If not specified, there will be a new snapshot taken to initiate the backup creation. Format: `projects/{{projectId}}/locations/{{location}}/volumes/{{volumename}}/snapshots/{{snapshotname}}``
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
