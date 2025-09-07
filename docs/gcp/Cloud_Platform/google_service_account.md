## 🛡️ Policy Deployment Engine: `google_service_account`

This section provides a concise policy evaluation for the `google_service_account` resource in GCP.

Reference: [Terraform Registry – google_service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account)

---

## 1. Argument Reference

### `account_id`
- Description: account email address and a stable unique id. It is unique within a project, must be 6-30 characters long, and match the regular expression `[a-z]([-a-z0-9]*[a-z0-9])` to comply with RFC1035. Changing this forces a new service account to be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: Can be updated without creating a new resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: Must be less than or equal to 256 UTF-8 bytes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: Must be set after creation to disable a service account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: Defaults to the provider project configuration.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `create_ignore_already_exists`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
