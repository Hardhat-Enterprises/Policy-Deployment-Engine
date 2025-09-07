## 🛡️ Policy Deployment Engine: `iam_oauth_client`

This section provides a concise policy evaluation for the `iam_oauth_client` resource in GCP.

Reference: [Terraform Registry – iam_oauth_client](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_oauth_client)

---

## 1. Argument Reference

### `allowed_scopes`
- Description: (Required) Required. The list of scopes that the OauthClient is allowed to request during OAuth flows. The following scopes are supported:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_grant_types`
- Description: (Required) Required. The list of OAuth grant types is allowed for the OauthClient.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_redirect_uris`
- Description: (Required) Required. The list of redirect uris that is allowed to redirect back when authorization process is completed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth_client_id`
- Description: (Required) Required. The ID to use for the OauthClient, which becomes the final component of the resource name. This value should be a string of 6 to 63 lowercase letters, digits, or hyphens. It must start with a letter, and cannot have a trailing hyphen. The prefix `gcp-` is reserved for use by Google, and may not be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Whether the OauthClient is disabled. You cannot use a disabled OAuth client.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) A user-specified display name of the OauthClient. Cannot exceed 32 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A user-specified description of the OauthClient. Cannot exceed 256 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_type`
- Description: (Optional) Immutable. The type of OauthClient. Either public or private. For private clients, the client secret can be managed using the dedicated OauthClientCredential resource. Possible values: CLIENT_TYPE_UNSPECIFIED PUBLIC_CLIENT CONFIDENTIAL_CLIENT
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
