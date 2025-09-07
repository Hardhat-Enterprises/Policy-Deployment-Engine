## 🛡️ Policy Deployment Engine: `storage_hmac_key`

This section provides a concise policy evaluation for the `storage_hmac_key` resource in GCP.

Reference: [Terraform Registry – storage_hmac_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_hmac_key)

---

## 1. Argument Reference

### `service_account_email`
- Description: (Required) The email address of the key's associated service account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Optional) The state of the key. Can be set to one of ACTIVE, INACTIVE. Default value is `ACTIVE`. Possible values are: `ACTIVE`, `INACTIVE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
