## 🛡️ Policy Deployment Engine: `network_connectivity_group`

This section provides a concise policy evaluation for the `network_connectivity_group` resource in GCP.

Reference: [Terraform Registry – network_connectivity_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/network_connectivity_group)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name of the group. Group names must be unique. Possible values are: `default`, `center`, `edge`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hub`
- Description: (Required) The name of the hub. Hub names must be unique. They use the following form: projects/{projectNumber}/locations/global/hubs/{hubId}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Optional labels in key:value format. For more information about labels, see [Requirements for labels](https://cloud.google.com/resource-manager/docs/creating-managing-labels#requirements). **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An optional description of the group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_accept`
- Description: (Optional) Optional. The auto-accept setting for this group. Structure is [documented below](#nested_auto_accept).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_auto_accept"></a>The `auto_accept` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auto_accept_projects`
- Description: (Required) A list of project ids or project numbers for which you want to enable auto-accept. The auto-accept setting is applied to spokes being created or updated in these projects.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
