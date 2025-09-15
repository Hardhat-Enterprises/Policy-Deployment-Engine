## 🛡️ Policy Deployment Engine: `app_engine_service_split_traffic`

This section provides a concise policy evaluation for the `app_engine_service_split_traffic` resource in GCP.

Reference: [Terraform Registry – app_engine_service_split_traffic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_service_split_traffic)

---

## Argument Reference
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `service` | The name of the service these settings apply to. | true | false | Ensure split traffic rules apply to the correct service, especially for production workloads. | service = "payments-service" with traffic routed only to approved versions. | service = "default" shared across multiple apps with traffic split incorrectly. |
| `split` | Mapping that defines fractional HTTP traffic diversion to different versions within the service. | true | false | Traffic splitting should follow staged rollout best practices to minimize security and stability risks. | Allocations sum to 1.0 with shard_by set to COOKIE for controlled rollouts. | Allocations misconfigured (not summing to 1.0) or shard_by set to RANDOM for sensitive services. |
| `migrate_traffic` | If set to true traffic will be migrated to this version. | false | false | Enable migrate_traffic only after extensive testing of the new version. | migrate_traffic = true only after canary rollout succeeds. | migrate_traffic = true immediately for an untested version. |
| `project` | If it is not provided, the provider project is used. | false | false | Explicit project definitions reduce misrouting risk across projects. | project = "secure-app-project" | Omitting project and relying on provider defaults. |

### split Block
| Argument | Description | Required | Security Impact | Rationale | Compliant | Non-Compliant |
|----------|-------------|----------|-----------------|-----------|-----------|---------------|
| `shard_by` | Mechanism used to determine which version a request is sent to. Possible values: `UNSPECIFIED`, `COOKIE`, `IP`, `RANDOM`. | false | false | Use COOKIE for user session consistency or IP for stable routing when COOKIE is not available. | shard_by = "COOKIE" for sticky session rollouts. | shard_by = "RANDOM" for production traffic. |
| `allocations` | Mapping from version IDs within the service to fractional allocations of traffic for that version. Allocations must sum to 1. | true | false | Gradually ramp up traffic allocations to new versions after validation. | allocations = { "v1": 0.9, "v2": 0.1 } with testing version limited. | allocations = { "v2": 1.0 } immediately, without staged rollout. |
