## 🛡️ Policy Deployment Engine: `os_login_ssh_public_key`

This section provides a concise policy evaluation for the `os_login_ssh_public_key` resource in GCP.

Reference: [Terraform Registry – os_login_ssh_public_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/os_login_ssh_public_key)

---

## 1. Argument Reference

### `key`
- Description: (Required) Public key text in SSH format, defined by RFC4253 section 6.6.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user`
- Description: (Required) The user email.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expiration_time_usec`
- Description: (Optional) An expiration time in microseconds since epoch.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: (Optional) The project ID of the Google Cloud Platform project.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
