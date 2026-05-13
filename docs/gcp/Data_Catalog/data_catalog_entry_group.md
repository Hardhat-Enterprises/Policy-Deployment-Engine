## 🛡️ Policy Deployment Engine: `data_catalog_entry_group`

This section provides a concise policy evaluation for the `data_catalog_entry_group` resource in GCP.

Reference: [Terraform Registry – data_catalog_entry_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_catalog_entry_group)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `entry_group_id` | The id of the entry group to create. The id must begin with a letter or underscore, contain only English letters, numbers and underscores, and be at most 64 characters. | true | false |  | None | None |
| `display_name` | A short name to identify the entry group, for example, "analytics data - jan 2011". | false | false |  | None | None |
| `description` | Entry group description, which can consist of several sentences or paragraphs that describe entry group contents. | false | true | A clear description is needed so the purpose and ownership of the entry group can be audited. | Managed entry group for approved data assets | None |
| `region` | EntryGroup location region. | false | true | Entry groups should be created only in approved regions to meet data residency and governance requirements. | australia-southeast1 | us-east1 |
| `project` | If it is not provided, the provider project is used. | false | true | Entry groups should be created only in approved projects to keep resources inside the correct security boundary. | gcp-project-12345 | unapproved-project |
