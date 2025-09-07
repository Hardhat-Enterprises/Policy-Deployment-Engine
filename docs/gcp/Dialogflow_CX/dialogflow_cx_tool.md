## 🛡️ Policy Deployment Engine: `dialogflow_cx_tool`

This section provides a concise policy evaluation for the `dialogflow_cx_tool` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_tool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_tool)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The human-readable name of the tool, unique within the agent.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `description`
- Description: (Required) High level description of the Tool and its usage.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `open_api_spec`
- Description: (Optional) OpenAPI specification of the Tool. This field is part of a union field `specification`: Only one of `openApiSpec`, `dataStoreSpec`, or `functionSpec` may be set. Structure is [documented below](#nested_open_api_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_store_spec`
- Description: (Optional) Data store search tool specification. This field is part of a union field `specification`: Only one of `openApiSpec`, `dataStoreSpec`, or `functionSpec` may be set. Structure is [documented below](#nested_data_store_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `function_spec`
- Description: (Optional) Client side executed function specification. This field is part of a union field `specification`: Only one of `openApiSpec`, `dataStoreSpec`, or `functionSpec` may be set. Structure is [documented below](#nested_function_spec).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Optional) The agent to create a Tool for. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>. <a name="nested_open_api_spec"></a>The `open_api_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `authentication`
- Description: (Optional) Optional. Authentication information required by the API. Structure is [documented below](#nested_open_api_spec_authentication).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `tls_config`
- Description: (Optional) Optional. TLS configuration for the HTTPS verification. Structure is [documented below](#nested_open_api_spec_tls_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_directory_config`
- Description: (Optional) Optional. Service Directory configuration. Structure is [documented below](#nested_open_api_spec_service_directory_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `text_schema`
- Description: (Required) The OpenAPI schema specified as a text. This field is part of a union field `schema`: only one of `textSchema` may be set. <a name="nested_open_api_spec_authentication"></a>The `authentication` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_key_config`
- Description: (Optional) Config for API key auth. This field is part of a union field `auth_config`: Only one of `apiKeyConfig`, `oauthConfig`, `serviceAgentAuthConfig`, or `bearerTokenConfig` may be set. Structure is [documented below](#nested_open_api_spec_authentication_api_key_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth_config`
- Description: (Optional) Config for OAuth. This field is part of a union field `auth_config`: Only one of `apiKeyConfig`, `oauthConfig`, `serviceAgentAuthConfig`, or `bearerTokenConfig` may be set. Structure is [documented below](#nested_open_api_spec_authentication_oauth_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_agent_auth_config`
- Description: (Optional) Config for [Diglogflow service agent](https://cloud.google.com/iam/docs/service-agents#dialogflow-service-agent) auth. This field is part of a union field `auth_config`: Only one of `apiKeyConfig`, `oauthConfig`, `serviceAgentAuthConfig`, or `bearerTokenConfig` may be set. Structure is [documented below](#nested_open_api_spec_authentication_service_agent_auth_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bearer_token_config`
- Description: (Optional) Config for bearer token auth. This field is part of a union field `auth_config`: Only one of `apiKeyConfig`, `oauthConfig`, `serviceAgentAuthConfig`, or `bearerTokenConfig` may be set. Structure is [documented below](#nested_open_api_spec_authentication_bearer_token_config). <a name="nested_open_api_spec_authentication_api_key_config"></a>The `api_key_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key_name`
- Description: (Required) The parameter name or the header name of the API key. E.g., If the API request is "https://example.com/act?X-Api-Key=", "X-Api-Key" would be the parameter name.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `api_key`
- Description: (Optional) Optional. The API key. If the `secretVersionForApiKey`` field is set, this field will be ignored. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version_for_api_key`
- Description: (Optional) Optional. The name of the SecretManager secret version resource storing the API key. If this field is set, the apiKey field will be ignored. Format: projects/{project}/secrets/{secret}/versions/{version}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_location`
- Description: (Required) Key location in the request. See [RequestLocation](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents.tools#requestlocation) for valid values. <a name="nested_open_api_spec_authentication_oauth_config"></a>The `oauth_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth_grant_type`
- Description: (Required) OAuth grant types. See [OauthGrantType](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents.tools#oauthgranttype) for valid values
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_id`
- Description: (Required) The client ID from the OAuth provider.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_secret`
- Description: (Optional) Optional. The client secret from the OAuth provider. If the `secretVersionForClientSecret` field is set, this field will be ignored. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version_for_client_secret`
- Description: (Optional) Optional. The name of the SecretManager secret version resource storing the client secret. If this field is set, the clientSecret field will be ignored. Format: projects/{project}/secrets/{secret}/versions/{version}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `token_endpoint`
- Description: (Required) The token endpoint in the OAuth provider to exchange for an access token.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scopes`
- Description: (Optional) Optional. The OAuth scopes to grant. <a name="nested_open_api_spec_authentication_service_agent_auth_config"></a>The `service_agent_auth_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_agent_auth`
- Description: (Optional) Optional. Indicate the auth token type generated from the Diglogflow service agent. The generated token is sent in the Authorization header. See [ServiceAgentAuth](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/projects.locations.agents.tools#serviceagentauth) for valid values. <a name="nested_open_api_spec_authentication_bearer_token_config"></a>The `bearer_token_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `token`
- Description: (Optional) Optional. The text token appended to the text Bearer to the request Authorization header. [Session parameters reference](https://cloud.google.com/dialogflow/cx/docs/concept/parameter#session-ref) can be used to pass the token dynamically, e.g. `$session.params.parameter-id`. **Note**: This property is sensitive and will not be displayed in the plan.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version_for_token`
- Description: (Optional) Optional. The name of the SecretManager secret version resource storing the Bearer token. If this field is set, the `token` field will be ignored. Format: projects/{project}/secrets/{secret}/versions/{version} <a name="nested_open_api_spec_tls_config"></a>The `tls_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `ca_certs`
- Description: (Required) Specifies a list of allowed custom CA certificates for HTTPS verification. Structure is [documented below](#nested_open_api_spec_tls_config_ca_certs). <a name="nested_open_api_spec_tls_config_ca_certs"></a>The `ca_certs` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Required) The name of the allowed custom CA certificates. This can be used to disambiguate the custom CA certificates.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `cert`
- Description: (Required) The allowed custom CA certificates (in DER format) for HTTPS verification. This overrides the default SSL trust store. If this is empty or unspecified, Dialogflow will use Google's default trust store to verify certificates. N.B. Make sure the HTTPS server certificates are signed with "subject alt name". For instance a certificate can be self-signed using the following command: ``` openssl x509 -req -days 200 -in example.com.csr \ -signkey example.com.key \ -out example.com.crt \ -extfile <(printf "\nsubjectAltName='DNS:www.example.com'") ``` A base64-encoded string. <a name="nested_open_api_spec_service_directory_config"></a>The `service_directory_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) The name of [Service Directory](https://cloud.google.com/service-directory/docs) service. Format: projects/<ProjectID>/locations/<LocationID>/namespaces/<NamespaceID>/services/<ServiceID>. LocationID of the service directory must be the same as the location of the agent. <a name="nested_data_store_spec"></a>The `data_store_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_store_connections`
- Description: (Required) List of data stores to search. Structure is [documented below](#nested_data_store_spec_data_store_connections).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `fallback_prompt`
- Description: (Required) Fallback prompt configurations to use. <a name="nested_data_store_spec_data_store_connections"></a>The `data_store_connections` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_store_type`
- Description: (Optional) The type of the connected data store. See [DataStoreType](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/DataStoreConnection#datastoretype) for valid values.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `data_store`
- Description: (Optional) The full name of the referenced data store. Formats: projects/{project}/locations/{location}/collections/{collection}/dataStores/{dataStore} projects/{project}/locations/{location}/dataStores/{dataStore}
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `document_processing_mode`
- Description: (Optional) The document processing mode for the data store connection. Should only be set for PUBLIC_WEB and UNSTRUCTURED data stores. If not set it is considered as DOCUMENTS, as this is the legacy mode. See [DocumentProcessingMode](https://cloud.google.com/dialogflow/cx/docs/reference/rest/v3/DataStoreConnection#documentprocessingmode) for valid values. <a name="nested_function_spec"></a>The `function_spec` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `input_schema`
- Description: (Optional) Optional. The JSON schema is encapsulated in a [google.protobuf.Struct](https://protobuf.dev/reference/protobuf/google.protobuf/#struct) to describe the input of the function. This input is a JSON object that contains the function's parameters as properties of the object
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `output_schema`
- Description: (Optional) Optional. The JSON schema is encapsulated in a [google.protobuf.Struct](https://protobuf.dev/reference/protobuf/google.protobuf/#struct) to describe the output of the function. This output is a JSON object that contains the function's parameters as properties of the object
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
