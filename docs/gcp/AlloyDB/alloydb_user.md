## 🛡️ Policy Deployment Engine: `alloydb_user`

This section provides a concise policy evaluation for the `alloydb_user` resource in GCP.

Reference: [Terraform Registry – alloydb_user](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/alloydb_user)

---

## 1. Argument Reference

### `cluster`
- Description: (Required) Identifies the alloydb cluster. Must be in the format 'projects/{project}/locations/{location}/clusters/{cluster_id}'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_id`
- Description: (Required) The database role name of the user.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_type`
- Description: (Required) The type of this user. Possible values are: `ALLOYDB_BUILT_IN`, `ALLOYDB_IAM_USER`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Optional) Password for this database user. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `database_roles`
- Description: (Optional) List of database roles this database user has.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
