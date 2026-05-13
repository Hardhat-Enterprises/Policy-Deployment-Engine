## 🛡️ Policy Deployment Engine: `storage_transfer_agent_pool`

This section provides a concise policy evaluation for the `storage_transfer_agent_pool` resource in GCP.

Reference: [Terraform Registry – storage_transfer_agent_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_transfer_agent_pool)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The ID of the agent pool to create. The agentPoolId must meet the following requirements: * Length of 128 characters or less. * Not start with the string goog. * Start with a lowercase ASCII character, followed by: * Zero or more: lowercase Latin alphabet characters, numerals, hyphens (-), periods (.), underscores (_), or tildes (~). * One or more numerals or lowercase ASCII characters. As expressed by the regular expression: ^(?!goog)[a-z]([a-z0-9-._~]*[a-z0-9])?$. | true | false | None | None | None |
| `display_name` | Specifies the client-specified AgentPool description. | false | false | None | None | None |
| `bandwidth_limit` | Specifies the bandwidth limit details. If this field is unspecified, the default value is set as 'No Limit'. Structure is [documented below](#nested_bandwidth_limit). | false | false | None | None | None |
| `project` | If it is not provided, the provider project is used. | false | false | None | None | None |

### bandwidth_limit Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `limit_mbps` | Bandwidth rate in megabytes per second, distributed across all the agents in the pool. | true | false | None | None | None |
