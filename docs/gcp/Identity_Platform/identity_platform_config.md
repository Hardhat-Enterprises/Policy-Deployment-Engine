## 🛡️ Policy Deployment Engine: `identity_platform_config`

This section provides a concise policy evaluation for the `identity_platform_config` resource in GCP.

Reference: [Terraform Registry – identity_platform_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/identity_platform_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `autodelete_anonymous_users` | Whether anonymous users will be auto-deleted after a period of 30 days | false | None | None |
| `authorized_domains` | List of domains authorized for OAuth redirects. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### sign_in Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `email` | Configuration options related to authenticating a user by their email address. Structure is [documented below](#nested_sign_in_email). | false | None | None |
| `phone_number` | Configuration options related to authenticated a user by their phone number. Structure is [documented below](#nested_sign_in_phone_number). | false | None | None |
| `anonymous` | Configuration options related to authenticating an anonymous user. Structure is [documented below](#nested_sign_in_anonymous). | false | None | None |
| `allow_duplicate_emails` | Whether to allow more than one account to have the same email. | false | None | None |
| `hash_config` | (Output) Output only. Hash config information. Structure is [documented below](#nested_sign_in_hash_config). | none | None | None |

### blocking_functions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `triggers` | Map of Trigger to event type. Key should be one of the supported event types: "beforeCreate", "beforeSignIn". Structure is [documented below](#nested_blocking_functions_triggers). | true | None | None |
| `forward_inbound_credentials` | The user credentials to include in the JWT payload that is sent to the registered Blocking Functions. Structure is [documented below](#nested_blocking_functions_forward_inbound_credentials). | false | None | None |

### quota Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `sign_up_quota_config` | Quota for the Signup endpoint, if overwritten. Signup quota is measured in sign ups per project per hour per IP. None of quota, startTime, or quotaDuration can be skipped. Structure is [documented below](#nested_quota_sign_up_quota_config). | false | None | None |

### sms_region_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allow_by_default` | A policy of allowing SMS to every region by default and adding disallowed regions to a disallow list. Structure is [documented below](#nested_sms_region_config_allow_by_default). | false | None | None |
| `allowlist_only` | A policy of only allowing regions by explicitly adding them to an allowlist. Structure is [documented below](#nested_sms_region_config_allowlist_only). | false | None | None |

### client Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `permissions` | Configuration related to restricting a user's ability to affect their account. Structure is [documented below](#nested_client_permissions). | false | None | None |
| `api_key` | (Output) API key that can be used when making requests for this project. **Note**: This property is sensitive and will not be displayed in the plan. | none | None | None |
| `firebase_subdomain` | (Output) Firebase subdomain. | none | None | None |

### mfa Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `state` | Whether MultiFactor Authentication has been enabled for this project. Possible values are: `DISABLED`, `ENABLED`, `MANDATORY`. | false | None | None |
| `enabled_providers` | A list of usable second factors for this project. Each value may be one of: `PHONE_SMS`. | false | None | None |
| `provider_configs` | A list of usable second factors for this project along with their configurations. This field does not support phone based MFA, for that use the 'enabledProviders' field. Structure is [documented below](#nested_mfa_provider_configs). | false | None | None |

### multi_tenant Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allow_tenants` | Whether this project can have tenants or not. | false | None | None |
| `default_tenant_location` | The default cloud parent org or folder that the tenant project should be created under. The parent resource name should be in the format of "/", such as "folders/123" or "organizations/456". If the value is not set, the tenant will be created under the same organization or folder as the agent project. | false | None | None |

### monitoring Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `request_logging` | Configuration for logging requests made to this project to Stackdriver Logging Structure is [documented below](#nested_monitoring_request_logging). | false | None | None |

### email Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Whether email auth is enabled for the project or not. | true | None | None |
| `password_required` | Whether a password is required for email auth or not. If true, both an email and password must be provided to sign in. If false, a user may sign in via either email/password or email link. | false | None | None |

### phone_number Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Whether phone number auth is enabled for the project or not. | true | None | None |
| `test_phone_numbers` | A map of <test phone number, fake code> that can be used for phone auth testing. | false | None | None |

### anonymous Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Whether anonymous user auth is enabled for the project or not. The `hash_config` block contains: | true | None | None |
| `algorithm` | (Output) Different password hash algorithms used in Identity Toolkit. | none | None | None |
| `signer_key` | (Output) Signer key in base64. | none | None | None |
| `salt_separator` | (Output) Non-printable character to be inserted between the salt and plain text password in base64. | none | None | None |
| `rounds` | (Output) How many rounds for hash calculation. Used by scrypt and other similar password derivation algorithms. | none | None | None |
| `memory_cost` | (Output) Memory cost for hash calculation. Used by scrypt and other similar password derivation algorithms. See https://tools.ietf.org/html/rfc7914 for explanation of field. | none | None | None |

### triggers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `event_type` |  | none | None | None |
| `function_uri` | HTTP URI trigger for the Cloud Function. | true | None | None |
| `update_time` | (Output) When the trigger was changed. | none | None | None |

### forward_inbound_credentials Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `id_token` | Whether to pass the user's OIDC identity provider's ID token. | false | None | None |
| `access_token` | Whether to pass the user's OAuth identity provider's access token. | false | None | None |
| `refresh_token` | Whether to pass the user's OAuth identity provider's refresh token. | false | None | None |

### sign_up_quota_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `quota` | A sign up APIs quota that customers can override temporarily. Value can be in between 1 and 1000. | false | None | None |
| `start_time` | When this quota will take affect. | false | None | None |
| `quota_duration` | How long this quota will be active for. It is measurred in seconds, e.g., Example: "9.615s". | false | None | None |

### allow_by_default Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disallowed_regions` | Two letter unicode region codes to disallow as defined by https://cldr.unicode.org/ The full list of these region codes is here: https://github.com/unicode-cldr/cldr-localenames-full/blob/master/main/en/territories.json | false | None | None |

### allowlist_only Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allowed_regions` | Two letter unicode region codes to allow as defined by https://cldr.unicode.org/ The full list of these region codes is here: https://github.com/unicode-cldr/cldr-localenames-full/blob/master/main/en/territories.json | false | None | None |

### permissions Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `disabled_user_signup` | When true, end users cannot sign up for a new account on the associated project through any of our API methods | false | None | None |
| `disabled_user_deletion` | When true, end users cannot delete their account on the associated project through any of our API methods | false | None | None |

### provider_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `state` | Whether MultiFactor Authentication has been enabled for this project. Possible values are: `DISABLED`, `ENABLED`, `MANDATORY`. | false | None | None |
| `totp_provider_config` | TOTP MFA provider config for this project. Structure is [documented below](#nested_mfa_provider_configs_provider_configs_totp_provider_config). | false | None | None |

### totp_provider_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `adjacent_intervals` | The allowed number of adjacent intervals that will be used for verification to avoid clock skew. | false | None | None |

### request_logging Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Whether logging is enabled for this project or not. | false | None | None |
