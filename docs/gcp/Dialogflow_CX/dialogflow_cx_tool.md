## 🛡️ Policy Deployment Engine: `dialogflow_cx_tool`

This section provides a concise policy evaluation for the `dialogflow_cx_tool` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_tool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_tool)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The human-readable name of the tool, unique within the agent. | true | None | None |
| `description` | High level description of the Tool and its usage. | true | None | None |
| `parent` | The agent to create a Tool for. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>. | false | None | None |

### open_api_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `authentication` | Optional. Authentication information required by the API. Structure is [documented below](#nested_open_api_spec_authentication). | false | None | None |
| `tls_config` | Optional. TLS configuration for the HTTPS verification. Structure is [documented below](#nested_open_api_spec_tls_config). | false | None | None |
| `service_directory_config` | Optional. Service Directory configuration. Structure is [documented below](#nested_open_api_spec_service_directory_config). | false | None | None |
| `text_schema` | The OpenAPI schema specified as a text. This field is part of a union field `schema`: only one of `textSchema` may be set. | true | None | None |

### data_store_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `data_store_connections` | List of data stores to search. Structure is [documented below](#nested_data_store_spec_data_store_connections). | true | None | None |
| `fallback_prompt` | Fallback prompt configurations to use. | true | None | None |

### function_spec Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `input_schema` | Optional. The JSON schema is encapsulated in a [google.protobuf.Struct](https://protobuf.dev/reference/protobuf/google.protobuf/#struct) to describe the input of the function. This input is a JSON object that contains the function's parameters as properties of the object | false | None | None |
| `output_schema` | Optional. The JSON schema is encapsulated in a [google.protobuf.Struct](https://protobuf.dev/reference/protobuf/google.protobuf/#struct) to describe the output of the function. This output is a JSON object that contains the function's parameters as properties of the object | false | None | None |

### authentication Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `api_key_config` | Config for API key auth. This field is part of a union field `auth_config`: Only one of `apiKeyConfig`, `oauthConfig`, `serviceAgentAuthConfig`, or `bearerTokenConfig` may be set. Structure is [documented below](#nested_open_api_spec_authentication_api_key_config). | false | None | None |
| `oauth_config` | Config for OAuth. This field is part of a union field `auth_config`: Only one of `apiKeyConfig`, `oauthConfig`, `serviceAgentAuthConfig`, or `bearerTokenConfig` may be set. Structure is [documented below](#nested_open_api_spec_authentication_oauth_config). | false | None | None |
| `service_agent_auth_config` | Config for [Diglogflow service agent](https://cloud.google.com/iam/docs/service-agents#dialogflow-service-agent) auth. This field is part of a union field `auth_config`: Only one of `apiKeyConfig`, `oauthConfig`, `serviceAgentAuthConfig`, or `bearerTokenConfig` may be set. Structure is [documented below](#nested_open_api_spec_authentication_service_agent_auth_config). | false | None | None |
| `bearer_token_config` | Config for bearer token auth. This field is part of a union field `auth_config`: Only one of `apiKeyConfig`, `oauthConfig`, `serviceAgentAuthConfig`, or `bearerTokenConfig` may be set. Structure is [documented below](#nested_open_api_spec_authentication_bearer_token_config). | false | None | None |

### api_key_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key_name` | The parameter name or the header name of the API key. E.g., If the API request is "https://example.com/act?X-Api-Key=", "X-Api-Key" would be the parameter name. | true | None | None |
| `api_key` | Optional. The API key. If the `secretVersionForApiKey`` field is set, this field will be ignored. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `secret_version_for_api_key` | Optional. The name of the SecretManager secret version resource storing the API key. If this field is set, the apiKey field will be ignored. Format: projects/{project}/secrets/{secret}/versions/{version} | false | None | None |
| `request_location` | Key location in the request. See [RequestLocation](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents.tools#requestlocation) for valid values. | true | None | None |

### oauth_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `oauth_grant_type` | OAuth grant types. See [OauthGrantType](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents.tools#oauthgranttype) for valid values | true | None | None |
| `client_id` | The client ID from the OAuth provider. | true | None | None |
| `client_secret` | Optional. The client secret from the OAuth provider. If the `secretVersionForClientSecret` field is set, this field will be ignored. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `secret_version_for_client_secret` | Optional. The name of the SecretManager secret version resource storing the client secret. If this field is set, the clientSecret field will be ignored. Format: projects/{project}/secrets/{secret}/versions/{version} | false | None | None |
| `token_endpoint` | The token endpoint in the OAuth provider to exchange for an access token. | true | None | None |
| `scopes` | Optional. The OAuth scopes to grant. | false | None | None |

### service_agent_auth_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service_agent_auth` | Optional. Indicate the auth token type generated from the Diglogflow service agent. The generated token is sent in the Authorization header. See [ServiceAgentAuth](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents.tools#serviceagentauth) for valid values. | false | None | None |

### bearer_token_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `token` | Optional. The text token appended to the text Bearer to the request Authorization header. [Session parameters reference](https://cloud.google.com/dialogflow/cx/docs/concept/parameter#session-ref) can be used to pass the token dynamically, e.g. `$session.params.parameter-id`. **Note**: This property is sensitive and will not be displayed in the plan. | false | None | None |
| `secret_version_for_token` | Optional. The name of the SecretManager secret version resource storing the Bearer token. If this field is set, the `token` field will be ignored. Format: projects/{project}/secrets/{secret}/versions/{version} | false | None | None |

### tls_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `ca_certs` | Specifies a list of allowed custom CA certificates for HTTPS verification. Structure is [documented below](#nested_open_api_spec_tls_config_ca_certs). | true | None | None |

### ca_certs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The name of the allowed custom CA certificates. This can be used to disambiguate the custom CA certificates. | true | None | None |
| `cert` | The allowed custom CA certificates (in DER format) for HTTPS verification. This overrides the default SSL trust store. If this is empty or unspecified, Dialogflow will use Google's default trust store to verify certificates. N.B. Make sure the HTTPS server certificates are signed with "subject alt name". For instance a certificate can be self-signed using the following command: ``` openssl x509 -req -days 200 -in example.com.csr \ -signkey example.com.key \ -out example.com.crt \ -extfile <(printf "\nsubjectAltName='DNS:www.example.com'") ``` A base64-encoded string. | true | None | None |

### service_directory_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service` | The name of [Service Directory](https://cloud.google.com/service-directory/docs) service. Format: projects/<ProjectID>/locations/<LocationID>/namespaces/<NamespaceID>/services/<ServiceID>. LocationID of the service directory must be the same as the location of the agent. | true | None | None |

### data_store_connections Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `data_store_type` | The type of the connected data store. See [DataStoreType](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/DataStoreConnection#datastoretype) for valid values. | false | None | None |
| `data_store` | The full name of the referenced data store. Formats: projects/{project}/locations/{location}/collections/{collection}/dataStores/{dataStore} projects/{project}/locations/{location}/dataStores/{dataStore} | false | None | None |
| `document_processing_mode` | The document processing mode for the data store connection. Should only be set for PUBLIC_WEB and UNSTRUCTURED data stores. If not set it is considered as DOCUMENTS, as this is the legacy mode. See [DocumentProcessingMode](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/DataStoreConnection#documentprocessingmode) for valid values. | false | None | None |
