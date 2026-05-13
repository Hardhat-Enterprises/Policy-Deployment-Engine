## 🛡️ Policy Deployment Engine: `data_catalog_policy_tag`

This section provides a concise policy evaluation for the `data_catalog_policy_tag` resource in GCP.

Reference: [Terraform Registry – data_catalog_policy_tag](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_catalog_policy_tag)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | User defined name of this policy tag. It must: be unique within the parent taxonomy; contain only unicode letters, numbers, underscores, dashes and spaces; not start or end with spaces; and be at most 200 bytes long when encoded in UTF-8. | true | false |  | None | None |
| `taxonomy` | Taxonomy the policy tag is associated with | true | true | Policy tags should belong to an approved taxonomy so sensitive data classifications use the correct hierarchy. | projects/gcp-project-12345/locations/australia-southeast1/taxonomies/approved_taxonomy | projects/gcp-project-12345/locations/australia-southeast1/taxonomies/unapproved_taxonomy |
| `description` | Description of this policy tag. It must: contain only unicode characters, tabs, newlines, carriage returns and page breaks; and be at most 2000 bytes long when encoded in UTF-8. If not set, defaults to an empty description. If not set, defaults to an empty description. | false | true | A description is needed so the meaning of the policy tag is clear for audit and governance. | Sensitive customer data policy tag | None |
| `parent_policy_tag` | Resource name of this policy tag's parent policy tag. If empty, it means this policy tag is a top level policy tag. If not set, defaults to an empty string. | false | true | Parent policy tags should be approved so the classification hierarchy is not changed incorrectly. | projects/gcp-project-12345/locations/australia-southeast1/taxonomies/approved_taxonomy/policyTags/approved_parent | projects/gcp-project-12345/locations/australia-southeast1/taxonomies/approved_taxonomy/policyTags/unapproved_parent |
