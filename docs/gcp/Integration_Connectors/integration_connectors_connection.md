## 🛡️ Policy Deployment Engine: `integration_connectors_connection`

This section provides a concise policy evaluation for the `integration_connectors_connection` resource in GCP.

Reference: [Terraform Registry – integration_connectors_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/integration_connectors_connection)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `connector_version` | connectorVersion of the Connector. | true | false | connectorVersion is not secuirty-related enough to create a policy for | None | None |
| `location` | Location in which Connection needs to be created. | true | false | location is not impactful to the data | None | None |
| `name` | Name of Connection needs to be created. | true | false | name is not secuirty-related enough to create a policy for | None | None |
| `description` | An arbitrary description for the Connection. | false | false | description is not secuirty related. | None | None |
| `labels` | Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | labels is not security related. | None | None |
| `config_variable` | Config Variables for the connection. Structure is [documented below](#nested_config_variable). | false | false | config_variable itself is not secuirty impactful. | None | None |
| `auth_config` | authConfig for the connection. Structure is [documented below](#nested_auth_config). | false | true | the correct password format is critical to maintain security. | None | None |
| `lock_config` | Determines whether or no a connection is locked. If locked, a reason must be specified. Structure is [documented below](#nested_lock_config). | false | false | False | None | None |
| `destination_config` | Define the Connectors target endpoint. Structure is [documented below](#nested_destination_config). | false | true | the destination must be secure to maintain data security. | None | None |
| `service_account` | Service account needed for runtime plane to access Google Cloud resources. | false | false | service account does not impact the security of the data. | None | None |
| `suspended` | Suspended indicates if a user has suspended a connection or not. | false | false | suspended is not security related | None | None |
| `node_config` | Node configuration for the connection. Structure is [documented below](#nested_node_config). | false | false | node condiguration has no impact on data security | None | None |
| `log_config` | Log configuration for the connection. Structure is [documented below](#nested_log_config). | false | false | log configuration is not secuirty related enough to create a policy for | None | None |
| `ssl_config` | SSL Configuration of a connection Structure is [documented below](#nested_ssl_config). | false | true | trust model and use ssl are critical to maintain data security. | None | None |
| `eventing_enablement_type` | Eventing enablement type. Will be nil if eventing is not enabled. Possible values are: `EVENTING_AND_CONNECTION`, `ONLY_EVENTING`. | false | false | type is not security related as it's just an identifier | None | None |
| `eventing_config` | Eventing Configuration of a connection Structure is [documented below](#nested_eventing_config). | false | false | eventing config is not secuirty related enough to create a policy for | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | not security related as it's just data sources. | None | None |
| `secret_value` |  | false | false | secret value is not security impactful as it's just value | None | None |
| `encryption_key_value` |  | false | false | not security related as it's just value | None | None |
| `additional_variable` |  | false | false | not security related. | None | None |
| `user_password` |  | false | true | password must be secured to maintain data security. | None | None |
| `password` |  | false | false | password for secret version is not security impactful enoguh to create a policy for | None | None |
| `oauth2_jwt_bearer` |  | false | false | not security related to the data | None | None |
| `client_key` |  | false | false | client key for secret version is not security impactful enough to create a policy for | None | None |
| `jwt_claims` |  | false | false | jwt claims is not security related. | None | None |
| `oauth2_client_credentials` |  | false | false | not security impactful to the data | None | None |
| `client_secret` |  | false | false | client secret is not security impactful enough to create a policy for | None | None |
| `ssh_public_key` |  | false | false | ssh public key is not security related to the data | None | None |
| `ssh_client_cert` |  | false | false | not security impactful to the data | None | None |
| `ssh_client_cert_pass` |  | false | false | password for client cert does not impact the data security | None | None |
| `oauth2_auth_code_flow` |  | false | false | code flow is not security related to the data | None | None |
| `destination` |  | false | true | the destination must be secure to maintain data security. | None | None |
| `private_server_certificate` |  | false | false | not security impactful to the data | None | None |
| `client_certificate` |  | false | false | client certificate does not impact the data security | None | None |
| `client_private_key` |  | false | false | client private key does not impact the data security | None | None |
| `client_private_key_pass` |  | false | false | key pass for client private key does not impact the data security | None | None |
| `registration_destination_config` |  | false | false | registration destination is not security impactful | None | None |

### config_variable Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key` | Key for the configVariable | true | false | None | None | None |
| `integer_value` | Integer Value of configVariable | false | false | not security related as it's just value | None | None |
| `string_value` | String Value of configVariabley | false | false | not security related as it's just value | None | None |
| `boolean_value` | Boolean Value of configVariable | false | false | not security related as it's just value | None | None |
| `secret_value` | Secret value of configVariable. Structure is [documented below](#nested_config_variable_config_variable_secret_value). | false | false | not security related as it's just value | None | None |
| `encryption_key_value` | Encryption key value of configVariable. Structure is [documented below](#nested_config_variable_config_variable_encryption_key_value). | false | false | not security related as it's just value | None | None |

### auth_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `auth_type` | authType of the Connection Possible values are: `USER_PASSWORD`. | true | true | the password must be secured | None | None |
| `additional_variable` | List containing additional auth configs. Structure is [documented below](#nested_eventing_config_auth_config_additional_variable). | false | false | not security related as it's just value | None | None |
| `auth_key` | The type of authentication configured. | false | false | key is not security related as it's just an identifier | None | None |
| `user_password` | User password for Authentication. Structure is [documented below](#nested_eventing_config_auth_config_user_password). | true | true | the correct password format is critical to maintain security. | google_secret_manager_secret_version.secret-version-basic.name | dummypassword |
| `oauth2_jwt_bearer` | OAuth2 JWT Bearer for Authentication. Structure is [documented below](#nested_auth_config_oauth2_jwt_bearer). | false | false | not secuirty-related enough to create a policy for | None | None |
| `oauth2_client_credentials` | OAuth3 Client Credentials for Authentication. Structure is [documented below](#nested_auth_config_oauth2_client_credentials). | false | false | not secuirty-related enough to create a policy for | None | None |
| `ssh_public_key` | SSH Public Key for Authentication. Structure is [documented below](#nested_auth_config_ssh_public_key). | false | false | public key is not secuirty-related enough to create a policy for | None | None |
| `oauth2_auth_code_flow` | Parameters to support Oauth 2.0 Auth Code Grant Authentication. Structure is [documented below](#nested_auth_config_oauth2_auth_code_flow). | false | false | not secuirty-related enough to create a policy for | None | None |

### lock_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `locked` | Indicates whether or not the connection is locked. | true | false | locked is not secuirty-related enough to create a policy for | None | None |
| `reason` | Describes why a connection is locked. | false | false | reason is not secuirty related. | None | None |

### destination_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key` | The key is the destination identifier that is supported by the Connector. | true | false | key is not security related as it's just an identifier | None | None |
| `destination` | The destinations for the key. Structure is [documented below](#nested_destination_config_destination_config_destination). | false | true | destination must be secure to maintain data security | None | None |

### node_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `min_node_count` | Minimum number of nodes in the runtime nodes. | true | false | min number of nodes has no impact on data security | None | None |
| `max_node_count` | Maximum number of nodes in the runtime nodes. | true | false | max number of nodes has no impact on data security | None | None |

### log_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled` | Enabled represents whether logging is enabled or not for a connection. | true | false | enabled is not secuirty related. | None | None |
| `level` | Log configuration level. Possible values are: `LOG_LEVEL_UNSPECIFIED`, `ERROR`, `INFO`, `DEBUG`. | false | false | level is not secuirty related. | None | None |

### ssl_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | Enum for controlling the SSL Type (TLS/MTLS) Possible values are: `TLS`, `MTLS`. | true | false | type is not security impactful as it's just an identifier | None | None |
| `trust_model` | Enum for Trust Model Possible values are: `PUBLIC`, `PRIVATE`, `INSECURE`. | false | true | insecure trust model should be avoided to maintain data security. | PRIVATE | INSECURE |
| `private_server_certificate` | Private Server Certificate. Needs to be specified if trust model is PRIVATE. Structure is [documented below](#nested_ssl_config_private_server_certificate). | false | false | not neccessary when trust model is PUBLIC. | None | None |
| `client_certificate` | Client Certificate Structure is [documented below](#nested_ssl_config_client_certificate). | false | false | client certificate is not secuirty impactful enough to create a policy for | None | None |
| `client_private_key` | Client Private Key Structure is [documented below](#nested_ssl_config_client_private_key). | false | false | client private key is not secuirty impactful enough to create a policy for | None | None |
| `client_private_key_pass` | Secret containing the passphrase protecting the Client Private Key Structure is [documented below](#nested_ssl_config_client_private_key_pass). | false | false | key pass is for client private key which is not secuirty impactful enough to create a policy for | None | None |
| `server_cert_type` | Type of Server Cert (PEM/JKS/.. etc.) Possible values are: `PEM`. | false | false | type is not security impactful as it's just an identifier | None | None |
| `client_cert_type` | Type of Client Cert (PEM/JKS/.. etc.) Possible values are: `PEM`. | false | false | type is not security impactful as it's just an identifier | None | None |
| `use_ssl` | Bool for enabling SSL | false | true | bool should be true to enable ssl. | true | false |
| `additional_variable` | Additional SSL related field values. Structure is [documented below](#nested_ssl_config_additional_variable). | false | false | not security related as it's just value | None | None |

### eventing_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `registration_destination_config` | registrationDestinationConfig Structure is [documented below](#nested_eventing_config_registration_destination_config). | true | false | registration destination config is not security impactful enough to create a policy for | None | None |
| `auth_config` | authConfig for Eventing Configuration. Structure is [documented below](#nested_eventing_config_auth_config). | false | false | auth config in eventing config is not secuirty impactful. | None | None |
| `additional_variable` | List containing additional auth configs. Structure is [documented below](#nested_eventing_config_additional_variable). | false | false | not security related as it's just list of additional variables | None | None |
| `enrichment_enabled` | Enrichment Enabled. | false | false | not security related. | None | None |

### secret_value Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret_version` | Secret version of Secret Value for Config variable. | true | false | secret version is not security impactful to create a policy for | None | None |

### encryption_key_value Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `type` | Type of Encryption Key Possible values are: `GOOGLE_MANAGED`, `CUSTOMER_MANAGED`. | false | false | type is not security related as it's just an identifier | None | None |
| `kms_key_name` | The [KMS key name] with which the content of the Operation is encrypted. The expected format: projects/*/locations/*/keyRings/*/cryptoKeys/*. Will be empty string if google managed. | false | false | KMS key name is not security impactful enough to create a policy for. | None | None |

### additional_variable Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key` | Key for the configVariable | true | false | key is not security impactful. | None | None |
| `integer_value` | Integer Value of configVariable. | false | false | not security related as it's just value | None | None |
| `string_value` | String Value of configVariabley. | false | false | not security related as it's just value. | None | None |
| `boolean_value` | Boolean Value of configVariable. | false | false | not security related as it's just value | None | None |
| `secret_value` | Secret value of configVariable Structure is [documented below](#nested_eventing_config_additional_variable_additional_variable_secret_value). | false | false | not security related as it's just value | None | None |
| `encryption_key_value` | Encryption key value of configVariable. Structure is [documented below](#nested_eventing_config_additional_variable_additional_variable_encryption_key_value). | false | false | key value is not security impactful | None | None |

### user_password Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `username` | Username for Authentication. | false | false | username is not security impactful. | None | None |
| `password` | Password for Authentication. Structure is [documented below](#nested_eventing_config_auth_config_user_password_password). | false | true | password must be correctly formatted to maintain security. | google_secret_manager_secret_version.secret-version.name | dummypassword |

### password Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret_version` | The resource name of the secret version in the format, format as: projects/*/secrets/*/versions/*. | true | false | secret version is not security impactful to create a policy for | None | None |

### oauth2_jwt_bearer Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `client_key` | Secret version reference containing a PKCS#8 PEM-encoded private key associated with the Client Certificate. This private key will be used to sign JWTs used for the jwt-bearer authorization grant. Specified in the form as: projects/*/secrets/*/versions/*. Structure is [documented below](#nested_auth_config_oauth2_jwt_bearer_client_key). | false | false | client key for jwt is not security impactful enough to create a policy for | None | None |
| `jwt_claims` | JwtClaims providers fields to generate the token. Structure is [documented below](#nested_auth_config_oauth2_jwt_bearer_jwt_claims). | false | false | jwt claims is not security related as it's just a token generator | None | None |

### client_key Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret_version` | The resource name of the secret version in the format, format as: projects/*/secrets/*/versions/*. | true | false | not security impactful enough to create a policy for | None | None |

### jwt_claims Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `issuer` | Value for the "iss" claim. | false | false | not security related as it's just a value | None | None |
| `subject` | Value for the "sub" claim. | false | false | not security related as it's just a value | None | None |
| `audience` | Value for the "aud" claim. | false | false | not security related as it's just a value | None | None |

### oauth2_client_credentials Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `client_id` | Secret version of Password for Authentication. | true | false | not security related to the data | None | None |
| `client_secret` | Secret version reference containing the client secret. Structure is [documented below](#nested_auth_config_oauth2_client_credentials_client_secret). | false | false | client secret under secret version is not security impactful enough to create a policy for | None | None |

### client_secret Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret_version` | The resource name of the secret version in the format, format as: projects/*/secrets/*/versions/*. | true | false | version is not security related | None | None |

### ssh_public_key Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `username` | The user account used to authenticate. | true | false | username is not security related | None | None |
| `ssh_client_cert` | SSH Client Cert. It should contain both public and private key. Structure is [documented below](#nested_auth_config_ssh_public_key_ssh_client_cert). | false | false | client cert is not security related to the data | None | None |
| `cert_type` | Format of SSH Client cert. | false | false | type not security related | None | None |
| `ssh_client_cert_pass` | Password (passphrase) for ssh client certificate if it has one. Structure is [documented below](#nested_auth_config_ssh_public_key_ssh_client_cert_pass). | false | false | password for client cert does not impact the data security | None | None |

### ssh_client_cert Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret_version` | The resource name of the secret version in the format, format as: projects/*/secrets/*/versions/*. | true | false | version is not security related | None | None |

### ssh_client_cert_pass Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret_version` | The resource name of the secret version in the format, format as: projects/*/secrets/*/versions/*. | true | false | version is not security impactful enough to create a policy for | None | None |

### oauth2_auth_code_flow Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `client_id` | Client ID for user-provided OAuth app. | false | false | not security related to the data | None | None |
| `client_secret` | Client secret for user-provided OAuth app. Structure is [documented below](#nested_auth_config_oauth2_auth_code_flow_client_secret). | false | false | not security impactful enough to create a policy for | None | None |
| `scopes` | Scopes the connection will request when the user performs the auth code flow. | false | false | scopes is not security related | None | None |
| `enable_pkce` | Whether to enable PKCE when the user performs the auth code flow. | false | false | not security related | None | None |
| `auth_uri` | Auth URL for Authorization Code Flow. | false | false | not security related | None | None |

### destination Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `port` | port number | false | true | the port number should be a secured port to maintain the data security. | 443 | 80 |
| `service_attachment` | Service Attachment | false | false | service attachment is not security related | None | None |
| `host` | Host | false | false | host is not security impactful to the data | None | None |

### private_server_certificate Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret_version` | Secret version of Secret Value for Config variable. | true | false | version is not security related | None | None |

### client_certificate Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret_version` | Secret version of Secret Value for Config variable. | true | false | version is not security related | None | None |

### client_private_key Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret_version` | Secret version of Secret Value for Config variable. | true | false | version is not security related | None | None |

### client_private_key_pass Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `secret_version` | Secret version of Secret Value for Config variable. | true | false | version is not security related | None | None |

### registration_destination_config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key` | Key for the connection | false | false | key is not security impactful. | None | None |
| `destination` | destinations for the connection Structure is [documented below](#nested_eventing_config_registration_destination_config_destination). | false | false | destination for registration is not security impactful | None | None |
