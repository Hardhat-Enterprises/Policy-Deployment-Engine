## 🛡️ Policy Deployment Engine: `beyondcorp_app_connection`

This section provides a concise policy evaluation for the `beyondcorp_app_connection` resource in GCP.

Reference: [Terraform Registry – beyondcorp_app_connection](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/beyondcorp_app_connection)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | ID of the AppConnection. | true | None | None |
| `region` | The region of the AppConnection. | false | None | None |
| `display_name` | An arbitrary user-provided name for the AppConnection. | false | None | None |
| `labels` | Resource labels to represent user provided metadata. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `type` | The type of network connectivity used by the AppConnection. Refer to https://cloud.google.com/beyondcorp/docs/reference/rest/v1/projects.locations.appConnections#type for a list of possible values. | false | None | None |
| `connectors` | List of AppConnectors that are authorised to be associated with this AppConnection | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### application_endpoint Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `host` | Hostname or IP address of the remote application endpoint. | true | None | None |
| `port` | Port of the remote application endpoint. | true | None | None |

### gateway Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `app_gateway` | AppGateway name in following format: projects/{project_id}/locations/{locationId}/appgateways/{gateway_id}. | true | None | None |
| `type` | The type of hosting used by the gateway. Refer to https://cloud.google.com/beyondcorp/docs/reference/rest/v1/projects.locations.appConnections#Type_1 for a list of possible values. | false | None | None |
| `uri` | (Output) Server-defined URI for this resource. | none | None | None |
| `ingress_port` | (Output) Ingress port reserved on the gateways for this AppConnection, if not specified or zero, the default port is 19443. | none | None | None |
