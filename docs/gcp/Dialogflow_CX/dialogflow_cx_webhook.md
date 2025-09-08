## 🛡️ Policy Deployment Engine: `dialogflow_cx_webhook`

This section provides a concise policy evaluation for the `dialogflow_cx_webhook` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_webhook](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_webhook)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The human-readable name of the webhook, unique within the agent. | true | None | None |
| `timeout` | Webhook execution timeout. | false | None | None |
| `disabled` | Indicates whether the webhook is disabled. | false | None | None |
| `security_settings` | Deprecated. Name of the SecuritySettings reference for the agent. Format: projects/<Project ID>/locations/<Location ID>/securitySettings/<Security Settings ID>. | false | None | None |
| `enable_stackdriver_logging` | Deprecated. Determines whether this agent should log conversation queries. | false | None | None |
| `enable_spell_correction` | Deprecated. Indicates if automatic spell correction is enabled in detect intent requests. | false | None | None |
| `parent` | The agent to create a webhook for. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>. | false | None | None |

### generic_web_service Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `allowed_ca_certs` | Specifies a list of allowed custom CA certificates (in DER format) for HTTPS verification. This overrides the default SSL trust store. If this is empty or unspecified, Dialogflow will use Google's default trust store to verify certificates. N.B. Make sure the HTTPS server certificates are signed with "subject alt name". For instance a certificate can be self-signed using the following command, openssl x509 -req -days 200 -in example.com.csr \ -signkey example.com.key \ -out example.com.crt \ -extfile <(printf "\nsubjectAltName='DNS:www.example.com'") | false | None | None |
| `http_method` | HTTP method for the flexible webhook calls. Standard webhook always uses POST. Possible values are: `POST`, `GET`, `HEAD`, `PUT`, `DELETE`, `PATCH`, `OPTIONS`. | false | None | None |
| `oauth_config` | Represents configuration of OAuth client credential flow for 3rd party API authentication. Structure is [documented below](#nested_service_directory_generic_web_service_oauth_config). | false | None | None |
| `parameter_mapping` | Maps the values extracted from specific fields of the flexible webhook response into session parameters. - Key: session parameter name - Value: field path in the webhook response | false | None | None |
| `request_body` | Defines a custom JSON object as request body to send to flexible webhook. | false | None | None |
| `request_headers` | The HTTP request headers to send together with webhook requests. | false | None | None |
| `secret_version_for_username_password` | The SecretManager secret version resource storing the username:password pair for HTTP Basic authentication. Format: `projects/{project}/secrets/{secret}/versions/{version}` | false | None | None |
| `secret_versions_for_request_headers` | The HTTP request headers to send together with webhook requests. Header values are stored in SecretManager secret versions. When the same header name is specified in both `request_headers` and `secret_versions_for_request_headers`, the value in `secret_versions_for_request_headers` will be used. Structure is [documented below](#nested_service_directory_generic_web_service_secret_versions_for_request_headers). | false | None | None |
| `service_agent_auth` | Indicate the auth token type generated from the [Diglogflow service agent](https://cloud.google.com/iam/docs/service-agents#dialogflow-service-agent). The generated token is sent in the Authorization header. Possible values are: `NONE`, `ID_TOKEN`, `ACCESS_TOKEN`. | false | None | None |
| `uri` | The webhook URI for receiving POST requests. It must use https protocol. | true | None | None |
| `webhook_type` | Type of the webhook. Possible values are: `STANDARD`, `FLEXIBLE`. | false | None | None |

### service_directory Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service` | The name of Service Directory service. | true | None | None |
| `generic_web_service` | Represents configuration for a generic web service. Structure is [documented below](#nested_service_directory_generic_web_service). | false | None | None |

### oauth_config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `client_id` | The client ID provided by the 3rd party platform. | true | None | None |
| `client_secret` | The client secret provided by the 3rd party platform.  If the `secret_version_for_client_secret` field is set, this field will be ignored. | false | None | None |
| `scopes` | The OAuth scopes to grant. | false | None | None |
| `secret_version_for_client_secret` | The name of the SecretManager secret version resource storing the client secret. If this field is set, the `client_secret` field will be ignored. Format: `projects/{project}/secrets/{secret}/versions/{version}` | false | None | None |
| `token_endpoint` | The token endpoint provided by the 3rd party platform to exchange an access token. | true | None | None |

### secret_versions_for_request_headers Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` |  | none | None | None |
| `secret_version` | The SecretManager secret version resource storing the header value. Format: `projects/{project}/secrets/{secret}/versions/{version}` | true | None | None |
