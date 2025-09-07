## 🛡️ Policy Deployment Engine: `data_catalog_taxonomy`

This section provides a concise policy evaluation for the `data_catalog_taxonomy` resource in GCP.

Reference: [Terraform Registry – data_catalog_taxonomy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_catalog_taxonomy)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) User defined name of this taxonomy. The taxonomy display name must be unique within an organization. It must: contain only unicode letters, numbers, underscores, dashes and spaces; not start or end with spaces; and be at most 200 bytes long when encoded in UTF-8.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Description of this taxonomy. It must: contain only unicode characters, tabs, newlines, carriage returns and page breaks; and be at most 2000 bytes long when encoded in UTF-8. If not set, defaults to an empty description.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `activated_policy_types`
- Description: (Optional) A list of policy types that are activated for this taxonomy. If not set, defaults to an empty list. Each value may be one of: `POLICY_TYPE_UNSPECIFIED`, `FINE_GRAINED_ACCESS_CONTROL`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) Taxonomy location region.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
