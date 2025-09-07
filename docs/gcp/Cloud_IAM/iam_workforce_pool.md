## 🛡️ Policy Deployment Engine: `iam_workforce_pool`

This section provides a concise policy evaluation for the `iam_workforce_pool` resource in GCP.

Reference: [Terraform Registry – iam_workforce_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workforce_pool)

---

## 1. Argument Reference

### `parent`
- Description: (Required) Immutable. The resource name of the parent. Format: `organizations/{org-id}`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) The location for the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `workforce_pool_id`
- Description: (Required) The name of the pool. The ID must be a globally unique string of 6 to 63 lowercase letters, digits, or hyphens. It must start with a letter, and cannot have a trailing hyphen. The prefix `gcp-` is reserved for use by Google, and may not be specified.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) A user-specified display name of the pool in Google Cloud Console. Cannot exceed 32 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A user-specified description of the pool. Cannot exceed 256 characters.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Whether the pool is disabled. You cannot use a disabled pool to exchange tokens, or use existing tokens to access resources. If the pool is re-enabled, existing tokens grant access again.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `session_duration`
- Description: (Optional) Duration that the Google Cloud access tokens, console sign-in sessions, and `gcloud` sign-in sessions from this pool are valid. Must be greater than 15 minutes (900s) and less than 12 hours (43200s). If `sessionDuration` is not configured, minted credentials have a default duration of one hour (3600s). A duration in seconds with up to nine fractional digits, ending with '`s`'. Example: "`3.5s`".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_restrictions`
- Description: (Optional) Configure access restrictions on the workforce pool users. This is an optional field. If specified web sign-in can be restricted to given set of services or programmatic sign-in can be disabled for pool users. Structure is [documented below](#nested_access_restrictions). <a name="nested_access_restrictions"></a>The `access_restrictions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_services`
- Description: (Optional) Services allowed for web sign-in with the workforce pool. If not set by default there are no restrictions. Structure is [documented below](#nested_access_restrictions_allowed_services).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disable_programmatic_signin`
- Description: (Optional) Disable programmatic sign-in by disabling token issue via the Security Token API endpoint. See [Security Token Service API](https://cloud.google.com/iam/docs/reference/sts/rest). <a name="nested_access_restrictions_allowed_services"></a>The `allowed_services` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `domain`
- Description: (Optional) Domain name of the service. Example: console.cloud.google
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
