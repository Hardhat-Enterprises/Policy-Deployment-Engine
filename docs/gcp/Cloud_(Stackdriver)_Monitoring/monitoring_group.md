## 🛡️ Policy Deployment Engine: `monitoring_group`

This section provides a concise policy evaluation for the `monitoring_group` resource in GCP.

Reference: [Terraform Registry – monitoring_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_group)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | A user-assigned name for this group, used only for display purposes. | true | false | Display metadata with no security impact. | None | None |
| `filter` | The filter used to determine which monitored resources belong to this group. | true | false | Functional selector with no direct security impact; the filter defines membership, not access control. | None | None |
| `parent_name` | The name of the group's parent, if it has one. The format is "projects/{project_id_or_number}/groups/{group_id}". For groups with no parent, parentName is the empty string, "". | false | false | Structural hierarchy field with no security impact. | None | None |
| `is_cluster` | If true, the members of this group are considered to be a cluster. The system can perform additional analysis on groups that are clusters. | false | false | Analytical setting with no security impact. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | Organisational field, not a security control. | None | None |
