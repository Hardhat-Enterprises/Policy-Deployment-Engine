## 🛡️ Policy Deployment Engine: `iam_oauth_client_credential`

This section provides a concise policy evaluation for the `iam_oauth_client_credential` resource in GCP.

Reference: [Terraform Registry – iam_oauth_client_credential](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_oauth_client_credential)

---

## 1. Argument Reference

### `location`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauthclient`
- Description: (Required) Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth_client_credential_id`
- Description: (Required) Required. The ID to use for the OauthClientCredential, which becomes the final component of the resource name. This value should be 4-32 characters, and may contain the characters [a-z0-9-]. The prefix `gcp-` is reserved for use by Google, and may not be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Whether the OauthClientCredential is disabled. You cannot use a disabled OauthClientCredential.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) A user-specified display name of the OauthClientCredential. Cannot exceed 32 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
