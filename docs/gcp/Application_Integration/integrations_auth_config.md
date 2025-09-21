## 🛡️ Policy Deployment Engine: `integrations_auth_config`

This section provides a concise policy evaluation for the `integrations_auth_config` resource in GCP.

Reference: [Terraform Registry – integrations_auth_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/integrations_auth_config)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `display_name` | The name of the auth config. | true | false | None | None | None |
| `location` | Location in which client needs to be provisioned. | true | true | Enforcing location restrictions to Australian regions helps maintain data compliance and reduces the risk of unauthorized data access. | australia-southeast1 | us-central1 |
| `description` | A description of the auth config. | false | false | None | None | None |
| `visibility` | The visibility of the auth config. Possible values are: `PRIVATE`, `CLIENT_VISIBLE`. | false | true | Setting visibility to 'PRIVATE' minimizes unauthorized access and exposure. | PRIVATE | CLIENT_VISIBLE |
| `expiry_notification_duration` | User can define the time to receive notification after which the auth config becomes invalid. Support up to 30 days. Support granularity in hours. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s". | false | false | None | None | None |
| `override_valid_time` | User provided expiry time to override. For the example of Salesforce, username/password credentials can be valid for 6 months depending on the instance settings. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | false | false | None | None | None |
| `decrypted_credential` | Ensure that credentials are not exposed  to prevent unauthorized access. | false | true | Proper handling and encryption of the credentials ensure they remain confidential and accessible only to authorized systems or users | Refer to child argument | Refer to child argument |
| `client_certificate` | Raw client certificate Structure is [documented below](#nested_client_certificate). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |
| `username_and_password` | Username and password credential. | false | false | None | None | None |
| `oauth2_authorization_code` | OAuth2 authorization code credential. Structure is [documented below](#nested_decrypted_credential_oauth2_authorization_code). | false | false | None | None | None |
| `oauth2_client_credentials` | OAuth2 client credentials. | false | true | OAuth2 client credentials provide a secure, standardized method for service-to-service authentication, ensuring that access tokens are issued only to trusted clients | Refer to child argument | Refer to child argument |
| `token_params` |  | false | false | None | None | None |
| `entries` |  | false | false | None | None | None |
| `key` |  | false | false | None | None | None |
| `literal_value` |  | false | false | None | None | None |
| `value` |  | false | false | None | None | None |
| `jwt` | JWT credential | false | true | JWT enable secure token-based authentication, allowing reliable verification of identity without exposing sensitive credential details | Refer to child argument | Refer to child argument |
| `auth_token` | Auth token credential. | false | true | Auth tokens provide secure access credentials that reduce the risk of exposing secrets, enhancing overall authentication security. | Refer to child argument | Refer to child argument |
| `service_account_credentials` |  | false | false | None | None | None |
| `oidc_token` |  | false | false | None | None | None |

### decrypted_credential Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `credential_type` | Credential type associated with auth configs. | true | true | Only approved credential types are allowed to ensure strong, secure, and supported authentication methods | oauth2_client_credentials | basic_auth |
| `username_and_password` | Username and password credential. | false | false | None | None | None |
| `oauth2_authorization_code` | OAuth2 authorization code credential. Structure is [documented below](#nested_decrypted_credential_oauth2_authorization_code). | false | false | None | None | None |
| `oauth2_client_credentials` | OAuth2 client credentials. | false | true | OAuth2 client credentials provide a secure, standardized method for service-to-service authentication, ensuring that access tokens are issued only to trusted clients | Refer to child argument | Refer to child argument |
| `jwt` | JWT credential. | false | true | JWT enable secure token-based authentication, allowing reliable verification of identity without exposing sensitive credential details | Refer to child argument | Refer to child argument |
| `auth_token` | Auth token credential. | false | true | Auth tokens provide secure access credentials that reduce the risk of exposing secrets, enhancing overall authentication security. | Refer to child argument | Refer to child argument |
| `service_account_credentials` | Service account credential. Structure is [documented below](#nested_decrypted_credential_service_account_credentials). | false | false | None | None | None |
| `oidc_token` | Google OIDC ID Token. Structure is [documented below](#nested_decrypted_credential_oidc_token). | false | false | None | None | None |

### client_certificate Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `ssl_certificate` | The ssl certificate encoded in PEM format. This string must include the begin header and end footer lines. | true | false | None | None | None |
| `encrypted_private_key` | The ssl certificate encoded in PEM format. This string must include the begin header and end footer lines. | true | false | None | None | None |
| `passphrase` | 'passphrase' should be left unset if private key is not encrypted. Note that 'passphrase' is not the password for web server, but an extra layer of security to protected private key. | false | false | None | None | None |

### username_and_password Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `username` | Username to be used. | false | false | None | None | None |
| `password` | Password to be used. | false | false | None | None | None |

### oauth2_authorization_code Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `client_id` | The client's id. | false | false | None | None | None |
| `client_secret` | The client's secret. | false | false | None | None | None |
| `scope` | A space-delimited list of requested scope permissions. | false | false | None | None | None |
| `auth_endpoint` | The auth url endpoint to send the auth code request to. | false | false | None | None | None |
| `token_endpoint` | The token url endpoint to send the token request to. | false | false | None | None | None |

### oauth2_client_credentials Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `client_id` | The client's ID. | false | false | None | None | None |
| `client_secret` | The client's secret. | false | true | Client secrets are critical authentication credentials. Leaving them empty or undefined compromises the OAuth2 flow, potentially allowing unauthorized access or system misconfigurations. | my-secure-client-secret |  |
| `token_endpoint` | The token endpoint is used by the client to obtain an access token by presenting its authorization grant or refresh token. | false | false | None | None | None |
| `scope` | A space-delimited list of requested scope permissions. | false | false | None | None | None |
| `token_params` | Token parameters for the auth request. Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials_token_params). | false | false | None | None | None |
| `request_type` | Represent how to pass parameters to fetch access token Possible values are: `REQUEST_TYPE_UNSPECIFIED`, `REQUEST_BODY`, `QUERY_PARAMETERS`, `ENCODED_HEADER`. | false | true | Only secure request types should be used to transmit credentials. Types like 'ENCODED_HEADER' or 'REQUEST_BODY' ensures safer handling of credentials. | ENCODED_HEADER | QUERY_PARAMETERS |

### token_params Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `entries` | A list of parameter map entries. Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials_token_params_entries). | false | false | None | None | None |

### entries Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key` | Key of the map entry. Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials_token_params_entries_entries_key). | false | false | None | None | None |
| `value` | Value of the map entry. Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials_token_params_entries_entries_value). | false | false | None | None | None |

### key Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `literal_value` | Passing a literal value Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials_token_params_entries_entries_key_literal_value). | false | false | None | None | None |

### literal_value Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `string_value` | String. | false | false | None | None | None |

### value Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `literal_value` | Passing a literal value Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials_token_params_entries_entries_value_literal_value). | false | false | None | None | None |

### jwt Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `jwt_header` | Identifies which algorithm is used to generate the signature. | false | true | Using secure JWT headers ensures proper validation. The 'HS256' algorithm should be used to prevent weak or insecure cryptographic signing, and the type must be set to 'JWT' to maintain standardization and avoid parsing errors or misuse. | {"alg": "HS256", "typ": "JWT"} | {"alg": "RS256", "typ": "JWS"} |
| `jwt_payload` | Contains a set of claims. The JWT specification defines seven Registered Claim Names which are the standard fields commonly included in tokens. Custom claims are usually also included, depending on the purpose of the token. | false | false | None | None | None |
| `secret` | User's pre-shared secret to sign the token. | false | false | None | None | None |
| `jwt` | (Output) The token calculated by the header, payload and signature. | false | false | None | None | None |

### auth_token Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | Authentication type must be set, e.g. "Basic", "Bearer", etc. | false | true | Using secure authentication token types ensures proper authorization standards are enforced. | Bearer | Basic |
| `token` | The token for the auth type. | false | true | Providing a token value is critical for secure authentication. Empty tokens can result in unauthorized access, increasing the risk of security breaches. | secure-value-token |  |

### service_account_credentials Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_account` | Name of the service account that has the permission to make the request. | false | false | None | None | None |
| `scope` | A space-delimited list of requested scope permissions. | false | false | None | None | None |

### oidc_token Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service_account_email` | The service account email to be used as the identity for the token. | false | false | None | None | None |
| `audience` | Audience to be used when generating OIDC token. The audience claim identifies the recipients that the JWT is intended for. | false | false | None | None | None |
| `token` | (Output) ID token obtained for the service account. | false | false | None | None | None |
| `token_expire_time` | (Output) The approximate time until the token retrieved is valid. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". | false | false | None | None | None |
