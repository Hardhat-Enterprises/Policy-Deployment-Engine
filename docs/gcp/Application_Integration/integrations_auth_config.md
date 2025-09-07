## 🛡️ Policy Deployment Engine: `integrations_auth_config`

This section provides a concise policy evaluation for the `integrations_auth_config` resource in GCP.

Reference: [Terraform Registry – integrations_auth_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/integrations_auth_config)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The name of the auth config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Location in which client needs to be provisioned.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) A description of the auth config.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `visibility`
- Description: (Optional) The visibility of the auth config. Possible values are: `PRIVATE`, `CLIENT_VISIBLE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `expiry_notification_duration`
- Description: (Optional) User can define the time to receive notification after which the auth config becomes invalid. Support up to 30 days. Support granularity in hours. A duration in seconds with up to nine fractional digits, ending with 's'. Example: "3.5s".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `override_valid_time`
- Description: (Optional) User provided expiry time to override. For the example of Salesforce, username/password credentials can be valid for 6 months depending on the instance settings. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z".
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `decrypted_credential`
- Description: (Optional) Raw auth credentials. Structure is [documented below](#nested_decrypted_credential).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_certificate`
- Description: (Optional) Raw client certificate Structure is [documented below](#nested_client_certificate).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_decrypted_credential"></a>The `decrypted_credential` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `credential_type`
- Description: (Required) Credential type associated with auth configs.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username_and_password`
- Description: (Optional) Username and password credential. Structure is [documented below](#nested_decrypted_credential_username_and_password).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth2_authorization_code`
- Description: (Optional) OAuth2 authorization code credential. Structure is [documented below](#nested_decrypted_credential_oauth2_authorization_code).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth2_client_credentials`
- Description: (Optional) OAuth2 client credentials. Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jwt`
- Description: (Optional) JWT credential. Structure is [documented below](#nested_decrypted_credential_jwt).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auth_token`
- Description: (Optional) Auth token credential. Structure is [documented below](#nested_decrypted_credential_auth_token).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_credentials`
- Description: (Optional) Service account credential. Structure is [documented below](#nested_decrypted_credential_service_account_credentials).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oidc_token`
- Description: (Optional) Google OIDC ID Token. Structure is [documented below](#nested_decrypted_credential_oidc_token). <a name="nested_decrypted_credential_username_and_password"></a>The `username_and_password` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Optional) Username to be used.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Optional) Password to be used. <a name="nested_decrypted_credential_oauth2_authorization_code"></a>The `oauth2_authorization_code` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_id`
- Description: (Optional) The client's id.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_secret`
- Description: (Optional) The client's secret.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scope`
- Description: (Optional) A space-delimited list of requested scope permissions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auth_endpoint`
- Description: (Optional) The auth url endpoint to send the auth code request to.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `token_endpoint`
- Description: (Optional) The token url endpoint to send the token request to. <a name="nested_decrypted_credential_oauth2_client_credentials"></a>The `oauth2_client_credentials` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_id`
- Description: (Optional) The client's ID.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_secret`
- Description: (Optional) The client's secret.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `token_endpoint`
- Description: (Optional) The token endpoint is used by the client to obtain an access token by presenting its authorization grant or refresh token.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scope`
- Description: (Optional) A space-delimited list of requested scope permissions.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `token_params`
- Description: (Optional) Token parameters for the auth request. Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials_token_params).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_type`
- Description: (Optional) Represent how to pass parameters to fetch access token Possible values are: `REQUEST_TYPE_UNSPECIFIED`, `REQUEST_BODY`, `QUERY_PARAMETERS`, `ENCODED_HEADER`. <a name="nested_decrypted_credential_oauth2_client_credentials_token_params"></a>The `token_params` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `entries`
- Description: (Optional) A list of parameter map entries. Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials_token_params_entries). <a name="nested_decrypted_credential_oauth2_client_credentials_token_params_entries"></a>The `entries` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Optional) Key of the map entry. Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials_token_params_entries_entries_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `value`
- Description: (Optional) Value of the map entry. Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials_token_params_entries_entries_value). <a name="nested_decrypted_credential_oauth2_client_credentials_token_params_entries_entries_key"></a>The `key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `literal_value`
- Description: (Optional) Passing a literal value Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials_token_params_entries_entries_key_literal_value). <a name="nested_decrypted_credential_oauth2_client_credentials_token_params_entries_entries_key_literal_value"></a>The `literal_value` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `string_value`
- Description: (Optional) String. <a name="nested_decrypted_credential_oauth2_client_credentials_token_params_entries_entries_value"></a>The `value` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `literal_value`
- Description: (Optional) Passing a literal value Structure is [documented below](#nested_decrypted_credential_oauth2_client_credentials_token_params_entries_entries_value_literal_value). <a name="nested_decrypted_credential_oauth2_client_credentials_token_params_entries_entries_value_literal_value"></a>The `literal_value` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `string_value`
- Description: (Optional) String. <a name="nested_decrypted_credential_jwt"></a>The `jwt` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jwt_header`
- Description: (Optional) Identifies which algorithm is used to generate the signature.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jwt_payload`
- Description: (Optional) Contains a set of claims. The JWT specification defines seven Registered Claim Names which are the standard fields commonly included in tokens. Custom claims are usually also included, depending on the purpose of the token.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret`
- Description: (Optional) User's pre-shared secret to sign the token.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jwt`
- Description: (Output) The token calculated by the header, payload and signature. <a name="nested_decrypted_credential_auth_token"></a>The `auth_token` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) Authentication type, e.g. "Basic", "Bearer", etc.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `token`
- Description: (Optional) The token for the auth type. <a name="nested_decrypted_credential_service_account_credentials"></a>The `service_account_credentials` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) Name of the service account that has the permission to make the request.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scope`
- Description: (Optional) A space-delimited list of requested scope permissions. <a name="nested_decrypted_credential_oidc_token"></a>The `oidc_token` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account_email`
- Description: (Optional) The service account email to be used as the identity for the token.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audience`
- Description: (Optional) Audience to be used when generating OIDC token. The audience claim identifies the recipients that the JWT is intended for.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `token`
- Description: (Output) ID token obtained for the service account.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `token_expire_time`
- Description: (Output) The approximate time until the token retrieved is valid. A timestamp in RFC3339 UTC "Zulu" format, with nanosecond resolution and up to nine fractional digits. Examples: "2014-10-02T15:01:23Z" and "2014-10-02T15:01:23.045123456Z". <a name="nested_client_certificate"></a>The `client_certificate` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_certificate`
- Description: (Required) The ssl certificate encoded in PEM format. This string must include the begin header and end footer lines.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encrypted_private_key`
- Description: (Required) The ssl certificate encoded in PEM format. This string must include the begin header and end footer lines.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `passphrase`
- Description: (Optional) 'passphrase' should be left unset if private key is not encrypted. Note that 'passphrase' is not the password for web server, but an extra layer of security to protected private key.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
