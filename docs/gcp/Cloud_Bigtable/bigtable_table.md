## 🛡️ Policy Deployment Engine: `bigtable_table`

This section provides a concise policy evaluation for the `bigtable_table` resource in GCP.

Reference: [Terraform Registry – bigtable_table](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_table)

---

## 1. Argument Reference

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `split_keys`
- Description: !> **Warning:** Modifying the `split_keys` of an existing table will cause Terraform to delete/recreate the entire `google_bigtable_table` resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column_family`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `change_stream_retention`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `automated_backup_policy`
- Description: ----- `column_family` supports the following arguments:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `family`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
