## 🛡️ Policy Deployment Engine: `netapp_volume_snapshot`

This section provides a concise policy evaluation for the `netapp_volume_snapshot` resource in GCP.

Reference: [Terraform Registry – netapp_volume_snapshot](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/netapp_volume_snapshot)

---

## 1. Argument Reference

### `location`
- Description: (Required) Name of the snapshot location. Snapshots are child resources of volumes and live in the same location.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `volume_name`
- Description: (Required) The name of the volume to create the snapshot in.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the snapshot.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description for the snapshot.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Labels as key value pairs. Example: `{ "owner": "Bob", "department": "finance", "purpose": "testing" }`. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
