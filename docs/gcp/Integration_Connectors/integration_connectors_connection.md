## 🛡️ Policy Deployment Engine: `integration_connectors_connection`

This section provides a concise policy evaluation for the `integration_connectors_connection` resource in GCP.

Reference: [Terraform Registry – integration_connectors_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/integration_connectors_connection)

---

## 1. Argument Reference

### `connector_version`
- Description: (Required) connectorVersion of the Connector.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `location`
- Description: (Required) Location in which Connection needs to be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `name`
- Description: (Required) Name of Connection needs to be created.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Optional) An arbitrary description for the Connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `labels`
- Description: (Optional) Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `config_variable`
- Description: (Optional) Config Variables for the connection. Structure is [documented below](#nested_config_variable).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auth_config`
- Description: (Optional) authConfig for the connection. Structure is [documented below](#nested_auth_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `lock_config`
- Description: (Optional) Determines whether or no a connection is locked. If locked, a reason must be specified. Structure is [documented below](#nested_lock_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination_config`
- Description: (Optional) Define the Connectors target endpoint. Structure is [documented below](#nested_destination_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_account`
- Description: (Optional) Service account needed for runtime plane to access Google Cloud resources.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `suspended`
- Description: (Optional) Suspended indicates if a user has suspended a connection or not.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `node_config`
- Description: (Optional) Node configuration for the connection. Structure is [documented below](#nested_node_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `log_config`
- Description: (Optional) Log configuration for the connection. Structure is [documented below](#nested_log_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssl_config`
- Description: (Optional) SSL Configuration of a connection Structure is [documented below](#nested_ssl_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `eventing_enablement_type`
- Description: (Optional) Eventing enablement type. Will be nil if eventing is not enabled. Possible values are: `EVENTING_AND_CONNECTION`, `ONLY_EVENTING`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `eventing_config`
- Description: (Optional) Eventing Configuration of a connection Structure is [documented below](#nested_eventing_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_config_variable"></a>The `config_variable` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Required) Key for the configVariable
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `integer_value`
- Description: (Optional) Integer Value of configVariable
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `string_value`
- Description: (Optional) String Value of configVariabley
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boolean_value`
- Description: (Optional) Boolean Value of configVariable
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_value`
- Description: (Optional) Secret value of configVariable. Structure is [documented below](#nested_config_variable_config_variable_secret_value).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_key_value`
- Description: (Optional) Encryption key value of configVariable. Structure is [documented below](#nested_config_variable_config_variable_encryption_key_value). <a name="nested_config_variable_config_variable_secret_value"></a>The `secret_value` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) Secret version of Secret Value for Config variable. <a name="nested_config_variable_config_variable_encryption_key_value"></a>The `encryption_key_value` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) Type of Encryption Key Possible values are: `GOOGLE_MANAGED`, `CUSTOMER_MANAGED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) The [KMS key name] with which the content of the Operation is encrypted. The expected format: projects/*/locations/*/keyRings/*/cryptoKeys/*. Will be empty string if google managed. <a name="nested_auth_config"></a>The `auth_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auth_type`
- Description: (Required) authType of the Connection Possible values are: `AUTH_TYPE_UNSPECIFIED`, `USER_PASSWORD`, `OAUTH2_JWT_BEARER`, `OAUTH2_CLIENT_CREDENTIALS`, `SSH_PUBLIC_KEY`, `OAUTH2_AUTH_CODE_FLOW`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_variable`
- Description: (Optional) List containing additional auth configs. Structure is [documented below](#nested_auth_config_additional_variable).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auth_key`
- Description: (Optional) The type of authentication configured.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_password`
- Description: (Optional) User password for Authentication. Structure is [documented below](#nested_auth_config_user_password).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth2_jwt_bearer`
- Description: (Optional) OAuth2 JWT Bearer for Authentication. Structure is [documented below](#nested_auth_config_oauth2_jwt_bearer).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth2_client_credentials`
- Description: (Optional) OAuth3 Client Credentials for Authentication. Structure is [documented below](#nested_auth_config_oauth2_client_credentials).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssh_public_key`
- Description: (Optional) SSH Public Key for Authentication. Structure is [documented below](#nested_auth_config_ssh_public_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth2_auth_code_flow`
- Description: (Optional) Parameters to support Oauth 2.0 Auth Code Grant Authentication. Structure is [documented below](#nested_auth_config_oauth2_auth_code_flow). <a name="nested_auth_config_additional_variable"></a>The `additional_variable` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Required) Key for the configVariable
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `integer_value`
- Description: (Optional) Integer Value of configVariable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `string_value`
- Description: (Optional) String Value of configVariabley.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boolean_value`
- Description: (Optional) Boolean Value of configVariable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_value`
- Description: (Optional) Secret value of configVariable. Structure is [documented below](#nested_auth_config_additional_variable_additional_variable_secret_value).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_key_value`
- Description: (Optional) Encryption key value of configVariable. Structure is [documented below](#nested_auth_config_additional_variable_additional_variable_encryption_key_value). <a name="nested_auth_config_additional_variable_additional_variable_secret_value"></a>The `secret_value` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) Secret version of Secret Value for Config variable. <a name="nested_auth_config_additional_variable_additional_variable_encryption_key_value"></a>The `encryption_key_value` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) Type of Encryption Key Possible values are: `GOOGLE_MANAGED`, `CUSTOMER_MANAGED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) The [KMS key name] with which the content of the Operation is encrypted. The expected format: projects/*/locations/*/keyRings/*/cryptoKeys/*. Will be empty string if google managed. <a name="nested_auth_config_user_password"></a>The `user_password` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) Username for Authentication.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Optional) Password for Authentication. Structure is [documented below](#nested_auth_config_user_password_password). <a name="nested_auth_config_user_password_password"></a>The `password` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) The resource name of the secret version in the format, format as: projects/*/secrets/*/versions/*. <a name="nested_auth_config_oauth2_jwt_bearer"></a>The `oauth2_jwt_bearer` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_key`
- Description: (Optional) Secret version reference containing a PKCS#8 PEM-encoded private key associated with the Client Certificate. This private key will be used to sign JWTs used for the jwt-bearer authorization grant. Specified in the form as: projects/*/secrets/*/versions/*. Structure is [documented below](#nested_auth_config_oauth2_jwt_bearer_client_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `jwt_claims`
- Description: (Optional) JwtClaims providers fields to generate the token. Structure is [documented below](#nested_auth_config_oauth2_jwt_bearer_jwt_claims). <a name="nested_auth_config_oauth2_jwt_bearer_client_key"></a>The `client_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) The resource name of the secret version in the format, format as: projects/*/secrets/*/versions/*. <a name="nested_auth_config_oauth2_jwt_bearer_jwt_claims"></a>The `jwt_claims` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `issuer`
- Description: (Optional) Value for the "iss" claim.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `subject`
- Description: (Optional) Value for the "sub" claim.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `audience`
- Description: (Optional) Value for the "aud" claim. <a name="nested_auth_config_oauth2_client_credentials"></a>The `oauth2_client_credentials` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_id`
- Description: (Required) Secret version of Password for Authentication.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_secret`
- Description: (Optional) Secret version reference containing the client secret. Structure is [documented below](#nested_auth_config_oauth2_client_credentials_client_secret). <a name="nested_auth_config_oauth2_client_credentials_client_secret"></a>The `client_secret` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) The resource name of the secret version in the format, format as: projects/*/secrets/*/versions/*. <a name="nested_auth_config_ssh_public_key"></a>The `ssh_public_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Required) The user account used to authenticate.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssh_client_cert`
- Description: (Optional) SSH Client Cert. It should contain both public and private key. Structure is [documented below](#nested_auth_config_ssh_public_key_ssh_client_cert).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cert_type`
- Description: (Optional) Format of SSH Client cert.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ssh_client_cert_pass`
- Description: (Optional) Password (passphrase) for ssh client certificate if it has one. Structure is [documented below](#nested_auth_config_ssh_public_key_ssh_client_cert_pass). <a name="nested_auth_config_ssh_public_key_ssh_client_cert"></a>The `ssh_client_cert` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) The resource name of the secret version in the format, format as: projects/*/secrets/*/versions/*. <a name="nested_auth_config_ssh_public_key_ssh_client_cert_pass"></a>The `ssh_client_cert_pass` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) The resource name of the secret version in the format, format as: projects/*/secrets/*/versions/*. <a name="nested_auth_config_oauth2_auth_code_flow"></a>The `oauth2_auth_code_flow` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_id`
- Description: (Optional) Client ID for user-provided OAuth app.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_secret`
- Description: (Optional) Client secret for user-provided OAuth app. Structure is [documented below](#nested_auth_config_oauth2_auth_code_flow_client_secret).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scopes`
- Description: (Optional) Scopes the connection will request when the user performs the auth code flow.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_pkce`
- Description: (Optional) Whether to enable PKCE when the user performs the auth code flow.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auth_uri`
- Description: (Optional) Auth URL for Authorization Code Flow. <a name="nested_auth_config_oauth2_auth_code_flow_client_secret"></a>The `client_secret` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) The resource name of the secret version in the format, format as: projects/*/secrets/*/versions/*. <a name="nested_lock_config"></a>The `lock_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `locked`
- Description: (Required) Indicates whether or not the connection is locked.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `reason`
- Description: (Optional) Describes why a connection is locked. <a name="nested_destination_config"></a>The `destination_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Required) The key is the destination identifier that is supported by the Connector.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination`
- Description: (Optional) The destinations for the key. Structure is [documented below](#nested_destination_config_destination_config_destination). <a name="nested_destination_config_destination_config_destination"></a>The `destination` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) The port is the target port number that is accepted by the destination.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_attachment`
- Description: (Optional) PSC service attachments. Format: projects/*/regions/*/serviceAttachments/*
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host`
- Description: (Optional) For publicly routable host. <a name="nested_node_config"></a>The `node_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `min_node_count`
- Description: (Required) Minimum number of nodes in the runtime nodes.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `max_node_count`
- Description: (Required) Minimum number of nodes in the runtime nodes. <a name="nested_log_config"></a>The `log_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enabled`
- Description: (Required) Enabled represents whether logging is enabled or not for a connection.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `level`
- Description: (Optional) Log configuration level. Possible values are: `LOG_LEVEL_UNSPECIFIED`, `ERROR`, `INFO`, `DEBUG`. <a name="nested_ssl_config"></a>The `ssl_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Required) Enum for controlling the SSL Type (TLS/MTLS) Possible values are: `TLS`, `MTLS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `trust_model`
- Description: (Optional) Enum for Trust Model Possible values are: `PUBLIC`, `PRIVATE`, `INSECURE`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `private_server_certificate`
- Description: (Optional) Private Server Certificate. Needs to be specified if trust model is PRIVATE. Structure is [documented below](#nested_ssl_config_private_server_certificate).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_certificate`
- Description: (Optional) Client Certificate Structure is [documented below](#nested_ssl_config_client_certificate).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_private_key`
- Description: (Optional) Client Private Key Structure is [documented below](#nested_ssl_config_client_private_key).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_private_key_pass`
- Description: (Optional) Secret containing the passphrase protecting the Client Private Key Structure is [documented below](#nested_ssl_config_client_private_key_pass).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `server_cert_type`
- Description: (Optional) Type of Server Cert (PEM/JKS/.. etc.) Possible values are: `PEM`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_cert_type`
- Description: (Optional) Type of Client Cert (PEM/JKS/.. etc.) Possible values are: `PEM`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `use_ssl`
- Description: (Optional) Bool for enabling SSL
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_variable`
- Description: (Optional) Additional SSL related field values. Structure is [documented below](#nested_ssl_config_additional_variable). <a name="nested_ssl_config_private_server_certificate"></a>The `private_server_certificate` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) Secret version of Secret Value for Config variable. <a name="nested_ssl_config_client_certificate"></a>The `client_certificate` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) Secret version of Secret Value for Config variable. <a name="nested_ssl_config_client_private_key"></a>The `client_private_key` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) Secret version of Secret Value for Config variable. <a name="nested_ssl_config_client_private_key_pass"></a>The `client_private_key_pass` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) Secret version of Secret Value for Config variable. <a name="nested_ssl_config_additional_variable"></a>The `additional_variable` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Required) Key for the configVariable
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `integer_value`
- Description: (Optional) Integer Value of configVariable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `string_value`
- Description: (Optional) String Value of configVariabley.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boolean_value`
- Description: (Optional) Boolean Value of configVariable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_value`
- Description: (Optional) Secret value of configVariable Structure is [documented below](#nested_ssl_config_additional_variable_additional_variable_secret_value).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_key_value`
- Description: (Optional) Encryption key value of configVariable Structure is [documented below](#nested_ssl_config_additional_variable_additional_variable_encryption_key_value). <a name="nested_ssl_config_additional_variable_additional_variable_secret_value"></a>The `secret_value` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) Secret version of Secret Value for Config variable. <a name="nested_ssl_config_additional_variable_additional_variable_encryption_key_value"></a>The `encryption_key_value` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) Type of Encryption Key Possible values are: `GOOGLE_MANAGED`, `CUSTOMER_MANAGED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) The [KMS key name] with which the content of the Operation is encrypted. The expected format: projects/*/locations/*/keyRings/*/cryptoKeys/*. Will be empty string if google managed. <a name="nested_eventing_config"></a>The `eventing_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `registration_destination_config`
- Description: (Required) registrationDestinationConfig Structure is [documented below](#nested_eventing_config_registration_destination_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auth_config`
- Description: (Optional) authConfig for Eventing Configuration. Structure is [documented below](#nested_eventing_config_auth_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_variable`
- Description: (Optional) List containing additional auth configs. Structure is [documented below](#nested_eventing_config_additional_variable).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enrichment_enabled`
- Description: (Optional) Enrichment Enabled. <a name="nested_eventing_config_registration_destination_config"></a>The `registration_destination_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Optional) Key for the connection
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `destination`
- Description: (Optional) destinations for the connection Structure is [documented below](#nested_eventing_config_registration_destination_config_destination). <a name="nested_eventing_config_registration_destination_config_destination"></a>The `destination` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `port`
- Description: (Optional) port number
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_attachment`
- Description: (Optional) Service Attachment
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `host`
- Description: (Optional) Host <a name="nested_eventing_config_auth_config"></a>The `auth_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auth_type`
- Description: (Required) authType of the Connection Possible values are: `USER_PASSWORD`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `additional_variable`
- Description: (Optional) List containing additional auth configs. Structure is [documented below](#nested_eventing_config_auth_config_additional_variable).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `auth_key`
- Description: (Optional) The type of authentication configured.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `user_password`
- Description: (Required) User password for Authentication. Structure is [documented below](#nested_eventing_config_auth_config_user_password). <a name="nested_eventing_config_auth_config_additional_variable"></a>The `additional_variable` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Required) Key for the configVariable
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `integer_value`
- Description: (Optional) Integer Value of configVariable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `string_value`
- Description: (Optional) String Value of configVariabley.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boolean_value`
- Description: (Optional) Boolean Value of configVariable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_value`
- Description: (Optional) Secret value of configVariable Structure is [documented below](#nested_eventing_config_auth_config_additional_variable_additional_variable_secret_value).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_key_value`
- Description: (Optional) Encryption key value of configVariable Structure is [documented below](#nested_eventing_config_auth_config_additional_variable_additional_variable_encryption_key_value). <a name="nested_eventing_config_auth_config_additional_variable_additional_variable_secret_value"></a>The `secret_value` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) Secret version of Secret Value for Config variable. <a name="nested_eventing_config_auth_config_additional_variable_additional_variable_encryption_key_value"></a>The `encryption_key_value` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) Type of Encryption Key Possible values are: `GOOGLE_MANAGED`, `CUSTOMER_MANAGED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) The [KMS key name] with which the content of the Operation is encrypted. The expected format: projects/*/locations/*/keyRings/*/cryptoKeys/*. Will be empty string if google managed. <a name="nested_eventing_config_auth_config_user_password"></a>The `user_password` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `username`
- Description: (Optional) Username for Authentication.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `password`
- Description: (Optional) Password for Authentication. Structure is [documented below](#nested_eventing_config_auth_config_user_password_password). <a name="nested_eventing_config_auth_config_user_password_password"></a>The `password` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) The resource name of the secret version in the format, format as: projects/*/secrets/*/versions/*. <a name="nested_eventing_config_additional_variable"></a>The `additional_variable` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: (Required) Key for the configVariable
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `integer_value`
- Description: (Optional) Integer Value of configVariable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `string_value`
- Description: (Optional) String Value of configVariabley.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `boolean_value`
- Description: (Optional) Boolean Value of configVariable.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_value`
- Description: (Optional) Secret value of configVariable Structure is [documented below](#nested_eventing_config_additional_variable_additional_variable_secret_value).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `encryption_key_value`
- Description: (Optional) Encryption key value of configVariable. Structure is [documented below](#nested_eventing_config_additional_variable_additional_variable_encryption_key_value). <a name="nested_eventing_config_additional_variable_additional_variable_secret_value"></a>The `secret_value` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) Secret version of Secret Value for Config variable. <a name="nested_eventing_config_additional_variable_additional_variable_encryption_key_value"></a>The `encryption_key_value` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `type`
- Description: (Optional) Type of Encryption Key Possible values are: `GOOGLE_MANAGED`, `CUSTOMER_MANAGED`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `kms_key_name`
- Description: (Optional) The [KMS key name] with which the content of the Operation is encrypted. The expected format: projects/*/locations/*/keyRings/*/cryptoKeys/*. Will be empty string if google managed.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
