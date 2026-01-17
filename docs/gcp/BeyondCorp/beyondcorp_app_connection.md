## 🛡️ Policy Deployment Engine: `beyondcorp_app_connection`

This section provides a concise policy evaluation for the `beyondcorp_app_connection` resource in GCP.

Reference: [Terraform Registry – beyondcorp_app_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/beyondcorp_app_connection)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | ID of the AppConnection. | true | false | This name is not related to security related policies. | None | None |
| `application_endpoint` | Address of the remote application endpoint for the BeyondCorp AppConnection. Structure is [documented below](#nested_application_endpoint). | true | true | This is the address of the remote application endpoint. | None | None |
| `region` | The region of the AppConnection. | false | true | This defines the geographical location of the AppConnection, which can have implications for data residency and latency. | australia-southeast1, australia-southeast2 | europe-west1, us-central1 |
| `display_name` | An arbitrary user-provided name for the AppConnection. | false | false | Display name is for user convenience and does not impact security. | None | None |
| `labels` | Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Labels are used for metadata and do not directly impact security. | None | None |
| `type` | The type of network connectivity used by the AppConnection. Refer to https://cloud.google.com/beyondcorp/docs/reference/rest/v1/projects.locations.appConnections#type for a list of possible values. | false | false | The type of network connectivity does not inherently affect security policies. | None | None |
| `connectors` | List of AppConnectors that are authorised to be associated with this AppConnection | false | false | This attribute associates the AppConnectors to the AppConnection and does not directly impact security. | None | None |
| `gateway` | Gateway used by the AppConnection. Structure is [documented below](#nested_gateway). | false | false | The gateway configuration for this AppConnection is not directly impact security policies. | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | The project field is used to identify the project resource. Some organisations may have policies that restrict which projects can be used, but this is not inherently a security issue. | None | None |

### application_endpoint Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `host` | Hostname or IP address of the remote application endpoint. | true | true | This is the hostname of the remote application endpoint.It shoulld be either a valid IPv4 address or a fully-qualified domain name. | svc.internal | svc, 256.256.256.256 |
| `port` | Port of the remote application endpoint. | true | true | This is crucial to establish a connection to the remote application endpoint. | 443, 8443, 9443 | 8081, 8080, 80 |
| `protocol` | Protocol used to connect to the application endpoint. | false | true | HTTPS ensures all communication is encrypted and protected. | https | http, ftp |
| `tls_enabled` | Indicating secure TLS connection or not when communicating with the application endpoint. | false | true | Using TLS helps protect data while it is being transmitted by preventing unauthorised access and reducing the risk of interception or modification. | true | false |

### gateway Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `app_gateway` | AppGateway name in following format: projects/{project_id}/locations/{locationId}/appgateways/{gateway_id}. | true | false | The AppGateway name is used to identify the gateway resource. | None | None |
| `type` | The type of hosting used by the gateway. Refer to https://cloud.google.com/beyondcorp/docs/reference/rest/v1/projects.locations.appConnections#Type_1 for a list of possible values. | false | false | The type of hosting does not inherently affect security policies. | None | None |
| `uri` | (Output) Server-defined URI for this resource. | false | false | The URI is used to identify the gateway resource. | None | None |
| `ingress_port` | (Output) Ingress port reserved on the gateways for this AppConnection, if not specified or zero, the default port is 19443. | false | false | The ingress port is used to identify the gateway resource. And it should not be set to a common web port. | None | None |
