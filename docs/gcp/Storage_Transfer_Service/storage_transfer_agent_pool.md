## 🛡️ Policy Deployment Engine: `storage_transfer_agent_pool`

This section provides a concise policy evaluation for the `storage_transfer_agent_pool` resource in GCP.

Reference: [Terraform Registry – storage_transfer_agent_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_transfer_agent_pool)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `name` | The ID of the agent pool to create. The agent pool name identifies the pool used by transfer agents. | true | false | The name itself does not provide or restrict security controls, but it should still be set clearly for administration and auditability. | agent-pool-example | None |
| `display_name` | Specifies the client-defined AgentPool display name. | false | false | The display name is informational only and does not change the security posture of the resource. | Production transfer agent pool | None |
| `bandwidth_limit` | Specifies the bandwidth limit details for the agent pool. | false | true | Bandwidth controls can reduce the risk of excessive transfer throughput, network saturation, and unintended large-scale data movement. | Refer to child argument. | Refer to child argument. |
| `project` | The project in which the resource belongs. If omitted, the provider project is used. | false | true | Using the correct project is security-relevant because resources created in the wrong project may bypass intended access controls, monitoring, or governance boundaries. | my-project-123 | An unintended or unauthorized project ID. |

### bandwidth_limit Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `limit_mbps` | Bandwidth rate in megabytes per second, distributed across all the agents in the pool. | true | true | A defined bandwidth limit helps constrain transfer throughput and supports controlled data movement. | 120 | Unlimited or an out-of-policy value. |
