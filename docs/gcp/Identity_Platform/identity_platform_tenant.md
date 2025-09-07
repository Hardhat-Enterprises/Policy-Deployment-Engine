## 🛡️ Policy Deployment Engine: `identity_platform_tenant`

This section provides a concise policy evaluation for the `identity_platform_tenant` resource in GCP.

Reference: [Terraform Registry – identity_platform_tenant](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/identity_platform_tenant)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) Human friendly display name of the tenant.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_password_signup`
- Description: (Optional) Whether to allow email/password user authentication.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_email_link_signin`
- Description: (Optional) Whether to enable email link user authentication.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_auth`
- Description: (Optional) Whether authentication is disabled for the tenant. If true, the users under the disabled tenant are not allowed to sign-in. Admins of the disabled tenant are not able to manage its users.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client`
- Description: (Optional) Options related to how clients making requests on behalf of a tenant should be configured. Structure is [documented below](#nested_client).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_client"></a>The `client` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `permissions`
- Description: (Optional) Configuration related to restricting a user's ability to affect their account. Structure is [documented below](#nested_client_permissions). <a name="nested_client_permissions"></a>The `permissions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled_user_signup`
- Description: (Optional) When true, end users cannot sign up for a new account on the associated project through any of our API methods.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled_user_deletion`
- Description: (Optional) When true, end users cannot delete their account on the associated project through any of our API methods.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
