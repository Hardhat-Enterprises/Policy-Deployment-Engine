## 🛡️ Policy Deployment Engine: `bigtable_logical_view`

This section provides a concise policy evaluation for the `bigtable_logical_view` resource in GCP.

Reference: [Terraform Registry – bigtable_logical_view](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_logical_view)

---

## 1. Argument Reference

### `query`
- Description: (Required) The logical view's select query.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `logical_view_id`
- Description: (Required) The unique name of the logical view in the form `[_a-zA-Z0-9][-_.a-zA-Z0-9]*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: (Optional) Set to true to make the logical view protected against deletion.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Optional) The name of the instance to create the logical view within.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
