## 🛡️ Policy Deployment Engine: `integration_connectors_connection`

This section provides a concise policy evaluation for the `integration_connectors_connection` resource in GCP.

Reference: [Terraform Registry – integration_connectors_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/integration_connectors_connection)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `connector_version` | connectorVersion of the Connector. | true | None | None |
| `location` | Location in which Connection needs to be created. | true | None | None |
| `name` | Name of Connection needs to be created. | true | None | None |
| `description` | An arbitrary description for the Connection. | false | None | None |
| `labels` | Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `service_account` | Service account needed for runtime plane to access Google Cloud resources. | false | None | None |
| `suspended` | Suspended indicates if a user has suspended a connection or not. | false | None | None |
| `eventing_enablement_type` | Eventing enablement type. Will be nil if eventing is not enabled. Possible values are: `EVENTING_AND_CONNECTION`, `ONLY_EVENTING`. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### config_variable Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | Key for the configVariable | true | None | None |
| `integer_value` | Integer Value of configVariable | false | None | None |
| `string_value` | String Value of configVariabley | false | None | None |
| `boolean_value` | Boolean Value of configVariable | false | None | None |
| `secret_value` | Secret value of configVariable. Structure is [documented below](#nested_config_variable_config_variable_secret_value). | false | None | None |
| `encryption_key_value` | Encryption key value of configVariable. Structure is [documented below](#nested_config_variable_config_variable_encryption_key_value). | false | None | None |

### auth_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `auth_type` | authType of the Connection Possible values are: `USER_PASSWORD`. | true | None | None |
| `additional_variable` | List containing additional auth configs. Structure is [documented below](#nested_eventing_config_auth_config_additional_variable). | false | None | None |
| `auth_key` | The type of authentication configured. | false | None | None |
| `user_password` | User password for Authentication. Structure is [documented below](#nested_eventing_config_auth_config_user_password). | true | None | None |
| `oauth2_jwt_bearer` | OAuth2 JWT Bearer for Authentication. Structure is [documented below](#nested_auth_config_oauth2_jwt_bearer). | false | None | None |
| `oauth2_client_credentials` | OAuth3 Client Credentials for Authentication. Structure is [documented below](#nested_auth_config_oauth2_client_credentials). | false | None | None |
| `ssh_public_key` | SSH Public Key for Authentication. Structure is [documented below](#nested_auth_config_ssh_public_key). | false | None | None |
| `oauth2_auth_code_flow` | Parameters to support Oauth 2.0 Auth Code Grant Authentication. Structure is [documented below](#nested_auth_config_oauth2_auth_code_flow). | false | None | None |

### lock_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `locked` | Indicates whether or not the connection is locked. | true | None | None |
| `reason` | Describes why a connection is locked. | false | None | None |

### destination_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | The key is the destination identifier that is supported by the Connector. | true | None | None |
| `destination` | The destinations for the key. Structure is [documented below](#nested_destination_config_destination_config_destination). | false | None | None |

### node_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `min_node_count` | Minimum number of nodes in the runtime nodes. | true | None | None |
| `max_node_count` | Minimum number of nodes in the runtime nodes. | true | None | None |

### log_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `enabled` | Enabled represents whether logging is enabled or not for a connection. | true | None | None |
| `level` | Log configuration level. Possible values are: `LOG_LEVEL_UNSPECIFIED`, `ERROR`, `INFO`, `DEBUG`. | false | None | None |

### ssl_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Enum for controlling the SSL Type (TLS/MTLS) Possible values are: `TLS`, `MTLS`. | true | None | None |
| `trust_model` | Enum for Trust Model Possible values are: `PUBLIC`, `PRIVATE`, `INSECURE`. | false | None | None |
| `private_server_certificate` | Private Server Certificate. Needs to be specified if trust model is PRIVATE. Structure is [documented below](#nested_ssl_config_private_server_certificate). | false | None | None |
| `client_certificate` | Client Certificate Structure is [documented below](#nested_ssl_config_client_certificate). | false | None | None |
| `client_private_key` | Client Private Key Structure is [documented below](#nested_ssl_config_client_private_key). | false | None | None |
| `client_private_key_pass` | Secret containing the passphrase protecting the Client Private Key Structure is [documented below](#nested_ssl_config_client_private_key_pass). | false | None | None |
| `server_cert_type` | Type of Server Cert (PEM/JKS/.. etc.) Possible values are: `PEM`. | false | None | None |
| `client_cert_type` | Type of Client Cert (PEM/JKS/.. etc.) Possible values are: `PEM`. | false | None | None |
| `use_ssl` | Bool for enabling SSL | false | None | None |
| `additional_variable` | Additional SSL related field values. Structure is [documented below](#nested_ssl_config_additional_variable). | false | None | None |

### eventing_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `registration_destination_config` | registrationDestinationConfig Structure is [documented below](#nested_eventing_config_registration_destination_config). | true | None | None |
| `auth_config` | authConfig for Eventing Configuration. Structure is [documented below](#nested_eventing_config_auth_config). | false | None | None |
| `additional_variable` | List containing additional auth configs. Structure is [documented below](#nested_eventing_config_additional_variable). | false | None | None |
| `enrichment_enabled` | Enrichment Enabled. | false | None | None |

### secret_value Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret_version` | Secret version of Secret Value for Config variable. | true | None | None |

### encryption_key_value Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | Type of Encryption Key Possible values are: `GOOGLE_MANAGED`, `CUSTOMER_MANAGED`. | false | None | None |
| `kms_key_name` | The [KMS key name] with which the content of the Operation is encrypted. The expected format: projects/*/locations/*/keyRings/*/cryptoKeys/*. Will be empty string if google managed. | false | None | None |

### additional_variable Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | Key for the configVariable | true | None | None |
| `integer_value` | Integer Value of configVariable. | false | None | None |
| `string_value` | String Value of configVariabley. | false | None | None |
| `boolean_value` | Boolean Value of configVariable. | false | None | None |
| `secret_value` | Secret value of configVariable Structure is [documented below](#nested_eventing_config_additional_variable_additional_variable_secret_value). | false | None | None |
| `encryption_key_value` | Encryption key value of configVariable. Structure is [documented below](#nested_eventing_config_additional_variable_additional_variable_encryption_key_value). | false | None | None |

### user_password Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `username` | Username for Authentication. | false | None | None |
| `password` | Password for Authentication. Structure is [documented below](#nested_eventing_config_auth_config_user_password_password). | false | None | None |

### password Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret_version` | The resource name of the secret version in the format, format as: projects/*/secrets/*/versions/*. | true | None | None |

### oauth2_jwt_bearer Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `client_key` | Secret version reference containing a PKCS#8 PEM-encoded private key associated with the Client Certificate. This private key will be used to sign JWTs used for the jwt-bearer authorization grant. Specified in the form as: projects/*/secrets/*/versions/*. Structure is [documented below](#nested_auth_config_oauth2_jwt_bearer_client_key). | false | None | None |
| `jwt_claims` | JwtClaims providers fields to generate the token. Structure is [documented below](#nested_auth_config_oauth2_jwt_bearer_jwt_claims). | false | None | None |

### client_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret_version` | The resource name of the secret version in the format, format as: projects/*/secrets/*/versions/*. | true | None | None |

### jwt_claims Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `issuer` | Value for the "iss" claim. | false | None | None |
| `subject` | Value for the "sub" claim. | false | None | None |
| `audience` | Value for the "aud" claim. | false | None | None |

### oauth2_client_credentials Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `client_id` | Secret version of Password for Authentication. | true | None | None |
| `client_secret` | Secret version reference containing the client secret. Structure is [documented below](#nested_auth_config_oauth2_client_credentials_client_secret). | false | None | None |

### client_secret Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret_version` | The resource name of the secret version in the format, format as: projects/*/secrets/*/versions/*. | true | None | None |

### ssh_public_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `username` | The user account used to authenticate. | true | None | None |
| `ssh_client_cert` | SSH Client Cert. It should contain both public and private key. Structure is [documented below](#nested_auth_config_ssh_public_key_ssh_client_cert). | false | None | None |
| `cert_type` | Format of SSH Client cert. | false | None | None |
| `ssh_client_cert_pass` | Password (passphrase) for ssh client certificate if it has one. Structure is [documented below](#nested_auth_config_ssh_public_key_ssh_client_cert_pass). | false | None | None |

### ssh_client_cert Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret_version` | The resource name of the secret version in the format, format as: projects/*/secrets/*/versions/*. | true | None | None |

### ssh_client_cert_pass Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret_version` | The resource name of the secret version in the format, format as: projects/*/secrets/*/versions/*. | true | None | None |

### oauth2_auth_code_flow Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `client_id` | Client ID for user-provided OAuth app. | false | None | None |
| `client_secret` | Client secret for user-provided OAuth app. Structure is [documented below](#nested_auth_config_oauth2_auth_code_flow_client_secret). | false | None | None |
| `scopes` | Scopes the connection will request when the user performs the auth code flow. | false | None | None |
| `enable_pkce` | Whether to enable PKCE when the user performs the auth code flow. | false | None | None |
| `auth_uri` | Auth URL for Authorization Code Flow. | false | None | None |

### destination Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `port` | port number | false | None | None |
| `service_attachment` | Service Attachment | false | None | None |
| `host` | Host | false | None | None |

### private_server_certificate Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret_version` | Secret version of Secret Value for Config variable. | true | None | None |

### client_certificate Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret_version` | Secret version of Secret Value for Config variable. | true | None | None |

### client_private_key Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret_version` | Secret version of Secret Value for Config variable. | true | None | None |

### client_private_key_pass Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `secret_version` | Secret version of Secret Value for Config variable. | true | None | None |

### registration_destination_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | Key for the connection | false | None | None |
| `destination` | destinations for the connection Structure is [documented below](#nested_eventing_config_registration_destination_config_destination). | false | None | None |
