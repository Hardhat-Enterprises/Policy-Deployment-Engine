## 🛡️ Policy Deployment Engine: `healthcare_workspace`

This section provides a concise policy evaluation for the `healthcare_workspace` resource in GCP.

Reference: [Terraform Registry – healthcare_workspace](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/healthcare_workspace)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The name of the workspace, in the format 'projects/{projectId}/locations/{location}/datasets/{datasetId}/dataMapperWorkspaces/{workspaceId}' | true | false | The name is a resource identifier only and does not affect security posture. | None | None |
| `settings` | Settings associated with this workspace. Structure is [documented below](#nested_settings). | true | false | The settings block is a required container for workspace configuration and does not directly affect security posture. | None | None |
| `dataset` | Identifies the dataset addressed by this request. Must be in the format 'projects/{project}/locations/{location}/datasets/{dataset}' | true | false | The dataset field is a required reference to the parent dataset and does not directly affect security posture. | None | None |
| `labels` | The user labels. An object containing a list of "key": value pairs. Example: { "name": "wrench", "mass": "1.3kg", "count": "3" } **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | true | Labels are essential for resource governance, cost attribution, and access control enforcement. Missing or unapproved labels make it impossible to identify workspace ownership, classify PHI mapping workloads, and apply organisation-wide security policies consistently. | labels = { environment = "prod", owner = "healthcare-team" } | labels not set (null) or missing required keys environment and owner |

### settings Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `data_project_ids` | Project IDs for data projects hosted in a workspace. | true | false | The data_project_ids field defines which projects are associated with the workspace. Access control for those projects is governed by their own IAM policies, not this field directly. | None | None |
