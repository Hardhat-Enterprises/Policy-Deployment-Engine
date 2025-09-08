## 🛡️ Policy Deployment Engine: `storage_transfer_agent_pool`

This section provides a concise policy evaluation for the `storage_transfer_agent_pool` resource in GCP.

Reference: [Terraform Registry – storage_transfer_agent_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_transfer_agent_pool)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `name` | The ID of the agent pool to create. The agentPoolId must meet the following requirements: * Length of 128 characters or less. * Not start with the string goog. * Start with a lowercase ASCII character, followed by: * Zero or more: lowercase Latin alphabet characters, numerals, hyphens (-), periods (.), underscores (_), or tildes (~). * One or more numerals or lowercase ASCII characters. As expressed by the regular expression: ^(?!goog)[a-z]([a-z0-9-._~]*[a-z0-9])?$. | true | None | None |
| `display_name` | Specifies the client-specified AgentPool description. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### bandwidth_limit Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `limit_mbps` | Bandwidth rate in megabytes per second, distributed across all the agents in the pool. | true | None | None |
