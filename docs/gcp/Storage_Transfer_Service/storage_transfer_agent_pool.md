## 🛡️ Policy Deployment Engine: `storage_transfer_agent_pool`

This section provides a concise policy evaluation for the `storage_transfer_agent_pool` resource in GCP.

Reference: [Terraform Registry – storage_transfer_agent_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_transfer_agent_pool)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The ID of the agent pool to create. The agentPoolId must meet the following requirements: * Length of 128 characters or less. * Not start with the string goog. * Start with a lowercase ASCII character, followed by: * Zero or more: lowercase Latin alphabet characters, numerals, hyphens (-), periods (.), underscores (_), or tildes (~). * One or more numerals or lowercase ASCII characters. As expressed by the regular expression: ^(?!goog)[a-z]([a-z0-9-._~]*[a-z0-9])?$. | true | true | The agent pool name is security relevant because a policy has been implemented to enforce approved naming requirements and prevent reserved or unapproved agent pool identifiers. | agent-pool-example | goog-agent-pool |
| `display_name` | Specifies the client-specified AgentPool description. | false | false | The display name is descriptive metadata only and does not enforce access control, encryption, networking, or transfer behavior. | Example transfer agent pool | None |
| `bandwidth_limit` | Specifies the bandwidth limit details. If this field is unspecified, the default value is set as 'No Limit'. Structure is documented below (#nested_bandwidth_limit). | false | true | Bandwidth controls can reduce the risk of excessive transfer throughput, network saturation, and unintentional resource impact. | Refer to child argument. | Refer to child argument. |

### bandwidth_limit Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `limit_mbps` | Bandwidth rate in megabytes per second, distributed across all the agents in the pool. | true | true | A defined bandwidth limit helps constrain transfer throughput and supports controlled data movement. | 120 | Unlimited or an out-of-policy value. |
