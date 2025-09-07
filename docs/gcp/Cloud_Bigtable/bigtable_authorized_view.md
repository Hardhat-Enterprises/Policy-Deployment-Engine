## 🛡️ Policy Deployment Engine: `bigtable_authorized_view`

This section provides a concise policy evaluation for the `bigtable_authorized_view` resource in GCP.

Reference: [Terraform Registry – bigtable_authorized_view](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigtable_authorized_view)

---

## 1. Argument Reference

### `name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `instance_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `table_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `column_family`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: If not provided, currently deletion protection will be set to UNPROTECTED as it is the API default value. Note this field configs the deletion protection provided by the API in the backend, and should not be confused with Terraform-side deletion protection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subset_view`
- Description: ----- `subset_view` supports the following arguments:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `row_prefixes`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `family_subsets`
- Description: ----- `family_subsets` supports the following arguments:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `family_name`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `qualifiers`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `qualifier_prefixes`
- Description: Every qualifier starting with one of these prefixes is included in the authorized view. To provide access to all qualifiers, include the empty string as a prefix ("").
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
