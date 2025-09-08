## 🛡️ Policy Deployment Engine: `data_catalog_entry_group`

This section provides a concise policy evaluation for the `data_catalog_entry_group` resource in GCP.

Reference: [Terraform Registry – data_catalog_entry_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_catalog_entry_group)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `entry_group_id` | The id of the entry group to create. The id must begin with a letter or underscore, contain only English letters, numbers and underscores, and be at most 64 characters. | true | None | None |
| `display_name` | A short name to identify the entry group, for example, "analytics data - jan 2011". | false | None | None |
| `description` | Entry group description, which can consist of several sentences or paragraphs that describe entry group contents. | false | None | None |
| `region` | EntryGroup location region. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |
