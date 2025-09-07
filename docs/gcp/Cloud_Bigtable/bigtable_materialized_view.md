## 🛡️ Policy Deployment Engine: `bigtable_materialized_view`

This section provides a concise policy evaluation for the `bigtable_materialized_view` resource in GCP.

Reference: [Terraform Registry – bigtable_materialized_view](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_materialized_view)

---

## 1. Argument Reference

### `query`
- Description: (Required) The materialized view's select query.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `materialized_view_id`
- Description: (Required) The unique name of the materialized view in the form `[_a-zA-Z0-9][-_.a-zA-Z0-9]*`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: (Optional) Set to true to make the MaterializedView protected against deletion.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance`
- Description: (Optional) The name of the instance to create the materialized view within.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
