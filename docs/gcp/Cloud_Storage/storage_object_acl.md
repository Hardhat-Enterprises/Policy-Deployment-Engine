## 🛡️ Policy Deployment Engine: `storage_object_acl`

This section provides a concise policy evaluation for the `storage_object_acl` resource in GCP.

Reference: [Terraform Registry – storage_object_acl](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_object_acl)

---

## 1. Argument Reference

### `bucket`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `object`
- Description: - - -
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `predefined_acl`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `role_entity`
- Description: Must be set if `predefined_acl` is not. -> The object's creator will always have `OWNER` permissions for their object, and any attempt to modify that permission would return an error. Instead, Terraform automatically adds that role/entity pair to your `terraform plan` results when it is omitted in your config; `terraform plan` will show the correct final state at every point except for at `Create` time, where the object role/entity pair is omitted if not explicitly set.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
