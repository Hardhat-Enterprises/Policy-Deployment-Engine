## 🛡️ Policy Deployment Engine: `dialogflow_fulfillment`

This section provides a concise policy evaluation for the `dialogflow_fulfillment` resource in GCP.

Reference: [Terraform Registry – dialogflow_fulfillment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_fulfillment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The human-readable name of the fulfillment, unique within the agent. | true | None | None |
| `enabled` | Whether fulfillment is enabled. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### features Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `type` | The type of the feature that enabled for fulfillment. * SMALLTALK: Fulfillment is enabled for SmallTalk. Possible values are: `SMALLTALK`. | true | None | None |

### generic_web_service Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `uri` | The fulfillment URI for receiving POST requests. It must use https protocol. | true | None | None |
| `username` | The user name for HTTP Basic authentication. | false | None | None |
| `password` | The password for HTTP Basic authentication. | false | None | None |
| `request_headers` | The HTTP request headers to send together with fulfillment requests. | false | None | None |
