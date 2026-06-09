## 🛡️ Policy Deployment Engine: `storage_transfer_agent_pool`

This section provides a concise policy evaluation for the `storage_transfer_agent_pool` resource in GCP.

Reference: [Terraform Registry – storage_transfer_agent_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_transfer_agent_pool)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The ID of the Storage Transfer agent pool to create. The agent pool ID must be 128 characters or less, must not start with goog, must start with a lowercase ASCII character, and may contain lowercase letters, numbers, hyphens, periods, underscores, or tildes. | true | false | The agent pool name is an identifier for the resource. Since the name policy has been removed, this argument is documented as a required configuration field but is not currently enforced by a security policy. | agent-pool-example | goog-agent-pool |
| `display_name` | A client-specified description or display name for the Storage Transfer agent pool. | false | false | The display name is descriptive metadata only and does not control access, transfer behavior, encryption, or network exposure. | Source A to destination Z | None |
| `bandwidth_limit` | Bandwidth limit configuration for the Storage Transfer agent pool. If unset, the agent pool may operate without a configured bandwidth limit. | false | true | Bandwidth limits help prevent excessive transfer throughput, network saturation, and unintended operational impact from transfer agents. | Refer to child argument. | Refer to child argument. |

### bandwidth_limit Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `limit_mbps` | The bandwidth rate in megabytes per second distributed across all agents in the pool. | true | true | The implemented policy requires bandwidth_limit.limit_mbps to be within the approved maximum range. Excessive values can cause unsafe transfer throughput and network impact. | 250 | 5000 |
