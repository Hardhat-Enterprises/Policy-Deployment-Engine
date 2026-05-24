## 🛡️ Policy Deployment Engine: `data_catalog_entry_group`

This section provides a concise policy evaluation for the `data_catalog_entry_group` resource in GCP.

Reference: [Terraform Registry – data_catalog_entry_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_catalog_entry_group)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `entry_group_id` | The id of the entry group to create. The id must begin with a letter or underscore, contain only English letters, numbers and underscores, and be at most 64 characters. | true | false | This is a user-defined identifier and does not control access to the resource or data. | None | None |
| `display_name` | A short name to identify the entry group, for example, "analytics data - jan 2011". | false | false | This is only a human-readable display name and does not control access to the resource or data. | None | None |
| `description` | Entry group description, which can consist of several sentences or paragraphs that describe entry group contents. | false | false | This is only descriptive metadata and does not control access to the resource or data. | None | None |
| `region` | EntryGroup location region. | false | true | Entry groups should be created only in approved regions to meet data residency and governance requirements. | australia-southeast1 | us-east1 |
| `project` | If it is not provided, the provider project is used. | false | false | The project ID is an identifier for locating the resource and does not by itself enforce a security control. | None | None |
