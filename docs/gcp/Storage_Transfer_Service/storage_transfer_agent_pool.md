## 🛡️ Policy Deployment Engine: `storage_transfer_agent_pool`

This section provides a concise policy evaluation for the `storage_transfer_agent_pool` resource in GCP.

Reference: [Terraform Registry – storage_transfer_agent_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_transfer_agent_pool)

---

## 1. Argument Reference

### `name`
- Description: (Required) The ID of the agent pool to create. The agentPoolId must meet the following requirements: * Length of 128 characters or less. * Not start with the string goog. * Start with a lowercase ASCII character, followed by: * Zero or more: lowercase Latin alphabet characters, numerals, hyphens (-), periods (.), underscores (_), or tildes (~). * One or more numerals or lowercase ASCII characters. As expressed by the regular expression: ^(?!goog)[a-z]([a-z0-9-._~]*[a-z0-9])?$.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `display_name`
- Description: (Optional) Specifies the client-specified AgentPool description.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `bandwidth_limit`
- Description: (Optional) Specifies the bandwidth limit details. If this field is unspecified, the default value is set as 'No Limit'. Structure is [documented below](#nested_bandwidth_limit).
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `project`
- Description: If it is not provided, the provider project is used. <a name="nested_bandwidth_limit"></a>The `bandwidth_limit` block supports:
- Required: 
- Policy Condition?: 
- Decision / Rationale: 

### `limit_mbps`
- Description: (Required) Bandwidth rate in megabytes per second, distributed across all the agents in the pool.
- Required: 
- Policy Condition?: 
- Decision / Rationale: 
