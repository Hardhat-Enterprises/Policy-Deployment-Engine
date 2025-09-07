## 🛡️ Policy Deployment Engine: `healthcare_workspace`

This section provides a concise policy evaluation for the `healthcare_workspace` resource in GCP.

Reference: [Terraform Registry – healthcare_workspace](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/healthcare_workspace)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name of the workspace, in the format 'projects/{projectId}/locations/{location}/datasets/{datasetId}/dataMapperWorkspaces/{workspaceId}'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `settings`
- Description: (Required) Settings associated with this workspace. Structure is [documented below](#nested_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dataset`
- Description: (Required) Identifies the dataset addressed by this request. Must be in the format 'projects/{project}/locations/{location}/datasets/{dataset}'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) The user labels. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" } **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. <a name="nested_settings"></a>The `settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_project_ids`
- Description: (Required) Project IDs for data projects hosted in a workspace.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
