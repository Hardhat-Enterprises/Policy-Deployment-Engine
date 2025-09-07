## 🛡️ Policy Deployment Engine: `google_folder`

This section provides a concise policy evaluation for the `google_folder` resource in GCP.

Reference: [Terraform Registry – google_folder](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_folder)

---

## 1. Argument Reference

### `display_name`
- Description: A folder’s display name must be unique amongst its siblings, e.g. no two folders with the same parent can share the same display name. The display name must start and end with a letter or digit, may contain letters, digits, spaces, hyphens and underscores and can be no longer than 30 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: Must be of the form `folders/{folder_id}` or `organizations/{org_id}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `deletion_protection`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tags`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
