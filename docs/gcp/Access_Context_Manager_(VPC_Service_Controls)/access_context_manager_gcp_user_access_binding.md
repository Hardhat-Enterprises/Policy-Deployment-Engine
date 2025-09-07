## 🛡️ Policy Deployment Engine: `access_context_manager_gcp_user_access_binding`

This section provides a concise policy evaluation for the `access_context_manager_gcp_user_access_binding` resource in GCP.

Reference: [Terraform Registry – access_context_manager_gcp_user_access_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_gcp_user_access_binding)

---

## 1. Argument Reference

### `group_key`
- Description: (Required) Required. Immutable. Google Group id whose members are subject to this binding's restrictions. See "id" in the G Suite Directory API's Groups resource. If a group's email address/alias is changed, this resource will continue to point at the changed group. This field does not accept group email addresses or aliases. Example: "01d520gv4vjcrht"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `organization_id`
- Description: (Required) Required. ID of the parent organization.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_levels`
- Description: (Optional) Optional. Access level that a user must have to be granted access. Only one access level is supported, not multiple. This repeated field must have exactly one element. Example: "accessPolicies/9522/accessLevels/device_trusted"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `session_settings`
- Description: (Optional) Optional. The Google Cloud session length (GCSL) policy for the group key. Structure is [documented below](#nested_session_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scoped_access_settings`
- Description: (Optional) Optional. A list of scoped access settings that set this binding's restrictions on a subset of applications. Structure is [documented below](#nested_scoped_access_settings). <a name="nested_session_settings"></a>The `session_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `session_reauth_method`
- Description: (Optional) Optional. The session challenges proposed to users when the Google Cloud session length is up. Possible values are: `LOGIN`, `SECURITY_KEY`, `PASSWORD`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `session_length`
- Description: (Optional) Optional. The session length. Setting this field to zero is equal to disabling session. Also can set infinite session by flipping the enabled bit to false below. If useOidcMaxAge is true, for OIDC apps, the session length will be the minimum of this field and OIDC max_age param.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_inactivity`
- Description: (Optional) Optional. How long a user is allowed to take between actions before a new access token must be issued. Only set for Google Cloud apps.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_oidc_max_age`
- Description: (Optional) Optional. Only useful for OIDC apps. When false, the OIDC max_age param, if passed in the authentication request will be ignored. When true, the re-auth period will be the minimum of the sessionLength field and the max_age OIDC param.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `session_length_enabled`
- Description: (Optional) Optional. This field enables or disables Google Cloud session length. When false, all fields set above will be disregarded and the session length is basically infinite. <a name="nested_scoped_access_settings"></a>The `scoped_access_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scope`
- Description: (Optional) Optional. Application, etc. to which the access settings will be applied to. Implicitly, this is the scoped access settings key; as such, it must be unique and non-empty. Structure is [documented below](#nested_scoped_access_settings_scoped_access_settings_scope).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `active_settings`
- Description: (Optional) Optional. Access settings for this scoped access settings. This field may be empty if dryRunSettings is set. Structure is [documented below](#nested_scoped_access_settings_scoped_access_settings_active_settings).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `dry_run_settings`
- Description: (Optional) Optional. Dry-run access settings for this scoped access settings. This field may be empty if activeSettings is set. Cannot contain session settings. Structure is [documented below](#nested_scoped_access_settings_scoped_access_settings_dry_run_settings). <a name="nested_scoped_access_settings_scoped_access_settings_scope"></a>The `scope` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_scope`
- Description: (Optional) Optional. Client scope for this access scope. Structure is [documented below](#nested_scoped_access_settings_scoped_access_settings_scope_client_scope). <a name="nested_scoped_access_settings_scoped_access_settings_scope_client_scope"></a>The `client_scope` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `restricted_client_application`
- Description: (Optional) Optional. The application that is subject to this binding's scope. Only one of clientId or name should be specified. Structure is [documented below](#nested_scoped_access_settings_scoped_access_settings_scope_client_scope_restricted_client_application). <a name="nested_scoped_access_settings_scoped_access_settings_scope_client_scope_restricted_client_application"></a>The `restricted_client_application` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_id`
- Description: (Optional) The OAuth client ID of the application.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Optional) The name of the application. Example: "Cloud Console" <a name="nested_scoped_access_settings_scoped_access_settings_active_settings"></a>The `active_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_levels`
- Description: (Optional) Optional. Access level that a user must have to be granted access. Only one access level is supported, not multiple. This repeated field must have exactly one element. Example: "accessPolicies/9522/accessLevels/device_trusted"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `session_settings`
- Description: (Optional) Optional. Session settings applied to user access on a given AccessScope. Structure is [documented below](#nested_scoped_access_settings_scoped_access_settings_active_settings_session_settings). <a name="nested_scoped_access_settings_scoped_access_settings_active_settings_session_settings"></a>The `session_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `session_reauth_method`
- Description: (Optional) Optional. The session challenges proposed to users when the Google Cloud session length is up. Possible values are: `LOGIN`, `SECURITY_KEY`, `PASSWORD`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `session_length`
- Description: (Optional) Optional. The session length. Setting this field to zero is equal to disabling session. Also can set infinite session by flipping the enabled bit to false below. If useOidcMaxAge is true, for OIDC apps, the session length will be the minimum of this field and OIDC max_age param.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_inactivity`
- Description: (Optional) Optional. How long a user is allowed to take between actions before a new access token must be issued. Only set for Google Cloud apps.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_oidc_max_age`
- Description: (Optional) Optional. Only useful for OIDC apps. When false, the OIDC max_age param, if passed in the authentication request will be ignored. When true, the re-auth period will be the minimum of the sessionLength field and the max_age OIDC param.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `session_length_enabled`
- Description: (Optional) Optional. This field enables or disables Google Cloud session length. When false, all fields set above will be disregarded and the session length is basically infinite. <a name="nested_scoped_access_settings_scoped_access_settings_dry_run_settings"></a>The `dry_run_settings` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_levels`
- Description: (Optional) Optional. Access level that a user must have to be granted access. Only one access level is supported, not multiple. This repeated field must have exactly one element. Example: "accessPolicies/9522/accessLevels/device_trusted"
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
