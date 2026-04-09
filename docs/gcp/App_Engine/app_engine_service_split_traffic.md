## 🛡️ Policy Deployment Engine: `app_engine_service_split_traffic`

This section provides a concise policy evaluation for the `app_engine_service_split_traffic` resource in GCP.

Reference: [Terraform Registry – app_engine_service_split_traffic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_service_split_traffic)

---

## Argument Reference  

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service` | The name of the service these settings apply to. | true | true | To ensure that traffic splitting configurations are explicitly mapped to the correct logical microservice. | hardhat-main-api | generic-api |
| `split` | Mapping that defines fractional HTTP traffic diversion to different versions within the service. Structure is [documented below](#nested_split). | true | true | To ensure that traffic distribution is managed as code and providing an automated way to transition users to new versions while maintaining a clear record of routing logic. | None | None |
| `migrate_traffic` | If set to true traffic will be migrated to this version. | false | true | Allowing to ensure the system to warm up new instances and preventing sudden latency spikes for users during a deployment. | false | true |
| `project` | If it is not provided, the provider project is used. | false | false | To automatically inherit the provider-level project ID. | None | None |

### split Block

| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `shard_by` | Mechanism used to determine which version a request is sent to. The traffic selection algorithm will be stable for either type until allocations are changed. Possible values are: `UNSPECIFIED`, `COOKIE`, `IP`, `RANDOM`. | false | true | To define how traffic is distributed through versions, ensuring that users have a consistent experience by consistently routing them to the same version based on their IP address. | IP | RANDOM |
| `allocations` | Mapping from version IDs within the service to fractional (0.000, 1] allocations of traffic for that version. Each version can be specified only once, but some versions in the service may not have any traffic allocation. Services that have traffic allocated cannot be deleted until either the service is deleted or their traffic allocation is removed. Allocations must sum to 1. Up to two decimal place precision is supported for IP-based splits and up to three decimal places is supported for cookie-based splits. | true | true | Ensuring to provide precise control over the percentage of traffic directed to specific versions. | v1 = 0.8 v2 = 0.2 | v1 = 0.0 v2 = 1.0 |
