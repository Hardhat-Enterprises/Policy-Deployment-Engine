## 🛡️ Policy Deployment Engine: `monitoring_group`

This section provides a concise policy evaluation for the `monitoring_group` resource in GCP.

Reference: [Terraform Registry – monitoring_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_group)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | A user-assigned name for this group, used only for display purposes. | true | None | None |
| `filter` | The filter used to determine which monitored resources belong to this group. | true | None | None |
| `parent_name` | The name of the group's parent, if it has one. The format is "projects/{project_id_or_number}/groups/{group_id}". For groups with no parent, parentName is the empty string, "". | false | None | None |
| `is_cluster` | If true, the members of this group are considered to be a cluster. The system can perform additional analysis on groups that are clusters. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
