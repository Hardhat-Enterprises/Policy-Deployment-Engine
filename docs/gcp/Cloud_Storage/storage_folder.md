## 🛡️ Policy Deployment Engine: `storage_folder`

This section provides a concise policy evaluation for the `storage_folder` resource in GCP.

Reference: [Terraform Registry – storage_folder](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_folder)

---

## 1. Argument Reference

### `bucket`
- Description: (Required) The name of the bucket that contains the folder.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) The name of the folder expressed as a path. Must include trailing '/'. For example, `example_dir/example_dir2/`, `example@#/`, `a-b/d-f/`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `force_destroy`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
