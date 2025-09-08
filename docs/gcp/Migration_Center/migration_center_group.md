## 🛡️ Policy Deployment Engine: `migration_center_group`

This section provides a concise policy evaluation for the `migration_center_group` resource in GCP.

Reference: [Terraform Registry – migration_center_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/migration_center_group)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `location` | The location of the group. | true | None | None |
| `group_id` | Required. User specified ID for the group. It will become the last component of the group name. The ID must be unique within the project, must conform with RFC-1034, is restricted to lower-cased letters, and has a maximum length of 63 characters. The ID must match the regular expression: `[a-z]([a-z0-9-]{0,61}[a-z0-9])?`. | true | None | None |
| `labels` | Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `display_name` | Optional. User-friendly display name. | false | None | None |
| `description` | Optional. The description of the group. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
