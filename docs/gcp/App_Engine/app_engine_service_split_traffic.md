## 🛡️ Policy Deployment Engine: `app_engine_service_split_traffic`

This section provides a concise policy evaluation for the `app_engine_service_split_traffic` resource in GCP.

Reference: [Terraform Registry – app_engine_service_split_traffic](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/app_engine_service_split_traffic)

---

## Argument Reference
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `service` | The name of the service these settings apply to. | true | None | None |
| `migrate_traffic` | If set to true traffic will be migrated to this version. | false | None | None |
| `project` | If it is not provided, the provider project is used. | none | None | None |

### split Block
| Argument | Description | Mandatory | Security Impact | Rationale |
|----------|------------|-----------|----------------|-----------|
| `shard_by` | Mechanism used to determine which version a request is sent to. The traffic selection algorithm will be stable for either type until allocations are changed. Possible values are: `UNSPECIFIED`, `COOKIE`, `IP`, `RANDOM`. | false | None | None |
| `allocations` | Mapping from version IDs within the service to fractional (0.000, 1] allocations of traffic for that version. Each version can be specified only once, but some versions in the service may not have any traffic allocation. Services that have traffic allocated cannot be deleted until either the service is deleted or their traffic allocation is removed. Allocations must sum to 1. Up to two decimal place precision is supported for IP-based splits and up to three decimal places is supported for cookie-based splits. | true | None | None |
