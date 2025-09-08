## 🛡️ Policy Deployment Engine: `access_context_manager_gcp_user_access_binding`

This section provides a concise policy evaluation for the `access_context_manager_gcp_user_access_binding` resource in GCP.

Reference: [Terraform Registry – access_context_manager_gcp_user_access_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/access_context_manager_gcp_user_access_binding)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `group_key` | Required. Immutable. Google Group id whose members are subject to this binding's restrictions. See "id" in the G Suite Directory API's Groups resource. If a group's email address/alias is changed, this resource will continue to point at the changed group. This field does not accept group email addresses or aliases. Example: "01d520gv4vjcrht" | true | None | None |
| `organization_id` | Required. ID of the parent organization. | true | None | None |
| `access_levels` | Optional. Access level that a user must have to be granted access. Only one access level is supported, not multiple. This repeated field must have exactly one element. Example: "accessPolicies/9522/accessLevels/device_trusted" | false | None | None |

### session_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `session_reauth_method` | Optional. The session challenges proposed to users when the Google Cloud session length is up. Possible values are: `LOGIN`, `SECURITY_KEY`, `PASSWORD`. | false | None | None |
| `session_length` | Optional. The session length. Setting this field to zero is equal to disabling session. Also can set infinite session by flipping the enabled bit to false below. If useOidcMaxAge is true, for OIDC apps, the session length will be the minimum of this field and OIDC max_age param. | false | None | None |
| `max_inactivity` | Optional. How long a user is allowed to take between actions before a new access token must be issued. Only set for Google Cloud apps. | false | None | None |
| `use_oidc_max_age` | Optional. Only useful for OIDC apps. When false, the OIDC max_age param, if passed in the authentication request will be ignored. When true, the re-auth period will be the minimum of the sessionLength field and the max_age OIDC param. | false | None | None |
| `session_length_enabled` | Optional. This field enables or disables Google Cloud session length. When false, all fields set above will be disregarded and the session length is basically infinite. | false | None | None |

### scoped_access_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `scope` | Optional. Application, etc. to which the access settings will be applied to. Implicitly, this is the scoped access settings key; as such, it must be unique and non-empty. Structure is [documented below](#nested_scoped_access_settings_scoped_access_settings_scope). | false | None | None |
| `active_settings` | Optional. Access settings for this scoped access settings. This field may be empty if dryRunSettings is set. Structure is [documented below](#nested_scoped_access_settings_scoped_access_settings_active_settings). | false | None | None |
| `dry_run_settings` | Optional. Dry-run access settings for this scoped access settings. This field may be empty if activeSettings is set. Cannot contain session settings. Structure is [documented below](#nested_scoped_access_settings_scoped_access_settings_dry_run_settings). | false | None | None |

### scope Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `client_scope` | Optional. Client scope for this access scope. Structure is [documented below](#nested_scoped_access_settings_scoped_access_settings_scope_client_scope). | false | None | None |

### client_scope Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `restricted_client_application` | Optional. The application that is subject to this binding's scope. Only one of clientId or name should be specified. Structure is [documented below](#nested_scoped_access_settings_scoped_access_settings_scope_client_scope_restricted_client_application). | false | None | None |

### restricted_client_application Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `client_id` | The OAuth client ID of the application. | false | None | None |
| `name` | The name of the application. Example: "Cloud Console" | false | None | None |

### active_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `access_levels` | Optional. Access level that a user must have to be granted access. Only one access level is supported, not multiple. This repeated field must have exactly one element. Example: "accessPolicies/9522/accessLevels/device_trusted" | false | None | None |
| `session_settings` | Optional. Session settings applied to user access on a given AccessScope. Structure is [documented below](#nested_scoped_access_settings_scoped_access_settings_active_settings_session_settings). | false | None | None |

### dry_run_settings Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `access_levels` | Optional. Access level that a user must have to be granted access. Only one access level is supported, not multiple. This repeated field must have exactly one element. Example: "accessPolicies/9522/accessLevels/device_trusted" | false | None | None |
