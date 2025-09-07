## 🛡️ Policy Deployment Engine: `identity_platform_config`

This section provides a concise policy evaluation for the `identity_platform_config` resource in GCP.

Reference: [Terraform Registry – identity_platform_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/identity_platform_config)

---

## 1. Argument Reference

### `autodelete_anonymous_users`
- Description: (Optional) Whether anonymous users will be auto-deleted after a period of 30 days
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sign_in`
- Description: (Optional) Configuration related to local sign in methods. Structure is [documented below](#nested_sign_in).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `blocking_functions`
- Description: (Optional) Configuration related to blocking functions. Structure is [documented below](#nested_blocking_functions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `quota`
- Description: (Optional) Configuration related to quotas. Structure is [documented below](#nested_quota).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authorized_domains`
- Description: (Optional) List of domains authorized for OAuth redirects.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sms_region_config`
- Description: (Optional) Configures the regions where users are allowed to send verification SMS for the project or tenant. This is based on the calling code of the destination phone number. Structure is [documented below](#nested_sms_region_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client`
- Description: (Optional) Options related to how clients making requests on behalf of a project should be configured. Structure is [documented below](#nested_client).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `mfa`
- Description: (Optional) Options related to how clients making requests on behalf of a project should be configured. Structure is [documented below](#nested_mfa).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `multi_tenant`
- Description: (Optional) Configuration related to multi-tenant functionality. Structure is [documented below](#nested_multi_tenant).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `monitoring`
- Description: (Optional) Configuration related to monitoring project activity. Structure is [documented below](#nested_monitoring).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_sign_in"></a>The `sign_in` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `email`
- Description: (Optional) Configuration options related to authenticating a user by their email address. Structure is [documented below](#nested_sign_in_email).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `phone_number`
- Description: (Optional) Configuration options related to authenticated a user by their phone number. Structure is [documented below](#nested_sign_in_phone_number).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `anonymous`
- Description: (Optional) Configuration options related to authenticating an anonymous user. Structure is [documented below](#nested_sign_in_anonymous).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_duplicate_emails`
- Description: (Optional) Whether to allow more than one account to have the same email.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `hash_config`
- Description: (Output) Output only. Hash config information. Structure is [documented below](#nested_sign_in_hash_config). <a name="nested_sign_in_email"></a>The `email` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) Whether email auth is enabled for the project or not.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password_required`
- Description: (Optional) Whether a password is required for email auth or not. If true, both an email and password must be provided to sign in. If false, a user may sign in via either email/password or email link. <a name="nested_sign_in_phone_number"></a>The `phone_number` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) Whether phone number auth is enabled for the project or not.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `test_phone_numbers`
- Description: (Optional) A map of <test phone number, fake code> that can be used for phone auth testing. <a name="nested_sign_in_anonymous"></a>The `anonymous` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) Whether anonymous user auth is enabled for the project or not. <a name="nested_sign_in_hash_config"></a>The `hash_config` block contains:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `algorithm`
- Description: (Output) Different password hash algorithms used in Identity Toolkit.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `signer_key`
- Description: (Output) Signer key in base64.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `salt_separator`
- Description: (Output) Non-printable character to be inserted between the salt and plain text password in base64.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `rounds`
- Description: (Output) How many rounds for hash calculation. Used by scrypt and other similar password derivation algorithms.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `memory_cost`
- Description: (Output) Memory cost for hash calculation. Used by scrypt and other similar password derivation algorithms. See https://tools.ietf.org/html/rfc7914 for explanation of field. <a name="nested_blocking_functions"></a>The `blocking_functions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `triggers`
- Description: (Required) Map of Trigger to event type. Key should be one of the supported event types: "beforeCreate", "beforeSignIn". Structure is [documented below](#nested_blocking_functions_triggers).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `forward_inbound_credentials`
- Description: (Optional) The user credentials to include in the JWT payload that is sent to the registered Blocking Functions. Structure is [documented below](#nested_blocking_functions_forward_inbound_credentials). <a name="nested_blocking_functions_triggers"></a>The `triggers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `event_type`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `function_uri`
- Description: (Required) HTTP URI trigger for the Cloud Function.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `update_time`
- Description: (Output) When the trigger was changed. <a name="nested_blocking_functions_forward_inbound_credentials"></a>The `forward_inbound_credentials` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `id_token`
- Description: (Optional) Whether to pass the user's OIDC identity provider's ID token.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `access_token`
- Description: (Optional) Whether to pass the user's OAuth identity provider's access token.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `refresh_token`
- Description: (Optional) Whether to pass the user's OAuth identity provider's refresh token. <a name="nested_quota"></a>The `quota` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `sign_up_quota_config`
- Description: (Optional) Quota for the Signup endpoint, if overwritten. Signup quota is measured in sign ups per project per hour per IP. None of quota, startTime, or quotaDuration can be skipped. Structure is [documented below](#nested_quota_sign_up_quota_config). <a name="nested_quota_sign_up_quota_config"></a>The `sign_up_quota_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `quota`
- Description: (Optional) A sign up APIs quota that customers can override temporarily. Value can be in between 1 and 1000.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `start_time`
- Description: (Optional) When this quota will take affect.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `quota_duration`
- Description: (Optional) How long this quota will be active for. It is measurred in seconds, e.g., Example: "9.615s". <a name="nested_sms_region_config"></a>The `sms_region_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_by_default`
- Description: (Optional) A policy of allowing SMS to every region by default and adding disallowed regions to a disallow list. Structure is [documented below](#nested_sms_region_config_allow_by_default).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowlist_only`
- Description: (Optional) A policy of only allowing regions by explicitly adding them to an allowlist. Structure is [documented below](#nested_sms_region_config_allowlist_only). <a name="nested_sms_region_config_allow_by_default"></a>The `allow_by_default` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disallowed_regions`
- Description: (Optional) Two letter unicode region codes to disallow as defined by https://cldr.unicode.org/ The full list of these region codes is here: https://github.com/unicode-cldr/cldr-localenames-full/blob/master/main/en/territories.json <a name="nested_sms_region_config_allowlist_only"></a>The `allowlist_only` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_regions`
- Description: (Optional) Two letter unicode region codes to allow as defined by https://cldr.unicode.org/ The full list of these region codes is here: https://github.com/unicode-cldr/cldr-localenames-full/blob/master/main/en/territories.json <a name="nested_client"></a>The `client` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `permissions`
- Description: (Optional) Configuration related to restricting a user's ability to affect their account. Structure is [documented below](#nested_client_permissions).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_key`
- Description: (Output) API key that can be used when making requests for this project. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `firebase_subdomain`
- Description: (Output) Firebase subdomain. <a name="nested_client_permissions"></a>The `permissions` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled_user_signup`
- Description: (Optional) When true, end users cannot sign up for a new account on the associated project through any of our API methods
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled_user_deletion`
- Description: (Optional) When true, end users cannot delete their account on the associated project through any of our API methods <a name="nested_mfa"></a>The `mfa` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Optional) Whether MultiFactor Authentication has been enabled for this project. Possible values are: `DISABLED`, `ENABLED`, `MANDATORY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled_providers`
- Description: (Optional) A list of usable second factors for this project. Each value may be one of: `PHONE_SMS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `provider_configs`
- Description: (Optional) A list of usable second factors for this project along with their configurations. This field does not support phone based MFA, for that use the 'enabledProviders' field. Structure is [documented below](#nested_mfa_provider_configs). <a name="nested_mfa_provider_configs"></a>The `provider_configs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `state`
- Description: (Optional) Whether MultiFactor Authentication has been enabled for this project. Possible values are: `DISABLED`, `ENABLED`, `MANDATORY`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `totp_provider_config`
- Description: (Optional) TOTP MFA provider config for this project. Structure is [documented below](#nested_mfa_provider_configs_provider_configs_totp_provider_config). <a name="nested_mfa_provider_configs_provider_configs_totp_provider_config"></a>The `totp_provider_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `adjacent_intervals`
- Description: (Optional) The allowed number of adjacent intervals that will be used for verification to avoid clock skew. <a name="nested_multi_tenant"></a>The `multi_tenant` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allow_tenants`
- Description: (Optional) Whether this project can have tenants or not.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `default_tenant_location`
- Description: (Optional) The default cloud parent org or folder that the tenant project should be created under. The parent resource name should be in the format of "/", such as "folders/123" or "organizations/456". If the value is not set, the tenant will be created under the same organization or folder as the agent project. <a name="nested_monitoring"></a>The `monitoring` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_logging`
- Description: (Optional) Configuration for logging requests made to this project to Stackdriver Logging Structure is [documented below](#nested_monitoring_request_logging). <a name="nested_monitoring_request_logging"></a>The `request_logging` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Optional) Whether logging is enabled for this project or not.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
