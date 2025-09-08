## 🛡️ Policy Deployment Engine: `healthcare_workspace`

This section provides a concise policy evaluation for the `healthcare_workspace` resource in GCP.

Reference: [Terraform Registry – healthcare_workspace](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/healthcare_workspace)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The name of the workspace, in the format 'projects/{projectId}/locations/{location}/datasets/{datasetId}/dataMapperWorkspaces/{workspaceId}' | true | None | None |
| `dataset` | Identifies the dataset addressed by this request. Must be in the format 'projects/{project}/locations/{location}/datasets/{dataset}' | true | None | None |
| `labels` | The user labels. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" } **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |

### settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `data_project_ids` | Project IDs for data projects hosted in a workspace. | true | None | None |
