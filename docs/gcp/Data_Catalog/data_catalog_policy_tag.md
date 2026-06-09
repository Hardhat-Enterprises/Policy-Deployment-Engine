## 🛡️ Policy Deployment Engine: `data_catalog_policy_tag`

This section provides a concise policy evaluation for the `data_catalog_policy_tag` resource in GCP.

Reference: [Terraform Registry – data_catalog_policy_tag](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_catalog_policy_tag)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | User defined name of this policy tag. It must: be unique within the parent taxonomy; contain only unicode letters, numbers, underscores, dashes and spaces; not start or end with spaces; and be at most 200 bytes long when encoded in UTF-8. | true | false | This is only a human-readable display name and does not control access to the resource or data. | None | None |
| `taxonomy` | Taxonomy the policy tag is associated with | true | false | This is a user-defined resource reference and does not by itself control access to the underlying resource or data. | None | None |
| `description` | Description of this policy tag. It must: contain only unicode characters, tabs, newlines, carriage returns and page breaks; and be at most 2000 bytes long when encoded in UTF-8. If not set, defaults to an empty description. If not set, defaults to an empty description. | false | false | This is only descriptive metadata and does not control access to the resource or data. | None | None |
| `parent_policy_tag` | Resource name of this policy tag's parent policy tag. If empty, it means this policy tag is a top level policy tag. If not set, defaults to an empty string. | false | false | This is a user-defined resource reference and does not by itself control access to the underlying resource or data. | None | None |
