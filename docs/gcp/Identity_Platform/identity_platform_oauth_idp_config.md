## 🛡️ Policy Deployment Engine: `identity_platform_oauth_idp_config`

This section provides a concise policy evaluation for the `identity_platform_oauth_idp_config` resource in GCP.

Reference: [Terraform Registry – identity_platform_oauth_idp_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/identity_platform_oauth_idp_config)

---

## 1. Argument Reference

### `name`
- Description: (Required) The name of the OauthIdpConfig. Must start with `oidc.`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `issuer`
- Description: (Required) For OIDC Idps, the issuer identifier.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_id`
- Description: (Required) The client id of an OAuth client.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Human friendly display name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) If this config allows users to sign in with the provider.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_secret`
- Description: (Optional) The client secret of the OAuth client, to enable OIDC code flow.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `response_type`
- Description: (Optional) The response type to request for in the OAuth authorization flow. You can set either idToken or code to true, but not both. Setting both types to be simultaneously true ({code: true, idToken: true}) is not yet supported. Structure is [documented below](#nested_response_type).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_response_type"></a>The `response_type` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id_token`
- Description: (Optional) If true, ID token is returned from IdP's authorization endpoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `code`
- Description: (Optional) If true, authorization code is returned from IdP's authorization endpoint.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
