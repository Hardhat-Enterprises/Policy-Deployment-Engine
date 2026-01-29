## 🛡️ Policy Deployment Engine: `gemini_code_tools_setting`

This section provides a concise policy evaluation for the `gemini_code_tools_setting` resource in GCP.

Reference: [Terraform Registry – gemini_code_tools_setting](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/gemini_code_tools_setting)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `enabled_tool` | Represents the full set of enabled tools. Structure is [documented below](#nested_enabled_tool). | true | false | Enabling tools affects functionality but not security. | None | None |
| `code_tools_setting_id` | Id of the Code Tools Setting. | true | false | Naming identifier only. | None | None |
| `labels` | Labels as key value pairs. **Note**: This field is non-authoritative, and will only manage the labels present in your configuration. Please refer to the field `effective_labels` for all of the labels present on the resource. | false | false | Metadata. Not security-related. | None | None |
| `location` | Resource ID segment making up resource `name`. It identifies the resource within its parent collection as described in https://google.aip.dev/122. | false | true | Location determines physical hosting region. | ['australia-southeast1', 'australia-southeast2'] | ['us-central1', 'asia-east1'] |
| `project` | If it is not provided, the provider project is used. | false | false | Determines resource grouping. Not security-related/ | PDE | Anything else |
| `config` |  | false | false | None | None | None |

### enabled_tool Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `account_connector` | Link to the Dev Connect Account Connector that holds the user credentials. projects/{project}/locations/{location}/accountConnectors/{account_connector_id} | false | false | References a component that stores user credentials. Just a link to creds, does not reveal them. | None | None |
| `handle` | Handle used to invoke the tool. | true | false | Identifier used for invocation only. | None | None |
| `tool` | Link to the Tool | true | false | Represents a reference to an existing tool definition, not sensitive on its own. | None | None |
| `config` | Configuration parameters for the tool. Structure is [documented below](#nested_enabled_tool_enabled_tool_config). | false | false | Not security-related. | None | None |
| `uri_override` | Overridden URI, if allowed by Tool. | false | false | Not security-related. | None | None |

### config Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `key` | Key of the configuration item. | true | false | Metadata key only. Not security related. | None | None |
| `value` | Value of the configuration item. | true | false | Value affects operational behaviour only. | None | None |
