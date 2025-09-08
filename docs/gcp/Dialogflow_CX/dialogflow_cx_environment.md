## 🛡️ Policy Deployment Engine: `dialogflow_cx_environment`

This section provides a concise policy evaluation for the `dialogflow_cx_environment` resource in GCP.

Reference: [Terraform Registry – dialogflow_cx_environment](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dialogflow_cx_environment)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `display_name` | The human-readable name of the environment (unique in an agent). Limit of 64 characters. | true | None | None |
| `description` | The human-readable description of the environment. The maximum length is 500 characters. If exceeded, the request is rejected. | false | None | None |
| `parent` | The Agent to create an Environment for. Format: projects/<Project ID>/locations/<Location ID>/agents/<Agent ID>. | false | None | None |

### version_configs Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `version` | Format: projects/{{project}}/locations/{{location}}/agents/{{agent}}/flows/{{flow}}/versions/{{version}}. | true | None | None |
