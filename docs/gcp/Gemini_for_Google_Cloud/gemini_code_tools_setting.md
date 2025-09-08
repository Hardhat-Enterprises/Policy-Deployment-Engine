## 🛡️ Policy Deployment Engine: `gemini_code_tools_setting`

This section provides a concise policy evaluation for the `gemini_code_tools_setting` resource in GCP.

Reference: [Terraform Registry – gemini_code_tools_setting](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_code_tools_setting)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `code_tools_setting_id` | Id of the Code Tools Setting. | true | None | None |
| `labels` | Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### enabled_tool Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `account_connector` | Link to the Dev Connect Account Connector that holds the user credentials. projects/{project}/locations/{location}/accountConnectors/{account_connector_id} | false | None | None |
| `handle` | Handle used to invoke the tool. | true | None | None |
| `tool` | Link to the Tool | true | None | None |
| `config` | Configuration parameters for the tool. Structure is [documented below](#nested_enabled_tool_enabled_tool_config). | false | None | None |
| `uri_override` | Overridden URI, if allowed by Tool. | false | None | None |

### config Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `key` | Key of the configuration item. | true | None | None |
| `value` | Value of the configuration item. | true | None | None |
