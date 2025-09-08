## 🛡️ Policy Deployment Engine: `integrations_auth_config`

This section provides a concise policy evaluation for the `integrations_auth_config` resource in GCP.

Reference: [Terraform Registry – integrations_auth_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/integrations_auth_config)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The name of the auth config. | true | None | None |
| `location` | Location in which client needs to be provisioned. | true | None | None |
| `description` | A description of the auth config. | false | None | None |
| `visibility` | The visibility of the auth config. Possible values are: `PRIVATE`, `CLIENT_VISIBLE`. | false | None | None |
| `expiry_notification_duration` | User can define the time to receive notification after which the auth config becomes invalid. Support up to 30 days. Support granularity in hours. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | None | None |
| `override_valid_time` | User provided expiry time to override. For the example of Salesforce, username/password credentials can be valid for 6 months depending on the instance settings. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### decrypted_credential Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `credential_type` | Credential type associated with auth configs. | true | None | None |
| `username_and_password` | Username and password credential. Structure is [documented below](#nested_decrypted_credential_username_and_password). | false | None | None |
| `oauth2_authorization_code` | OAuth2 authorization code credential. Structure is [documented below](#nested_decrypted_credential_oauth2_authorization_code). | false | None | None |
| `oauth2_client_credentials` | OAuth2 client credentials. Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials). | false | None | None |
| `jwt` | JWT credential. Structure is [documented below](#nested_decrypted_credential_jwt). | false | None | None |
| `auth_token` | Auth token credential. Structure is [documented below](#nested_decrypted_credential_auth_token). | false | None | None |
| `service_account_credentials` | Service account credential. Structure is [documented below](#nested_decrypted_credential_service_account_credentials). | false | None | None |
| `oidc_token` | Google OIDC ID Token. Structure is [documented below](#nested_decrypted_credential_oidc_token). | false | None | None |

### client_certificate Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ssl_certificate` | The ssl certificate encoded in PEM format. This string must include the begin header and end footer lines. | true | None | None |
| `encrypted_private_key` | The ssl certificate encoded in PEM format. This string must include the begin header and end footer lines. | true | None | None |
| `passphrase` | 'passphrase' should be left unset if private key is not encrypted. Note that 'passphrase' is not the password for web server, but an extra layer of security to protected private key. | false | None | None |

### username_and_password Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `username` | Username to be used. | false | None | None |
| `password` | Password to be used. | false | None | None |

### oauth2_authorization_code Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `client_id` | The client's id. | false | None | None |
| `client_secret` | The client's secret. | false | None | None |
| `scope` | A space-delimited list of requested scope permissions. | false | None | None |
| `auth_endpoint` | The auth url endpoint to send the auth code request to. | false | None | None |
| `token_endpoint` | The token url endpoint to send the token request to. | false | None | None |

### oauth2_client_credentials Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `client_id` | The client's ID. | false | None | None |
| `client_secret` | The client's secret. | false | None | None |
| `token_endpoint` | The token endpoint is used by the client to obtain an access token by presenting its authorization grant or refresh token. | false | None | None |
| `scope` | A space-delimited list of requested scope permissions. | false | None | None |
| `token_params` | Token parameters for the auth request. Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials_token_params). | false | None | None |
| `request_type` | Represent how to pass parameters to fetch access token Possible values are: `REQUEST_TYPE_UNSPECIFIED`, `REQUEST_BODY`, `QUERY_PARAMETERS`, `ENCODED_HEADER`. | false | None | None |

### token_params Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `entries` | A list of parameter map entries. Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials_token_params_entries). | false | None | None |

### entries Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | Key of the map entry. Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials_token_params_entries_entries_key). | false | None | None |
| `value` | Value of the map entry. Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials_token_params_entries_entries_value). | false | None | None |

### key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `literal_value` | Passing a literal value Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials_token_params_entries_entries_key_literal_value). | false | None | None |

### literal_value Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `string_value` | String. | false | None | None |

### value Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `literal_value` | Passing a literal value Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials_token_params_entries_entries_value_literal_value). | false | None | None |

### jwt Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `jwt_header` | Identifies which algorithm is used to generate the signature. | false | None | None |
| `jwt_payload` | Contains a set of claims. The JWT specification defines seven Registered Claim Names which are the standard fields commonly included in tokens. Custom claims are usually also included, depending on the purpose of the token. | false | None | None |
| `secret` | User's pre-shared secret to sign the token. | false | None | None |
| `jwt` | (Output) The token calculated by the header, payload and signature. | none | None | None |

### auth_token Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Authentication type, e.g. "Basic", "Bearer", etc. | false | None | None |
| `token` | The token for the auth type. | false | None | None |

### service_account_credentials Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_account` | Name of the service account that has the permission to make the request. | false | None | None |
| `scope` | A space-delimited list of requested scope permissions. | false | None | None |

### oidc_token Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_account_email` | The service account email to be used as the identity for the token. | false | None | None |
| `audience` | Audience to be used when generating OIDC token. The audience claim identifies the recipients that the JWT is intended for. | false | None | None |
| `token` | (Output) ID token obtained for the service account. | none | None | None |
| `token_expire_time` | (Output) The approximate time until the token retrieved is valid. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | none | None | None |
