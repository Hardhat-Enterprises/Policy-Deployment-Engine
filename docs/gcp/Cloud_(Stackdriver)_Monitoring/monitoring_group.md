## 🛡️ Policy Deployment Engine: `monitoring_group`

This section provides a concise policy evaluation for the `monitoring_group` resource in GCP.

Reference: [Terraform Registry – monitoring_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_group)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) A user-assigned name for this group, used only for display purposes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `filter`
- Description: (Required) The filter used to determine which monitored resources belong to this group.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent_name`
- Description: (Optional) The name of the group's parent, if it has one. The format is "projects/{project_id_or_number}/groups/{group_id}". For groups with no parent, parentName is the empty string, "".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `is_cluster`
- Description: (Optional) If true, the members of this group are considered to be a cluster. The system can perform additional analysis on groups that are clusters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
