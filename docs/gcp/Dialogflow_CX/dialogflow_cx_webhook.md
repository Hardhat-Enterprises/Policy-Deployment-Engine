## 🛡️ Policy Deployment Engine: `dialogflow_cx_webhook`

This section provides a concise policy evaluation for the `dialogflow_cx_webhook` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_webhook](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_webhook)

---

## 1. Argument Reference

### `display_name`
- Description: (Required) The human-readable name of the webhook, unique within the agent.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `timeout`
- Description: (Optional) Webhook execution timeout.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `disabled`
- Description: (Optional) Indicates whether the webhook is disabled.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generic_web_service`
- Description: (Optional) Represents configuration for a generic web service. Structure is [documented below](#nested_generic_web_service).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_directory`
- Description: (Optional) Configuration for a Service Directory service. Structure is [documented below](#nested_service_directory).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `security_settings`
- Description: (Optional) Deprecated. Name of the SecuritySettings reference for the agent. Format: projects/<Project ID>/locations/<Location ID>/securitySettings/<Security Settings ID>.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_stackdriver_logging`
- Description: (Optional) Deprecated. Determines whether this agent should log conversation queries.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `enable_spell_correction`
- Description: (Optional) Deprecated. Indicates if automatic spell correction is enabled in detect intent requests.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parent`
- Description: (Optional) The agent to create a webhook for. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>. <a name="nested_generic_web_service"></a>The `generic_web_service` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_ca_certs`
- Description: (Optional) Specifies a list of allowed custom CA certificates (in DER format) for HTTPS verification. This overrides the default SSL trust store. If this is empty or unspecified, Dialogflow will use Google's default trust store to verify certificates. N.B. Make sure the HTTPS server certificates are signed with "subject alt name". For instance a certificate can be self-signed using the following command, openssl x509 -req -days 200 -in example.com.csr \ -signkey example.com.key \ -out example.com.crt \ -extfile <(printf "\nsubjectAltName='DNS:www.example.com'")
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_method`
- Description: (Optional) HTTP method for the flexible webhook calls. Standard webhook always uses POST. Possible values are: `POST`, `GET`, `HEAD`, `PUT`, `DELETE`, `PATCH`, `OPTIONS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth_config`
- Description: (Optional) Represents configuration of OAuth client credential flow for 3rd party API authentication. Structure is [documented below](#nested_generic_web_service_oauth_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameter_mapping`
- Description: (Optional) Maps the values extracted from specific fields of the flexible webhook response into session parameters. - Key: session parameter name - Value: field path in the webhook response
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_body`
- Description: (Optional) Defines a custom JSON object as request body to send to flexible webhook.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_headers`
- Description: (Optional) The HTTP request headers to send together with webhook requests.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version_for_username_password`
- Description: (Optional) The SecretManager secret version resource storing the username:password pair for HTTP Basic authentication. Format: `projects/{project}/secrets/{secret}/versions/{version}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_versions_for_request_headers`
- Description: (Optional) The HTTP request headers to send together with webhook requests. Header values are stored in SecretManager secret versions. When the same header name is specified in both `request_headers` and `secret_versions_for_request_headers`, the value in `secret_versions_for_request_headers` will be used. Structure is [documented below](#nested_generic_web_service_secret_versions_for_request_headers).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_agent_auth`
- Description: (Optional) Indicate the auth token type generated from the [Diglogflow service agent](https://cloud.google.com/iam/docs/service-agents#dialogflow-service-agent). The generated token is sent in the Authorization header. Possible values are: `NONE`, `ID_TOKEN`, `ACCESS_TOKEN`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) The webhook URI for receiving POST requests. It must use https protocol.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `webhook_type`
- Description: (Optional) Type of the webhook. Possible values are: `STANDARD`, `FLEXIBLE`. <a name="nested_generic_web_service_oauth_config"></a>The `oauth_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_id`
- Description: (Required) The client ID provided by the 3rd party platform.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_secret`
- Description: (Optional) The client secret provided by the 3rd party platform.  If the `secret_version_for_client_secret` field is set, this field will be ignored.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scopes`
- Description: (Optional) The OAuth scopes to grant.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version_for_client_secret`
- Description: (Optional) The name of the SecretManager secret version resource storing the client secret. If this field is set, the `client_secret` field will be ignored. Format: `projects/{project}/secrets/{secret}/versions/{version}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `token_endpoint`
- Description: (Required) The token endpoint provided by the 3rd party platform to exchange an access token. <a name="nested_generic_web_service_secret_versions_for_request_headers"></a>The `secret_versions_for_request_headers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) The SecretManager secret version resource storing the header value. Format: `projects/{project}/secrets/{secret}/versions/{version}` <a name="nested_service_directory"></a>The `service_directory` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service`
- Description: (Required) The name of Service Directory service.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `generic_web_service`
- Description: (Optional) Represents configuration for a generic web service. Structure is [documented below](#nested_service_directory_generic_web_service). <a name="nested_service_directory_generic_web_service"></a>The `generic_web_service` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `allowed_ca_certs`
- Description: (Optional) Specifies a list of allowed custom CA certificates (in DER format) for HTTPS verification. This overrides the default SSL trust store. If this is empty or unspecified, Dialogflow will use Google's default trust store to verify certificates. N.B. Make sure the HTTPS server certificates are signed with "subject alt name". For instance a certificate can be self-signed using the following command, openssl x509 -req -days 200 -in example.com.csr \ -signkey example.com.key \ -out example.com.crt \ -extfile <(printf "\nsubjectAltName='DNS:www.example.com'")
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `http_method`
- Description: (Optional) HTTP method for the flexible webhook calls. Standard webhook always uses POST. Possible values are: `POST`, `GET`, `HEAD`, `PUT`, `DELETE`, `PATCH`, `OPTIONS`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `oauth_config`
- Description: (Optional) Represents configuration of OAuth client credential flow for 3rd party API authentication. Structure is [documented below](#nested_service_directory_generic_web_service_oauth_config).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `parameter_mapping`
- Description: (Optional) Maps the values extracted from specific fields of the flexible webhook response into session parameters. - Key: session parameter name - Value: field path in the webhook response
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_body`
- Description: (Optional) Defines a custom JSON object as request body to send to flexible webhook.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `request_headers`
- Description: (Optional) The HTTP request headers to send together with webhook requests.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version_for_username_password`
- Description: (Optional) The SecretManager secret version resource storing the username:password pair for HTTP Basic authentication. Format: `projects/{project}/secrets/{secret}/versions/{version}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_versions_for_request_headers`
- Description: (Optional) The HTTP request headers to send together with webhook requests. Header values are stored in SecretManager secret versions. When the same header name is specified in both `request_headers` and `secret_versions_for_request_headers`, the value in `secret_versions_for_request_headers` will be used. Structure is [documented below](#nested_service_directory_generic_web_service_secret_versions_for_request_headers).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `service_agent_auth`
- Description: (Optional) Indicate the auth token type generated from the [Diglogflow service agent](https://cloud.google.com/iam/docs/service-agents#dialogflow-service-agent). The generated token is sent in the Authorization header. Possible values are: `NONE`, `ID_TOKEN`, `ACCESS_TOKEN`.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `uri`
- Description: (Required) The webhook URI for receiving POST requests. It must use https protocol.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `webhook_type`
- Description: (Optional) Type of the webhook. Possible values are: `STANDARD`, `FLEXIBLE`. <a name="nested_service_directory_generic_web_service_oauth_config"></a>The `oauth_config` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_id`
- Description: (Required) The client ID provided by the 3rd party platform.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `client_secret`
- Description: (Optional) The client secret provided by the 3rd party platform.  If the `secret_version_for_client_secret` field is set, this field will be ignored.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `scopes`
- Description: (Optional) The OAuth scopes to grant.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version_for_client_secret`
- Description: (Optional) The name of the SecretManager secret version resource storing the client secret. If this field is set, the `client_secret` field will be ignored. Format: `projects/{project}/secrets/{secret}/versions/{version}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `token_endpoint`
- Description: (Required) The token endpoint provided by the 3rd party platform to exchange an access token. <a name="nested_service_directory_generic_web_service_secret_versions_for_request_headers"></a>The `secret_versions_for_request_headers` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `key`
- Description: 
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `secret_version`
- Description: (Required) The SecretManager secret version resource storing the header value. Format: `projects/{project}/secrets/{secret}/versions/{version}`
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
