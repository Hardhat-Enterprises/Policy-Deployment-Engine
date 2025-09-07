## 🛡️ Policy Deployment Engine: `identity_platform_default_supported_idp_config`

This section provides a concise policy evaluation for the `identity_platform_default_supported_idp_config` resource in GCP.

Reference: [Terraform Registry – identity_platform_default_supported_idp_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/identity_platform_default_supported_idp_config)

---

## 1. Argument Reference

### `idp_id`
- Description: (Required) ID of the IDP. Possible values include:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_id`
- Description: (Required) OAuth client ID
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_secret`
- Description: (Required) OAuth client secret
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) If this IDP allows the user to sign in
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
