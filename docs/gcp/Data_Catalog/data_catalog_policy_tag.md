## 🛡️ Policy Deployment Engine: `data_catalog_policy_tag`

This section provides a concise policy evaluation for the `data_catalog_policy_tag` resource in GCP.

Reference: [Terraform Registry – data_catalog_policy_tag](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_catalog_policy_tag)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) User defined name of this policy tag. It must: be unique within the parent taxonomy; contain only unicode letters, numbers, underscores, dashes and spaces; not start or end with spaces; and be at most 200 bytes long when encoded in UTF-8.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `taxonomy`
- Description: (Required) Taxonomy the policy tag is associated with
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of this policy tag. It must: contain only unicode characters, tabs, newlines, carriage returns and page breaks; and be at most 2000 bytes long when encoded in UTF-8. If not set, defaults to an empty description. If not set, defaults to an empty description.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent_policy_tag`
- Description: (Optional) Resource name of this policy tag's parent policy tag. If empty, it means this policy tag is a top level policy tag. If not set, defaults to an empty string.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
