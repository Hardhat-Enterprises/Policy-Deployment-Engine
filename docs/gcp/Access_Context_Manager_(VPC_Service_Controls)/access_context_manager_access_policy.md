## 🛡️ Policy Deployment Engine: `access_context_manager_access_policy`

This section provides a concise policy evaluation for the `access_context_manager_access_policy` resource in GCP.

Reference: [Terraform Registry – access_context_manager_access_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_access_policy)

---

## 1. Argument Reference

### `parent`
- Description: (Required) The parent of this AccessPolicy in the Cloud Resource Hierarchy. Format: 'organizations/{{organization_id}}'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `title`
- Description: (Required) Human readable title. Does not affect behavior.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scopes`
- Description: (Optional) Folder or project on which this policy is applicable. Format: 'folders/{{folder_id}}' or 'projects/{{project_number}}'
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
