## 🛡️ Policy Deployment Engine: `data_catalog_policy_tag`

This section provides a concise policy evaluation for the `data_catalog_policy_tag` resource in GCP.

Reference: [Terraform Registry – data_catalog_policy_tag](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_catalog_policy_tag)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | User defined name of this policy tag. It must: be unique within the parent taxonomy; contain only unicode letters, numbers, underscores, dashes and spaces; not start or end with spaces; and be at most 200 bytes long when encoded in UTF-8. | true | None | None |
| `taxonomy` | Taxonomy the policy tag is associated with | true | None | None |
| `description` | Description of this policy tag. It must: contain only unicode characters, tabs, newlines, carriage returns and page breaks; and be at most 2000 bytes long when encoded in UTF-8. If not set, defaults to an empty description. If not set, defaults to an empty description. | false | None | None |
| `parent_policy_tag` | Resource name of this policy tag's parent policy tag. If empty, it means this policy tag is a top level policy tag. If not set, defaults to an empty string. | false | None | None |
