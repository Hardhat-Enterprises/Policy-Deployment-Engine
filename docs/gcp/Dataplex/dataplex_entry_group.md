## 🛡️ Policy Deployment Engine: `dataplex_entry_group`

This section provides a concise policy evaluation for the `dataplex_entry_group` resource in GCP.

Reference: [Terraform Registry – dataplex_entry_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataplex_entry_group)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `description` | Description of the EntryGroup. | false | false | None | None | None |
| `display_name` | User friendly display name. | false | false | None | None | None |
| `labels` | User-defined labels for the EntryGroup. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | None | None | None |
| `location` | The location where entry group will be created in. | false | false | None | None | None |
| `entry_group_id` | The entry group id of the entry group. | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
