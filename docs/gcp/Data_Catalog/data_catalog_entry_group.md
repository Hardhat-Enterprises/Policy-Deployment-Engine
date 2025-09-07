## 🛡️ Policy Deployment Engine: `data_catalog_entry_group`

This section provides a concise policy evaluation for the `data_catalog_entry_group` resource in GCP.

Reference: [Terraform Registry – data_catalog_entry_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/data_catalog_entry_group)

---

## 1. Argument Reference

### `entry_group_id`
- Description: (Required) The id of the entry group to create. The id must begin with a letter or underscore, contain only English letters, numbers and underscores, and be at most 64 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) A short name to identify the entry group, for example, "analytics data - jan 2011".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) Entry group description, which can consist of several sentences or paragraphs that describe entry group contents.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `region`
- Description: (Optional) EntryGroup location region.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
